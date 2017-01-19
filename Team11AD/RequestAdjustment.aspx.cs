using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using BusinessLogic;
using BusinessObject;
using System.Data;

namespace Team11AD
{
    public partial class RequestAdjustment : System.Web.UI.Page
    {
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {

            
            if (!IsPostBack)
            {
                ddcategory.DataSource = getCategory();
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
            dditemdescription.DataSource = getItem(category);
            dditemdescription.DataTextField = "Description";
            dditemdescription.DataValueField = "ItemID";
            dditemdescription.DataBind();
        }


        List<Category> getCategory()
        {
            LogicUniversityEntities model = new LogicUniversityEntities();
            return model.Categories.ToList<Category>();
        }

        List<Item> getItem(string category)
        {
             
            LogicUniversityEntities model = new LogicUniversityEntities();
            return model.Items.Where(p=> p.CategoryName==category).ToList<Item>();
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

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            GeneratePrimaryKey gpk = new GeneratePrimaryKey();

            txtreason.Text = gpk.getKeyforAdjustment();
            //dt = (DataTable)Session["AdjustItem"];
            //for(int i =0; i<dt.Rows.Count; i++)
            //{

            //}
        }
    }
    }

