using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject; //For accessing business object class
using DataAccess; //For accessing data access class

//Code owner: WAI YAN OO

namespace BusinessLogic
{
    public class LogInBL
    {
        public UserBO checkUser(string username, string password)
        {
            LogInDA lda = new LogInDA();
            return lda.checkUser(username, password); //Calling a method from LogInDA data access class
        }
    }
}
