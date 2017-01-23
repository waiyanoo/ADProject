using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class DepartmentBO
    {
        private string departmentID;
        private string departmentName;
        private string contactName;
        private string phone;
        private string fax;
        private string headName;
        private CollectionPointBO collectionPointName;
        private string collectionTime;
        private string representative;

       
        

        public DepartmentBO(string departmentID, string departmentName, string contactName, string phone, string fax, string headName, CollectionPointBO collectionPointName, string collectionTime, string representative)
        {
            this.departmentID = departmentID;
            this.departmentName = departmentName;
            this.contactName = contactName;
            this.phone = phone;
            this.fax = fax;
            this.headName = headName;
            this.CollectionPointName = collectionPointName;
            this.collectionTime = collectionTime;
            this.representative = representative;
        }
        public DepartmentBO()
        {

        }
        public string DepartmentID
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

        public string DepartmentName
        {
            get
            {
                return departmentName;
            }

            set
            {
                departmentName = value;
            }
        }

        public string ContactName
        {
            get
            {
                return contactName;
            }

            set
            {
                contactName = value;
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

        public string Fax
        {
            get
            {
                return fax;
            }

            set
            {
                fax = value;
            }
        }

        public string HeadName
        {
            get
            {
                return headName;
            }

            set
            {
                headName = value;
            }
        }

        

        public string CollectionTime
        {
            get
            {
                return collectionTime;
            }

            set
            {
                collectionTime = value;
            }
        }

        public string Representative
        {
            get
            {
                return representative;
            }

            set
            {
                representative = value;
            }
        }

        public CollectionPointBO CollectionPointName
        {
            get
            {
                return collectionPointName;
            }

            set
            {
                collectionPointName = value;
            }
        }
    }
}
