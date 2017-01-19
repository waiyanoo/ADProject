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
    public partial class SetReorderLevel : System.Web.UI.Page
    {
        SetReorderLevelBL srlbl = new SetReorderLevelBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<CategoryBO> cList = srlbl.getCategoryList();
                ddcategory.DataSource = cList;
                ddcategory.DataValueField = "CategoryName";
                ddcategory.DataTextField = "CategoryName";
                ddcategory.DataBind();
            }
        }

        protected void ddcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            CategoryBO cBO = new CategoryBO();
            cBO.CategoryName = ddcategory.SelectedValue.ToString();
            List<ItemBO> iList = srlbl.getItemList(cBO);
            dditem.DataSource = iList;
            dditem.DataValueField = "ItemID";
            dditem.DataTextField = "Description";
            dditem.DataBind();

            loadTextBoxes();
        }

        protected void dditem_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadTextBoxes();
        }

        protected void loadTextBoxes()
        {
            //get the itemID from item dropdownlist, retrieve item with that itemID from datalayer, put item's unitOfMeasure inside textbox
            String itemID = dditem.SelectedValue;
            ItemBO iBO = srlbl.getItemInfo(itemID);
            txtunit.Text = iBO.UnitOfMeasure;
            txtreorderlevel.Text = iBO.ReorderLevel.ToString();
            txtreorderqty.Text = iBO.ReorderQty.ToString();
        }

        protected void btnset_Click(object sender, EventArgs e)
        {
            String itemID = dditem.SelectedValue;
            int reorderLevel = Int32.Parse(txtreorderlevel.Text);
            int reorderQty = Int32.Parse(txtreorderqty.Text);
            Boolean writeResult = srlbl.setItemInfo(itemID, reorderLevel, reorderQty);
            if (writeResult)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Reorder Level & Reorder Qty Set')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Error! Please enter correct values')", true);
            }
        }
    }
}