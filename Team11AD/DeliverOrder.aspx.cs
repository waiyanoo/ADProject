using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

namespace Team11AD
{
    public partial class DeliverOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DeliverOrderBL dobl = new DeliverOrderBL();
                ddponumber.DataSource = dobl.FindPONumber();
                ddponumber.DataTextField = "PONo";
                ddponumber.DataValueField = "PONo";
                ddponumber.DataBind();
            }
                
        }

        protected void ddponumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            DeliverOrderBL dobl = new DeliverOrderBL();

            string ponumber = ddponumber.SelectedValue;

            GridView1.DataSource = dobl.FindPurchaseItem(ponumber);
            GridView1.DataBind();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            DeliverOrderBL dobl = new DeliverOrderBL();

            string ponumber = ddponumber.SelectedValue;
            string deliverno = txtdonumber.Text.Trim();
            string deliverydate = txtdeliverydate.Text.Trim();

            dobl.SaveDeliverOrder(ponumber, deliverno, deliverydate);
        }
    }
}