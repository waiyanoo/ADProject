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
    public partial class StockCard : System.Web.UI.Page
    {
        RequestAdjustmentBL rabl = new RequestAdjustmentBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
                {
                    ddcategory.DataSource = rabl.GetCategory();
                    ddcategory.DataTextField = "CategoryName";
                    ddcategory.DataValueField = "CategoryName";
                    ddcategory.DataBind();
                    ddcategory.Items.Insert(0, new ListItem("Select Category", String.Empty));
                    ddcategory.SelectedIndex = 0;

                    

                }
            }

        protected void ddcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string category = ddcategory.SelectedValue;
            dditemdescription.DataSource = rabl.GetItem(category);
            dditemdescription.DataTextField = "Description";
            dditemdescription.DataValueField = "ItemID";
            dditemdescription.DataBind();
            dditemdescription.Items.Insert(0, new ListItem("Select Item Description", String.Empty));
            dditemdescription.SelectedIndex = 0;
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            string id = dditemdescription.SelectedValue;
            StockCardBL scbl = new StockCardBL();
            gvstock.DataSource = scbl.getStockList(id);
            gvstock.DataBind();
        }
    }
}