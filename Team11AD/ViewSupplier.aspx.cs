using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using BusinessLogic;

namespace Team11AD
{
    public partial class ViewSupplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SupplierBL sbl = new SupplierBL();
            if (!IsPostBack)
            {
                gvsupplier.DataSource = sbl.GetAllSupplier();
                gvsupplier.DataBind();
            }
            
        }


        protected void gvsupplier_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void gvsupplier_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvsupplier.Rows[e.RowIndex];
            SupplierBL sbl = new SupplierBL();
            sbl.DeleteSupplier(row.Cells[0].Text);
            gvsupplier.DataSource = sbl.GetAllSupplier();
            gvsupplier.DataBind();

        }

        protected void gvsupplier_RowEditing(object sender, GridViewEditEventArgs e)
        {
            String id= gvsupplier.Rows[e.NewEditIndex].Cells[0].Text;
            Response.Redirect("UpdateSupplier.aspx?id="+ id);
        }


    }
}