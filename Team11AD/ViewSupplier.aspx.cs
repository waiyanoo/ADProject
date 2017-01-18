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
            if (!IsPostBack)
            {
                gvsupplier.DataSource = GetItem();
                gvsupplier.DataBind();
            }
            
        }

        public List<Supplier> GetItem()
        {
            LogicUniversityEntities context = new LogicUniversityEntities();
            return context.Suppliers.ToList<Supplier>();
        }

        protected void gvsupplier_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void gvsupplier_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvsupplier.Rows[e.RowIndex];
            SupplierBL sbl = new SupplierBL();
            sbl.DeleteSupplier(row.Cells[0].Text);
            gvsupplier.DataSource = GetItem();
            gvsupplier.DataBind();

        }

        protected void gvsupplier_RowEditing(object sender, GridViewEditEventArgs e)
        {
            String id= gvsupplier.Rows[e.NewEditIndex].Cells[0].Text;
            Response.Redirect("UpdateSupplier.aspx?id="+ id);
        }


    }
}