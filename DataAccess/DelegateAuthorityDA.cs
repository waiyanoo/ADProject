using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class DelegateAuthorityDA
    {
        //service method for other methods in this class only (not referenced outside class)
        //initialises User business object with values from the entity objects passed in as parameters
        private void initialiseUserBO(UserBO uBO, User user, Role role, DepartmentBO dBO)
        {
            //not using all the fields in UserBO
            uBO.UserID = user.UserID;
            uBO.Name = user.Name;

            RoleBO rBO = new RoleBO();
            rBO.RoleName = role.RoleName;
            uBO.RoleName = rBO;

            uBO.Email = user.Email;
            uBO.DepartmentID = dBO;
            uBO.Startdate = (user.StartDate == null) ? default(DateTime) : (DateTime)user.StartDate; //if the database date is null, set to default(DateTime)
            uBO.Enddate = (user.EndDate == null) ? default(DateTime) : (DateTime)user.EndDate;
        }

        //returns the department's Department Head business object  
        public UserBO getDeptHead(DepartmentBO dBO)
        {
            UserBO uBO = new UserBO();
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                //finds the department's Department Head using the RoleName column in User table
                User user = context.Users.Where(x => x.Department.DepartmentID == dBO.DepartmentID && x.RoleName == "Department Head").FirstOrDefault();

                //initialises business object with values from the entity object
                Role role = context.Roles.Where(x => x.RoleName == user.RoleName).FirstOrDefault();
                initialiseUserBO(uBO, user, role, dBO);
            }
            return uBO;
        }

        //returns the Department using the string "userID" gotten from Session state in UI
        public DepartmentBO getDepartmentByUserID(String userID)
        {
            DepartmentBO dBO = new DepartmentBO();
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                User user = context.Users.Where(x => x.UserID == userID).FirstOrDefault();
                Department dept = user.Department;

                dBO.DepartmentID = dept.DepartmentID;
                dBO.DepartmentName = dept.DepartmentName;
            }
            return dBO;
        }

        //returns the full list of employees of that department
        public List<UserBO> getDeptEmployeeList(DepartmentBO dBO)
        {
            List<UserBO> uList = new List<UserBO>();
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                List<User> userList = context.Users.Where(x => x.Department.DepartmentID == dBO.DepartmentID).ToList();
                foreach (User user in userList)
                {
                    UserBO uBO = new UserBO();

                    //initialises business object with values from the entity object
                    Role role = context.Roles.Where(x => x.RoleName == user.RoleName).FirstOrDefault();
                    initialiseUserBO(uBO, user, role, dBO);

                    uList.Add(uBO);
                }
            }
            return uList;
        }

        //Transaction to set the startdate & enddate for 2 Users
        //For every transaction, 2 entity User objects will have their dates changed at the same time
        public int setStartEndDates(UserBO uBO1, UserBO uBO2)
        {
            int writeResult = 0;
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                User user1 = context.Users.Where(y => y.UserID == uBO1.UserID).FirstOrDefault();
                User user2 = context.Users.Where(x => x.UserID == uBO2.UserID).FirstOrDefault();

                if (user1 != null && user2 != null)
                {
                    user1.StartDate = uBO1.Startdate;
                    user1.EndDate = uBO1.Enddate;

                    user2.StartDate = uBO2.Startdate;
                    user2.EndDate = uBO2.Enddate;

                    writeResult = context.SaveChanges();
                }
            }
            return writeResult;
        }

    }
}
