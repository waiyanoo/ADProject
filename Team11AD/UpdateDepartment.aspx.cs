using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObject;
using BusinessLogic;
using DataAccess;

namespace Team11AD
{
    public partial class UpdateDepartment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    txtname.Text = Request.QueryString["id"];
                    DepartmentBO dbo = new DepartmentBO();
                    DepartmentBL dbl = new DepartmentBL();
                    dbo = dbl.GetDepartmentById(Request.QueryString["id"]);
                    CollectionPointBO cpbo = new CollectionPointBO();
                    cpbo = dbo.CollectionPointName;
                    txtdid.Text = dbo.DepartmentID;
                    txtcname.Text = dbo.ContactName;
                    txtname.Text = dbo.DepartmentName;
                    txthname.Text = dbo.HeadName;
                    txtphone.Text = dbo.Phone;
                    txtfax.Text = dbo.Fax;
                    txtctime.Text = dbo.CollectionTime;
                    txtcpoint.Text = cpbo.CollectionPointName;
                    txtrep.Text = dbo.Representative;


                }
                else
                {
                    Response.Redirect("ViewDepartment.aspx");
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            DepartmentBL DBL = new DepartmentBL();
           // DepartmentDA 

            DepartmentBO dbo1 = DBL.GetDepartmentById(txtdid.Text);
            DepartmentBL bl = new DepartmentBL();
            // string s = txthname.Text.ToString();
            CollectionPointBO cpbo = new CollectionPointBO();
            dbo1.DepartmentID = txtdid.Text.ToString();
            dbo1.ContactName = txtcname.Text;
            dbo1.DepartmentName = txtname.Text;
            dbo1.HeadName= txthname.Text;
            dbo1.Phone= txtphone.Text;
            dbo1.Fax = txtfax.Text;
            dbo1.CollectionTime= txtctime.Text;
            cpbo.CollectionPointName = txtcpoint.Text;
            dbo1.Representative= txtrep.Text;
           
            bool result=bl.updateDepartment(dbo1);

            if (result)
            {
                string message = "Updated Successfully";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("');");
                ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
            }

            Response.Redirect("ViewDepartment.aspx");

        }
    }

}

