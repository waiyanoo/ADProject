using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

namespace Team11AD
{
    public partial class ViewAllStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewItemCatalogueBL vic = new ViewItemCatalogueBL();
                gvitemcatalog.DataSource = vic.FindAllItem();
                gvitemcatalog.DataBind();
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string itemdesc = txtsearch.Text.Trim();
            ViewItemCatalogueBL vic = new ViewItemCatalogueBL();
            gvitemcatalog.DataSource = vic.FindItem(itemdesc);
            gvitemcatalog.DataBind();
        }
    }
}