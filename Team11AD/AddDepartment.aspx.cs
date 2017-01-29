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
    public partial class Add_Department : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void Page_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            // Handle specific exception.
            if (exc is HttpUnhandledException)
            {
                Server.Transfer("GenericErrorPage.aspx", true);
            }
            // Clear the error from the server.
            Server.ClearError();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DepartmentBO department = new DepartmentBO();
            CollectionPointBO cpbo = new CollectionPointBO();
            department.DepartmentID = txtid.Text.Trim();
            department.DepartmentName = txtdname.Text.Trim();
            department.ContactName = txtcname.Text.Trim();
            department.Fax = txtfax.Text.Trim();
            department.Phone = txtphone.Text.Trim();
            department.HeadName = txthname.Text.Trim();
            cpbo.CollectionPointName = ddcollection.SelectedValue;
            department.CollectionTime = ddcollectiontime.SelectedValue;
            department.Representative = txtrep.Text.Trim();
          
            DepartmentBL dbl = new DepartmentBL();
            dbl.AddDepartment(department);
            
            Response.Redirect("ViewDepartment.aspx");

        }
    }
}