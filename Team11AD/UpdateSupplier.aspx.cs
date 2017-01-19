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
    public partial class UpdateSupplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                txtname.Text = Request.QueryString["id"];
                SupplierBO sbo = new SupplierBO();
                SupplierBL sbl = new SupplierBL();
                sbo = sbl.GetSupplierbyID(Request.QueryString["id"]);
                txtid.Text = sbo.SupplierID;
                txtname.Text = sbo.SupplierName;
                txtcontactname.Text = sbo.ContactName;
                txtphone.Text = sbo.Phone;
                txtfax.Text = sbo.Fax;
                txtaddress.Text = sbo.Address;
                txtgst.Text = sbo.GSTNo1;

            }
            else
            {
                Response.Redirect("ViewSupplier.aspx");
            }
               
            
        }   
    }
}