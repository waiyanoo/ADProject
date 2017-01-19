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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DepartmentBO department = new DepartmentBO();

            department.DepartmentID = txtid.Text.Trim();
            department.DepartmentName = txtdname.Text.Trim();
            department.ContactName = txtcname.Text.Trim();
            department.Fax = txtfax.Text.Trim();
            department.Phone = txtphone.Text.Trim();
            department.HeadName = txthname.Text.Trim();
            department.CollectionPoint = txtcpoint.Text.Trim();
            department.CollectionTime = txtctime.Text.Trim();
            department.Representative = txtrep.Text.Trim();
          
            DepartmentBL dbl = new DepartmentBL();
            dbl.AddDepartment(department);

           


        }
    }
}