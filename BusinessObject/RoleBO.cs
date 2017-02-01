using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Created by Ei Yadanar Kyaw
namespace BusinessObject
{
    public class RoleBO
    {
        private string roleName;

        public RoleBO(string roleName)
        {
            this.RoleName = roleName;
        }
        public RoleBO()
        {

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
