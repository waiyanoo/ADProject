using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using BusinessLogic;
using System.Data;
using BusinessObject;


namespace Team11AD
{
    public partial class RequestAdjustment : System.Web.UI.Page
    {
        DataTable dt;
        RequestAdjustmentBL rabl = new RequestAdjustmentBL();
        protected void Page_Load(object sender, EventArgs e)
        { 
            if (!IsPostBack)
            {
                
                ddcategory.DataSource = rabl.GetCategory();
                ddcategory.DataTextField = "CategoryName";
                ddcategory.DataValueField = "CategoryName";
                ddcategory.DataBind();

                if (Session["AdjustItem"] == null)
                {
                    DataTable datatable = new DataTable();
                    datatable.Columns.Add("Item ID");
                    datatable.Columns.Add("Description");
                    datatable.Columns.Add("Adjustment Qty");
                    datatable.Columns.Add("Reason");
                    Session["AdjustItem"] = datatable;
                }

            }
        }

        protected void ddcategory_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string category = ddcategory.SelectedValue;
            dditemdescription.DataSource = rabl.GetItem(category);
            dditemdescription.DataTextField = "Description";
            dditemdescription.DataValueField = "ItemID";
            dditemdescription.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string qty = txtqty.Text;
            string reason = txtreason.Text;
            dt = (DataTable)Session["AdjustItem"];
            dt.Rows.Add(dditemdescription.SelectedValue.ToString(), dditemdescription.SelectedItem.ToString(), qty, reason);
            Session["AdjustItem"] = dt;
            gvItemList.DataSource = dt;
            gvItemList.DataBind();
            ClearText();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            GeneratePrimaryKey gpk = new GeneratePrimaryKey();
            String voucherno = gpk.getKeyforAdjustment();
            AdjustmentBO abo = new AdjustmentBO();
            UserBO ubo = new UserBO();
            ubo.UserID = "U001";
            abo.UserID = ubo;
            abo.VoucherNo = voucherno;
            abo.Date = DateTime.Today;
            abo.ConfirmBy = "U002";
            dt = (DataTable)Session["AdjustItem"];
            RequestAdjustmentBL rabll = new RequestAdjustmentBL();
            rabll.SaveAdjustmentVocher(abo);
            for(int i =0; i<dt.Rows.Count; i++)
            {
                ItemAdjustmentBO iabo = new ItemAdjustmentBO();
                ItemBO ibo = new ItemBO();
                
                ibo.ItemID = dt.Rows[i][0].ToString();
                iabo.ItemID = ibo;
                iabo.VoucherNo = abo;
                iabo.AdjustQty = Convert.ToInt32( dt.Rows[i][2].ToString());
                iabo.Reason= dt.Rows[i][3].ToString();
                rabll.SaveItemAdjustment(iabo);

            }
            ClearTable();
            
        }
        protected void ClearText()
        {
            txtqty.Text = "0";
            txtreason.Text = "";
            
        }
        protected void ClearTable()
        {
            Session["AdjustItem"] = null;
            DataTable datatable = new DataTable();
            datatable.Columns.Add("Item ID");
            datatable.Columns.Add("Description");
            datatable.Columns.Add("Adjustment Qty");
            datatable.Columns.Add("Reason");
            Session["AdjustItem"] = datatable;
            gvItemList.DataSource = (DataTable)Session["AdjustItem"];
            gvItemList.DataBind();
        }
    }
}

