using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Created by Ei Yadanar Kyaw
namespace BusinessObject
{
   public class UserBO
    {
        private string userID;
        private string password;
        private string name;
        private string email;
        private string phone;
        private string whatsapp;
        private string image;
        private DepartmentBO departmentID;
        private RoleBO roleName;
        private DateTime startdate;
        private DateTime enddate;

        public string UserID
        {
            get
            {
                return userID;
            }

            set
            {
                userID = value;
            }
        }

        public string Password
        {
            get
            {
                return password;
            }

            set
            {
                password = value;
            }
        }

        public string Name
        {
            get
            {
                return name;
            }

            set
            {
                name = value;
            }
        }

        public string Email
        {
            get
            {
                return email;
            }

            set
            {
                email = value;
            }
        }

        public string Phone
        {
            get
            {
                return phone;
            }

            set
            {
                phone = value;
            }
        }

        public string Whatsapp
        {
            get
            {
                return whatsapp;
            }

            set
            {
                whatsapp = value;
            }
        }

        public string Image
        {
            get
            {
                return image;
            }

            set
            {
                image = value;
            }
        }

        public DepartmentBO DepartmentID
        {
            get
            {
                return departmentID;
            }

            set
            {
                departmentID = value;
            }
        }

        public RoleBO RoleName
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

        public DateTime Startdate
        {
            get
            {
                return startdate;
            }

            set
            {
                startdate = value;
            }
        }

        public DateTime Enddate
        {
            get
            {
                return enddate;
            }

            set
            {
                enddate = value;
            }
        }

        public UserBO(string userID, string password, string name, string email, string phone, string whatsapp, string image, DepartmentBO departmentID, RoleBO roleName, DateTime startdate, DateTime enddate)
        {
            this.UserID = userID;
            this.Password = password;
            this.Name = name;
            this.Email = email;
            this.Phone = phone;
            this.Whatsapp = whatsapp;
            this.Image = image;
            this.DepartmentID = departmentID;
            this.RoleName = roleName;
            this.Startdate = startdate;
            this.Enddate = enddate;
        }
        public UserBO()
        {

        }
      
    }
}
