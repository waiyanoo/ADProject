using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using BusinessLogic;

namespace Team11AD
{
    public partial class ViewItemCatalogue : System.Web.UI.Page
    {
        LogicUniversityEntities context = new LogicUniversityEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewItemCatalogueBL vic = new ViewItemCatalogueBL();
                List<Item> itemlist = vic.FindAllItem();

                gvitemcatalog.DataSource = itemlist;
                gvitemcatalog.DataBind();
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string itemdesc = txtsearch.Text.Trim();
            ViewItemCatalogueBL vic = new ViewItemCatalogueBL();
            List<Item> itemlist = vic.FindItem(itemdesc);

            gvitemcatalog.DataSource = itemlist;
            gvitemcatalog.DataBind();
        }
    }
}