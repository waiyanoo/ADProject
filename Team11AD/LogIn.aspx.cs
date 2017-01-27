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
                Session["user"] = ubo;
                RoleBO dbo = new RoleBO();
                dbo = ubo.RoleName;
                switch (dbo.RoleName.ToString())
                {
                    case "Store Clerk":
                        Response.Redirect("ViewDisbursementList.aspx");
                        break;
                    case "Store Supervisor":
                        Response.Redirect("ApproveAdjustmentRequisition.aspx");
                        break;
                    case "Store Manager":
                        Response.Redirect("ApproveAdjustmentRequisitionM.aspx");
                        break;
                    case "Department Staff":
                        Response.Redirect("ViewRequisition.aspx");
                        break;
                    case "Department Head":
                        Response.Redirect("ViewRequisitionList.aspx");
                        break;
                    


                }
                
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