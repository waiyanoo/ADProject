﻿using System;
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
            Session["user"] = null;
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
                        Response.Redirect("ApproveAdjustmentRequest.aspx");
                        break;
                    case "Store Manager":
                        Response.Redirect("ApproveAdjustmentRequisitionM.aspx");
                        break;
                    case "Department Staff":
                        DelegateAuthorityBL dabl = new DelegateAuthorityBL();
                        UserBO autho = new UserBO();
                        autho = dabl.getCurrentAuthority(dabl.getDepartmentByUserID(ubo.UserID));
                        if (autho.UserID == ubo.UserID) { Response.Redirect("ViewRequisitionList.aspx"); }
                        else Response.Redirect("ViewRequisition.aspx");
                        break;
                    case "Department Representative":
                        Response.Redirect("SetCollectionPoint.aspx");
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