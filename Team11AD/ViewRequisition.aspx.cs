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
        //instantiate BusinessLogic object
        ViewRequisitionBL vrbl = new ViewRequisitionBL();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGridView();
            }
        }

        //Edit button event. Redirects user to Edit Requisition UI.
        protected void gvrequisition_RowEditing(object sender, GridViewEditEventArgs e)
        {
            String requisitionId = gvrequisition.Rows[e.NewEditIndex].Cells[1].Text;
            Response.Redirect("UpdateRequisition.aspx?requisitionId=" + Server.UrlEncode(requisitionId));
        }

        //Delete button event. Messagebox will pop up informing user of success/failure of delete operation.
        protected void gvrequisition_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String requisitionId = gvrequisition.Rows[e.RowIndex].Cells[1].Text;

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

        //Details button event. Redirects Manager to Approve Requisition UI
        protected void gvrequisition_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnDetails")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvrequisition.Rows[index];
                String requisitionId = row.Cells[1].Text;
                Response.Redirect("UpdateRequisition.aspx?requisitionId=" + requisitionId);
            }
        }

        //populates gridview with data & initiates Edit/Cancel button settings
        protected void loadGridView()
        {
            UserBO session = new UserBO();
            session = (UserBO)Session["user"];
            List<RequisitionBO> rList = vrbl.getRequisitionList(session.UserID);
            gvrequisition.DataSource = rList;
            gvrequisition.DataBind();
            
            
            foreach (GridViewRow row in gvrequisition.Rows)
            {
                //if user is Employee => 'Details' button will be hidden
                //if user is Department Manager => 'Edit/Cancel' buttons will be hidden
                if (true)
                {
                    row.Cells[7].Visible = false;
                    gvrequisition.HeaderRow.Cells[7].Visible = false;

                    //if the requisition status is already 'Approved', user will not be able to edit or cancel requisition
                    if (row.Cells[4].Text != "Pending")
                    {
                        row.Cells[5].Enabled = false;
                        row.Cells[6].Enabled = false;
                    }
                }
                else
                {
                    row.Cells[5].Visible = false;
                    gvrequisition.HeaderRow.Cells[5].Visible = false;
                    row.Cells[6].Visible = false;
                    gvrequisition.HeaderRow.Cells[6].Visible = false;
                }
            }
        }

        //pagination
        protected void gvrequisition_PageChanging(object sender, GridViewPageEventArgs e)
        {
            gvrequisition.PageIndex = e.NewPageIndex;
            loadGridView();
        }

    }
}