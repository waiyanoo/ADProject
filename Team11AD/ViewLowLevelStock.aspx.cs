using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using DataAccess;

namespace Team11AD
{
    public partial class ViewLowLevelStock : System.Web.UI.Page
    {
        List<Item> llslist;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.DataSource = ViewLowLevelStockBL.getSupplierName();
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Select Supplier", String.Empty));
                DropDownList1.SelectedIndex = 0;
                llslist = ViewLowLevelStockBL.getLowlevelStocks(DropDownList1.SelectedValue);
                grlowlevelitem.DataSource = ViewLowLevelStockBL.generateLowLevelStockTable(llslist, DropDownList1.SelectedValue);
                grlowlevelitem.DataBind();
            }

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            List<string> itemsid = new List<string>();
            // add the choosen items' id to the list
            foreach (GridViewRow gvr in grlowlevelitem.Rows)
            {
                if (((CheckBox)gvr.FindControl("CheckBox1")).Checked)
                {
                    itemsid.Add(gvr.Cells[2].Text.ToString());
                }
            }
            if (itemsid.Any())
            {
                Session["itemsid"] = itemsid;
                Session["supplier"] = DropDownList1.SelectedValue;
                Response.Redirect("PurchaseOrder.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert Box", "alert('Please Select the Item.')", true);

            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            llslist = ViewLowLevelStockBL.getLowlevelStocks(DropDownList1.SelectedValue);
            grlowlevelitem.DataSource = ViewLowLevelStockBL.generateLowLevelStockTable(llslist, DropDownList1.SelectedValue);
            grlowlevelitem.DataBind();

        }
    }
}