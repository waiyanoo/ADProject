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
    public partial class UpdateDepartment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                DepartmentBO dbo = new DepartmentBO();
                txtdid.Text = dbo.DepartmentID;
                txtname.Text = dbo.DepartmentName;
                txtcname.Text = dbo.ContactName;
                txtphone.Text = dbo.Phone;
                txtfax.Text = dbo.Fax;
                txthname.Text = dbo.HeadName;
                txtcpoint.Text = dbo.CollectionPoint;
                txtctime.Text = dbo.CollectionTime;
                txtrep.Text = dbo.Representative;
            }

            else
            {
                Response.Redirect("ViewDepartment.aspx");
            }

        }

    }
}

