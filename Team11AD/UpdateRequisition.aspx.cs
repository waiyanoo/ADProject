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
    public partial class UpdateRequisition : System.Web.UI.Page
    {
        //instantiate BusinessLogic object
        UpdateRequisitionBL urbl = new UpdateRequisitionBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //loads the gridview, showing the current Items in the Requisition
                String requisitionID = Request.QueryString["requisitionid"];
                txtrequisitionnumber.Text = requisitionID;
                txtdepartmentname.Text = urbl.getDepartment(requisitionID).DepartmentName;
                txtemployeename.Text = urbl.getEmployee(requisitionID).Name;
                loadGridView();

                //loads the Category dropdownlist with stationery categories
                List<CategoryBO> cList = urbl.getCategoryList();
                dditemcategory.DataSource = cList;
                dditemcategory.DataValueField = "CategoryName";
                dditemcategory.DataTextField = "CategoryName";
                dditemcategory.DataBind();
            }
        }

        //Delete button event. Deletes a row of data in gridview. Messagebox will pop up informing user of success/failure of delete operation.
        protected void gvrequisitionitem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String requisitionID = txtrequisitionnumber.Text;
            
            String itemID = gvrequisitionitem.Rows[e.RowIndex].Cells[1].Text;
            
            urbl.deleteRequisitionItem(requisitionID, itemID);
            loadGridView();
        }

        //Pagination
        protected void gvrequisitionitem_PageChanging(object sender, GridViewPageEventArgs e)
        {
            gvrequisitionitem.PageIndex = e.NewPageIndex;
            loadGridView();
        }

        //Populates gridview RequisitionItems with data
        protected void loadGridView()
        {
            String requisitionID = Request.QueryString["requisitionid"];
            List<RequisitionItemBO> riBO = urbl.getRequisitionItemList(requisitionID);
            gvrequisitionitem.DataSource = riBO;
            gvrequisitionitem.DataBind();
        }

        //Once a category is chosen in the Category dropDownList, the Item dropDownList will populate with data
        protected void dditemcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            CategoryBO cBO = new CategoryBO();
            cBO.CategoryName = dditemcategory.SelectedValue.ToString();

            List<ItemBO> iList = urbl.getItemList(cBO);
            dditemdescription.DataSource = iList;
            dditemdescription.DataValueField = "ItemID";
            dditemdescription.DataTextField = "Description";
            dditemdescription.DataBind();

            txtitemqty.Text = "0";
        }

        //Adds the item and qty into the list of items for that requisition
        protected void btnadd_Click(object sender, EventArgs e)
        {
            String requisitionID = txtrequisitionnumber.Text;
            String itemID = dditemdescription.SelectedValue.ToString();
            int requiredQty;
            try
            {
                requiredQty = Int32.Parse(txtitemqty.Text);
                urbl.addRequisitionItem(requisitionID, itemID, requiredQty);
            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Item already exists in list, please amend Qty in List')", true);
            }
            finally
            {
                loadGridView();
            }
        }

        //Updates at one go the whole list of items in the gridview to the database, updating the qty of each item.
        protected void btnupdate_Click(object sender, EventArgs e)
        {
            List<RequisitionItemBO> riList = new List<RequisitionItemBO>();

            bool listError = false; //indicator to see if List<RequisitionItemBO> is populated without error
            //iterates through all rows in the gridview to extract list of requisition items
            foreach(GridViewRow row in gvrequisitionitem.Rows)
            {
                RequisitionItemBO riBO = new RequisitionItemBO();

                RequisitionBO rBO = new RequisitionBO();
                rBO.RequisitionID = txtrequisitionnumber.Text;
                riBO.RequisitionID = rBO;

                ItemBO iBO = new ItemBO();
                iBO.ItemID = row.Cells[1].Text;
                riBO.ItemID = iBO;

                try
                {
                    TextBox txtQty = (TextBox)row.Cells[3].FindControl("txtQty");
                    riBO.RequiredQty = Int32.Parse(txtQty.Text); //user may enter wrong data
                    
                }
                catch(Exception)
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Please enter valid Integer value for Qty textbox')", true);
                    listError = true;
                    break; //update operation will not be called, pop-up message shows error
                }

                riList.Add(riBO);
            }

            //calls the business layer for update operation, passing in the list of requisitionItems from the gridview
            bool updateResult = false;
            if (!listError)
            {
                updateResult = urbl.updateRequisitionItems(riList);
            }

            //pop-up message to indicate success/failure of update operation
            if (updateResult)
            {
                

                Response.Write("<script>alert('Requisition Items Updated.')</script>");
                Response.Write("<script>window.location.href='ViewRequisition.aspx';</script>");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Error! Requisition Items Not Updated')", true);
            }
        }
    }
}