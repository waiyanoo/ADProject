//Created by Ei Yadanar Kyaw

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class SupplierBO
    {
        //Declaring variables for SupplierBO
        private string supplierID;
        private string supplierName;
        private string contactName;
        private string phone;
        private string fax;
        private string address;
        private string GSTNo;

        //Getters and Setters
        public string SupplierID
        {
            get
            {
                return supplierID;
            }

            set
            {
                supplierID = value;
            }
        }

        public string SupplierName
        {
            get
            {
                return supplierName;
            }

            set
            {
                supplierName = value;
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

        public string Address
        {
            get
            {
                return address;
            }

            set
            {
                address = value;
            }
        }

        public string GSTNo1
        {
            get
            {
                return GSTNo;
            }

            set
            {
                GSTNo = value;
            }
        }

        //Declaring Constructor
        public SupplierBO(string supplierID, string supplierName, string contactName, string phone, string fax, string address, string gSTNo)
        {
            
            this.SupplierID = supplierID;
            this.SupplierName = supplierName;
            this.ContactName = contactName;
            this.Phone = phone;
            this.Fax = fax;
            this.Address = address;
            GSTNo1 = gSTNo;
        }
        public SupplierBO()
        {

        }
    }
}
