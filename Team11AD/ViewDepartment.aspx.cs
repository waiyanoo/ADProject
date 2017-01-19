using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using BusinessObject;

namespace Team11AD
{
    public partial class ViewDepartment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DepartmentBL dbl = new DepartmentBL();

            if (!IsPostBack)
            {
                gvdepartment.DataSource = dbl.GetAllDepartment();
                gvdepartment.DataBind();
            }
            
        }

        protected void gvdepartment_RowEditing(object sender, GridViewEditEventArgs e)
        {
            
            String id = gvdepartment.Rows[e.NewEditIndex].Cells[0].Text;
            gvdepartment.EditIndex = e.NewEditIndex;
            Response.Redirect("UpdateDepartment.aspx?id=" + id);

        }

        protected void gvdepartment_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GridViewRow row = (GridViewRow)gvdepartment.Rows[e.RowIndex];
            DepartmentBL dbl = new DepartmentBL();
            dbl.DeleteDepartment(row.Cells[0].Text);
            gvdepartment.DataSource = dbl.GetAllDepartment();
            gvdepartment.DataBind();
            e.Cancel = true;

        }

        protected void gvdepartment_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            
            String departmentId = (String)gvdepartment.DataKeys[e.RowIndex].Value;
            TextBox txtdid = (TextBox)gvdepartment.Rows[e.RowIndex].FindControl("txtdid");


        }


        protected void gvdepartment_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}