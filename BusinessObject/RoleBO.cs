using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class RoleBO
    {
        private string roleName;

        public RoleBO(string roleName)
        {
            this.RoleName = roleName;
        }

        public string RoleName
        {
            get
            {
                return roleName;
            }

            set
            {
                roleName = value;
            }
        }
    }
}
