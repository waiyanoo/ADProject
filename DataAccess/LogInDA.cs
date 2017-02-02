//Code Owner: Wai Yan Oo
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class LogInDA
    {
        //Declaring the entity framework
        LogicUniversityEntities context = new LogicUniversityEntities();

        //checking the user whether the person is already registered for the logic university system
        public UserBO checkUser(string username, string password)
        {
            UserBO ubo = new UserBO();
            DepartmentBO dbo = new DepartmentBO();
            RoleBO rbo = new RoleBO();
            var data = context.Users.Where(x => x.UserID == username && x.Password == password).FirstOrDefault();
            if (data != null)
            {
                
                ubo.UserID = data.UserID;
                dbo.DepartmentID = data.DepartmentID;
                ubo.DepartmentID = dbo;
                rbo.RoleName = data.RoleName;
                ubo.RoleName = rbo;
            }
            else
            {
                return null;
            }
            return ubo;
        }
    }
}
