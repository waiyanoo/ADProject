using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;

namespace BusinessLogic
{
    public class EmailBL
    {
        public string getDepartmentHeadEmail(string id)
        {
            EmailDA eda = new EmailDA();
            return eda.getDepartmentHeadEmail(id);
        }

        public string getStoreClerkEmail(string id)
        {
            EmailDA eda = new EmailDA();
            return eda.getStoreClerkEmail(id);
        }
    }
}
