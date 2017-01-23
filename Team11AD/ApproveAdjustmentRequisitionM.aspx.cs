using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

namespace Team11AD
{
    public partial class ApproveAdjustmentRequisitionM : System.Web.UI.Page
    {
        ApproveAdjustmentBL abl = new ApproveAdjustmentBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ddrequestno.DataSource = abl.GetVoucher();
                ddrequestno.DataTextField = "VoucherNo";
                ddrequestno.DataValueField = "VoucherNo";

                ddrequestno.DataBind();
                ddrequestno.Items.Insert(0, new ListItem("Select Voucher Number", String.Empty));
                ddrequestno.SelectedIndex = 0;
            }
        }
        protected void ddrequestno_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvlist.DataSource = abl.GetItemabove(ddrequestno.SelectedValue.ToString());
            gvlist.DataBind();
        }

        protected void gvlist_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string status = "Approved";
            string id = gvlist.Rows[e.NewEditIndex].Cells[0].Text;
            abl.ApproveItem(ddrequestno.SelectedValue.ToString(), id, status);
            gvlist.DataSource = abl.GetItemabove(ddrequestno.SelectedValue.ToString());
            gvlist.DataBind();
        }
    }
}