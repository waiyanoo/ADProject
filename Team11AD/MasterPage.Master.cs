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
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pDUser.Visible = false;
            pDRep.Visible = false;
            pDHedad.Visible = false;
            pSClerk.Visible = false;
            pSManager.Visible = false;
            pSsupevisor.Visible = false;
            pDHeadWA.Visible = false;
            pDRep.Visible = false;
            if (Session["user"] != null)
            {
                UserBO ubo = new UserBO();
                ubo = (UserBO)Session["user"];
                RoleBO rbo = ubo.RoleName;
                switch (rbo.RoleName)
                {
                    case "Store Clerk":
                        pSClerk.Visible = true;
                        break;
                    case "Store Supervisor":
                        pSsupevisor.Visible = true;
                        break;
                    case "Store Manager":
                        pSManager.Visible = true;
                        break;
                    case "Department Staff":
                        DelegateAuthorityBL dabl = new DelegateAuthorityBL();
                        UserBO autho = new UserBO();
                        autho = dabl.getCurrentAuthority(dabl.getDepartmentByUserID(ubo.UserID));
                        if (autho.UserID == ubo.UserID) { pDHedad.Visible = true; }
                        else pDUser.Visible = true;
                        break;
                    case "Department Head":
                        pDHedad.Visible = true;
                        break;
                    case "Department Representative":
                        pDRep.Visible = true;
                        break;
                }
            }
            else
            {
                Response.Redirect("LogIn.aspx");
            }
            
        }
    }
}