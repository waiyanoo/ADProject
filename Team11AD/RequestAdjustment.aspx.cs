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
                ddcategory.Items.Insert(0, new ListItem("Select Category", String.Empty));
                ddcategory.SelectedIndex = 0;

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
            lblqty.Text = "";
            lbldesc.Text = "";
            lblcat.Text = "";
            string category = ddcategory.SelectedValue;
            dditemdescription.DataSource = rabl.GetItem(category);
            dditemdescription.DataTextField = "Description";
            dditemdescription.DataValueField = "ItemID";
            dditemdescription.DataBind();
            dditemdescription.Items.Insert(0, new ListItem("Select Item Description", String.Empty));
            dditemdescription.SelectedIndex = 0;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string qty = txtqty.Text;
            string reason = txtreason.Text;
            int n;
            bool isNumeric = int.TryParse(qty, out n);
            if(ddcategory.SelectedValue == "")
            {
                lblcat.Text = "Please Select Category";
            }
            else if(dditemdescription.SelectedValue == "")
            {
                lbldesc.Text = "Please Select Item Description";
            }
            else if (isNumeric)
            {
                if (checkitem(dditemdescription.SelectedValue.ToString()))
                {
                    lblqty.Text = "";
                    lbldesc.Text = "";
                    lblcat.Text = "";
                    dt = (DataTable)Session["AdjustItem"];
                    dt.Rows.Add(dditemdescription.SelectedValue.ToString(), dditemdescription.SelectedItem.ToString(), qty, reason);
                    Session["AdjustItem"] = dt;
                    gvItemList.DataSource = dt;
                    gvItemList.DataBind();
                    ClearText();
                }
                else
                {
                    lblqty.Text = "";
                    lbldesc.Text = "";
                    lblcat.Text = "";
                    updateitemqty(dditemdescription.SelectedValue.ToString(), txtqty.Text);
                    gvItemList.DataSource = dt;
                    gvItemList.DataBind();

                    ClearText();
                }
            }
            else lblqty.Text = "Please Enter Numeric only";

            
            
           

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            dt = (DataTable)Session["AdjustItem"];
            if (dt.Rows.Count != 0)
            {
                GeneratePrimaryKey gpk = new GeneratePrimaryKey();
                String voucherno = gpk.getKeyforAdjustment();
                AdjustmentBO abo = new AdjustmentBO();
                UserBO session = new UserBO();
                session = (UserBO)Session["user"];
                UserBO ubo = new UserBO();
                ubo.UserID = session.UserID;
                abo.UserID = ubo;
                abo.VoucherNo = voucherno;
                abo.Date = DateTime.Today;
                abo.ConfirmBy = "U002";

                RequestAdjustmentBL rabll = new RequestAdjustmentBL();
                rabll.SaveAdjustmentVocher(abo);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ItemAdjustmentBO iabo = new ItemAdjustmentBO();
                    ItemBO ibo = new ItemBO();

                    ibo.ItemID = dt.Rows[i][0].ToString();
                    iabo.ItemID = ibo;
                    iabo.VoucherNo = abo;
                    iabo.AdjustQty = Convert.ToInt32(dt.Rows[i][2].ToString());
                    iabo.Reason = dt.Rows[i][3].ToString();
                    rabll.SaveItemAdjustment(iabo);

                }
                ClearTable();
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Request Successful!')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Please Add Item First!')", true);
            }
            
            
        }
        protected void ClearText()
        {
            txtqty.Text = "0";
            txtreason.Text = "";
            lblqty.Text = "";


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

        protected void gvItemList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            String id = gvItemList.Rows[e.RowIndex].Cells[1].Text;
            dt = (DataTable)Session["AdjustItem"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][0].ToString() == id)
                {
                    dt.Rows[i].Delete();
                }
            }
            Session["AdjustItem"] = dt;
            gvItemList.DataSource = (DataTable)Session["AdjustItem"];
            gvItemList.DataBind();
        }
        public Boolean checkitem(string id)
        {
            dt = (DataTable)Session["AdjustItem"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][0].ToString() == id)
                {
                    return false;
                }
            }
            return true;
        }

        public void updateitemqty(string id, string qty)
        {
            dt = (DataTable)Session["AdjustItem"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][0].ToString() == id)
                {
                    dt.Rows[i][2] = Convert.ToInt32(dt.Rows[i][2].ToString()) + Convert.ToInt32(qty);
                }
            }
            Session["AdjustItem"] = dt;
        }
    }


}

