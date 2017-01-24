using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

namespace Team11AD
{
    public partial class ViewRequisitionList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewRequisitionListBL vrbl = new ViewRequisitionListBL();
                gvrequisition.DataSource = vrbl.FindAllRequisition();
                gvrequisition.DataBind();
            }
        }

        protected void gvrequisition_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string requisitionid = gvrequisition.Rows[e.NewEditIndex].Cells[0].Text.ToString();
            Response.Redirect("ViewRequisitionDetail.aspx?requisitionid=" + requisitionid);
        }
    }
}