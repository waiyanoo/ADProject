using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class EmailDA
    {
        LogicUniversityEntities context = new LogicUniversityEntities();
        public string getDepartmentHeadEmail(string id)
        {
            var email = (from u1 in context.Users
                         join
                         u2 in context.Users on u1.DepartmentID equals u2.DepartmentID
                         where u2.RoleName == "Department Head"
                         where u1.UserID == id
                         select new
                         {
                             email = u2.Email
                         }).FirstOrDefault();
            if(email != null)
            {
               return email.email;
            }
            else return "fail@gmail.com";
        }

        public string getStoreClerkEmail(string id)
        {
            var email = (from u1 in context.Users
                         join
                         d in context.Departments on u1.DepartmentID equals d.DepartmentID
                         join
                         c in context.CollectionPoints on d.CollectionPointName equals c.CollectionPointName 
                         join
                         u2 in context.Users on c.UserID equals u2.UserID
                         where u1.UserID == id
                         select new
                         {
                             email = u2.Email
                         }).FirstOrDefault();
            if (email != null)
            {
                return email.email;
            }
            else return "fail@gmail.com";
        }
    }
}
