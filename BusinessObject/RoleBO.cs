//Created by Ei Yadanar Kyaw

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class RoleBO
    {
        //Declaring variable
        private string roleName;

        //Declaring constructor
        public RoleBO(string roleName)
        {
            this.RoleName = roleName;
        }
        public RoleBO()
        {

        }
        //Getter and Setter
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
