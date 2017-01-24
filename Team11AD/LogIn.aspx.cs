using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObject;
using BusinessLogic;

namespace Team11AD
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = txtusername.Text;
            string password = txtpassword.Text;
            LogInBL lbl = new LogInBL();
            UserBO ubo = new UserBO();
            ubo = lbl.checkUser(username, password);
            if (ubo != null)
            {
                
            }
            else
            {
                lblmessage.Text = "Wrong Username or Password!";
                txtusername.Text = "";
                txtpassword.Text = "";
                txtusername.Focus();
            }
        }
    }
}