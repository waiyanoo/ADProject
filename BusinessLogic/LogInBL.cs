using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccess;

namespace BusinessLogic
{
    public class LogInBL
    {
        public UserBO checkUser(string username, string password)
        {
            LogInDA lda = new LogInDA();
            return lda.checkUser(username, password);
        }
    }
}
