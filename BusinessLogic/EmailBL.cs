using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;//For accessing data access class

//Code owner: WAI YAN OO

namespace BusinessLogic
{
    public class EmailBL
    {
        public string getDepartmentHeadEmail(string id)
        {
            EmailDA eda = new EmailDA();
            return eda.getDepartmentHeadEmail(id); //Calling a method from EmailDA data access class
        }

        public string getStoreClerkEmail(string id)
        {
            EmailDA eda = new EmailDA();
            return eda.getStoreClerkEmail(id); //Calling a method from EmailDA data access class
        }
    }
}
