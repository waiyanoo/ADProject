using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Data;
using DataAccess;
using BusinessObject;

namespace Team11AD.View
{
    public partial class RequestRequisition : System.Web.UI.Page
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
                ddcategory.Items.Insert(0, new ListItem( "Select Category", String.Empty));
                ddcategory.SelectedIndex = 0;

                if (Session["RequestItem"] == null)
                {
                    DataTable datatable = new DataTable();
                    datatable.Columns.Add("Item ID");
                    datatable.Columns.Add("Description");
                    datatable.Columns.Add("Adjustment Qty");
                    Session["RequestItem"] = datatable;
                }

            }
        }

        protected void ddcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string category = ddcategory.SelectedValue;
            dditemdescription.DataSource = rabl.GetItem(category);
            dditemdescription.DataTextField = "Description";
            dditemdescription.DataValueField = "ItemID";
            dditemdescription.DataBind();
            dditemdescription.Items.Insert(0, new ListItem( "Select Item Description", String.Empty));
            dditemdescription.SelectedIndex = 0;
            clearText();
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            string qty = txtqty.Text;
            int n;
            bool isNumeric = int.TryParse(qty, out n);
            if (isNumeric && n > 0)
            {
                if (checkitem(dditemdescription.SelectedValue.ToString())) { 
                    dt = (DataTable)Session["RequestItem"];
                    dt.Rows.Add(dditemdescription.SelectedValue.ToString(), dditemdescription.SelectedItem.ToString(), qty);
                    Session["RequestItem"] = dt;
                    gvitemlist.DataSource = dt;
                    gvitemlist.DataBind();

                    clearText();
                }
                else
                {
                    updateitemqty(dditemdescription.SelectedValue.ToString(), txtqty.Text);
                    gvitemlist.DataSource = dt;
                    gvitemlist.DataBind();

                    clearText();
                }
            }
            else lblqty.Text = "Please Enter Numeric only";
            
        }



        protected void btnsend_Click(object sender, EventArgs e)
        {
            UserBO session = new UserBO();
            session = (UserBO)Session["user"];
            GeneratePrimaryKey gpk = new GeneratePrimaryKey();
            String requesitionid = gpk.getKeyforRequisition();
            RequisitionBO rbo = new RequisitionBO();
            UserBO ubo = new UserBO();
            ubo.UserID = session.UserID;
            rbo.UserID = ubo;
            rbo.RequisitionID = requesitionid;
            rbo.Date = DateTime.Now;
            rbo.Status = "Pending";
            RequestRequisitiionBL rrbl = new RequestRequisitiionBL();
            rrbl.SaveRequisition(rbo);
            dt = (DataTable)Session["RequestItem"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                RequisitionItemBO ribo = new RequisitionItemBO();
                ItemBO ibo = new ItemBO();
                ibo.ItemID = dt.Rows[i][0].ToString();
                ribo.RequisitionID = rbo;
                ribo.ItemID = ibo;
                ribo.FulfilledQty = 0;
                ribo.FulfilledStatus = "Pending";
                ribo.AllocatedQty = 0;
                ribo.RequiredQty = Convert.ToInt32(dt.Rows[i][2].ToString());
                rrbl.SaveItemRequisition(ribo);
                string script = "alert(\"Request Successful!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                Response.Redirect("ViewRequisition.aspx");
            }
        }

        public Boolean checkitem(string id)
        {
            dt = (DataTable)Session["RequestItem"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if(dt.Rows[i][0].ToString() == id)
                {
                    return false;
                }
            }
                return true;
        }

        public void updateitemqty(string id, string qty)
        {
            dt = (DataTable)Session["RequestItem"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][0].ToString() == id)
                {
                    dt.Rows[i][2] = Convert.ToInt32( dt.Rows[i][2].ToString()) + Convert.ToInt32(qty);
                }
            }
            Session["RequestItem"] = dt;
        }

        public void clearText()
        {
            txtqty.Text = "0";
        }

        protected void clearTable()
        {
            Session["RequestItem"] = null;
            DataTable datatable = new DataTable();
            datatable.Columns.Add("Item ID");
            datatable.Columns.Add("Description");
            datatable.Columns.Add("Adjustment Qty");
            Session["RequestItem"] = datatable;
           
            gvitemlist.DataSource = (DataTable)Session["RequestItem"];
            gvitemlist.DataBind();
        }

        protected void gvitemlist_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            String id = gvitemlist.Rows[e.RowIndex].Cells[1].Text;
            dt = (DataTable)Session["RequestItem"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][0].ToString() == id)
                {
                    dt.Rows[i].Delete();
                }
            }
            Session["RequestItem"] = dt;
            gvitemlist.DataSource = (DataTable)Session["RequestItem"];
            gvitemlist.DataBind();

        }
    }
}