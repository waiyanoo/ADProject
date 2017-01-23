using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObject;
using BusinessLogic;





namespace Team11AD
{
    public partial class AddSupplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SupplierBO supplier = new SupplierBO();
            supplier.SupplierID = txtcode.Text.Trim();
            supplier.SupplierName = txtname.Text.Trim();
            supplier.ContactName = txtcontactname.Text.Trim();
            supplier.Phone = txtphone.Text.Trim();
            supplier.Fax = txtfax.Text.Trim();
            supplier.Address = txtaddress.Text.Trim();
            supplier.GSTNo1 = txtgst.Text.Trim();
            SupplierBL sbl = new SupplierBL();
            sbl.AddSupplier(supplier);

            txtcode.Text = "";
            txtname.Text = "";
            txtcontactname.Text = "";
            txtphone.Text = "";
            txtfax.Text = "";
            txtgst.Text = "";
            txtaddress.Text = "";
            

        }
    }
}