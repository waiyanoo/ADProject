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

        protected void gvsupplier_RowEditing(object sender, GridViewEditEventArgs e)
        {
            String id= gvsupplier.Rows[e.NewEditIndex].Cells[1].Text;
            Response.Redirect("UpdateSupplier.aspx?id="+ id);
        }


    }
}