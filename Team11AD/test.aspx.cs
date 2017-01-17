using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Team11AD
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> li = new List<string>();
            li.Add("rrr");
            li.Add("ddd");
            GridView1.DataSource = li;
            GridView1.DataBind();

        }

        
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}