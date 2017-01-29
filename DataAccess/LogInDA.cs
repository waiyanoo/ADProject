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
        LogicUniversityEntities context = new LogicUniversityEntities();
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
