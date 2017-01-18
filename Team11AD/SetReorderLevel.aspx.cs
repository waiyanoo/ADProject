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
            List<CategoryBO> cList = srlbl.getCategoryList();
            ddcategory.DataSource = cList;
            ddcategory.DataValueField = "CategoryName";
            ddcategory.DataTextField = "CategoryName";
            ddcategory.DataBind();
        }

        protected void ddcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            CategoryBO cBO = new CategoryBO();
            cBO.CategoryName = ddcategory.SelectedValue;
            
        }
    }
}