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
    public partial class ViewDisbursementList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UserBO ubo = new UserBO();
                ubo = (UserBO)Session["user"];
                string user = ubo.UserID;
                ViewRequisitionListBL vrbl = new ViewRequisitionListBL();
                gvrequisition.DataSource = vrbl.FindDisbursement(user);
                gvrequisition.DataBind();
            }
        }

        protected void gvrequisition_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string requisitionid = gvrequisition.Rows[e.NewEditIndex].Cells[1].Text.ToString();
            Response.Redirect("ViewDisbursementDetail.aspx?requisitionid=" + requisitionid);
        }
    }
}