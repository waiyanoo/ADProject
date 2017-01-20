using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

namespace Team11AD
{
    public partial class ApproveAdjustmentRequest : System.Web.UI.Page
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
            }
        }
        protected void ddrequestno_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}