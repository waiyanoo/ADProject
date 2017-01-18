using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace Team11AD
{
    public partial class ViewItemCatalogue : System.Web.UI.Page
    {
        LogicUniversityEntities context = new LogicUniversityEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvitemcatalog.DataSource = GetItem();
                gvitemcatalog.DataBind();
            }
        }

        public List<Item> GetItem()
        {
            return context.Items.ToList<Item>();
        }
    }
}