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
    public partial class ViewRequisition : System.Web.UI.Page
    {
        ViewRequisitionBL vrbl = new ViewRequisitionBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGridView();
            }
        }

        protected void gvrequisition_RowEditing(object sender, GridViewEditEventArgs e)
        {
            String requisitionId = gvrequisition.Rows[e.NewEditIndex].Cells[0].Text;
            Response.Redirect("UpdateRequisition.aspx?requisitionId=" + requisitionId);
        }

        protected void gvrequisition_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String requisitionId = gvrequisition.Rows[e.RowIndex].Cells[0].Text;

            Boolean deleteResult = vrbl.deleteRequisition(requisitionId);
            if (deleteResult)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Requisition Deleted')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Error! Requisition Not Deleted')", true);
            }

            loadGridView();
        }

        protected void loadGridView()
        {
            List<RequisitionBO> rList = vrbl.getRequisitionList();
            gvrequisition.DataSource = rList;
            gvrequisition.DataBind();

            

            foreach (GridViewRow row in gvrequisition.Rows)
            {
                if (row.Cells[3].Text != "Pending")
                {
                    row.Cells[4].Enabled = false;
                    row.Cells[5].Enabled = false;
                }
            }
        }

        protected void gvrequisition_PageChanging(object sender, GridViewPageEventArgs e)
        {
            gvrequisition.PageIndex = e.NewPageIndex;
            loadGridView();
        }

        protected void gvrequisition_Sorting(object sender, GridViewSortEventArgs e)
        {
            gvrequisition.Sort(e.SortExpression, SortDirection.Ascending);
            

        }

    }
}