using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace Team11AD
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = GetItem();
          
                GridView1.DataBind();
            }

        }

        
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        List<Item> GetItem()
        {
            LogicUniversityEntities model = new LogicUniversityEntities();
            return model.Items.ToList<Item>();
        }

        
    }
}