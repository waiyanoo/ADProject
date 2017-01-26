using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using BusinessObject;
using DataAccess;

namespace Team11AD
{
    public partial class PurchaseOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<string> itemsid = (List<string>)Session["itemsid"];
                txtsupplier.Text = (string)Session["supplier"];
                List<Item> itemslist = PurchaseOrderBL.getItemsById(itemsid);
                ordergridview.DataSource = PurchaseOrderBL.GeneratePurchaseOrder(itemslist);
                ordergridview.DataBind();
                txtorderdate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                

                foreach (GridViewRow gvr in ordergridview.Rows)
                {
                    ((TextBox)gvr.FindControl("textbox1")).Text = gvr.Cells[3].Text.ToString();
                }
            }
            
               
        }


        protected void btnorder_Click(object sender, EventArgs e)
        {
            List<PurchaseItemDetailBO> purchaselist = new List<PurchaseItemDetailBO>();
            PurchaseItemDetailBO pi = new PurchaseItemDetailBO();
            string pono = new GeneratePrimaryKey().getKeyforPurchaseOrder();
            PurchaseOrderBO pobo = new PurchaseOrderBO();
            pobo.PoNo = pono;
            pobo.POdate = DateTime.Parse(txtorderdate.Text);
            SupplierBO sbo = new SupplierBO();
            sbo.SupplierID = PurchaseOrderBL.getSupplierId(txtsupplier.Text);
            pobo.SupplierID = sbo;
            PurchaseOrderBL.savePO(pobo);
            foreach (GridViewRow gvr in ordergridview.Rows)
            {
                pi.Itemno = gvr.Cells[1].Text.ToString();
                pi.Price = Double.Parse(gvr.Cells[5].Text);
                pi.Pono = pono;
                pi.Order_qty = int.Parse(((TextBox)gvr.FindControl("textbox1")).Text);
                purchaselist.Add(pi);
                PurchaseOrderBL.savePurchaseItem(purchaselist);
            }
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Order Successful')", true);
            Response.Redirect("ViewLowLevelStock.aspx");
        }
    }
}