using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using BusinessObject;
using DataAccess;

namespace Team11AD
{
    public partial class UpdateSupplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            
                if (Request.QueryString["id"] != null)
                {
                    txtname.Text = Request.QueryString["id"];
                    SupplierBO sbo = new SupplierBO();
                    SupplierBL sbl = new SupplierBL();
                    sbo = sbl.GetSupplierbyID(Request.QueryString["id"]);
                    txtpk.Text = sbo.SupplierID;
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            
            SupplierBO s = new SupplierBO();
            SupplierBL sbl = new SupplierBL();
            s.SupplierID = txtpk.Text;
            s.SupplierName = txtname.Text;
            s.ContactName = txtcontactname.Text;
            s.Phone = txtphone.Text;
            s.Fax = txtfax.Text;
            s.Address = txtaddress.Text;
            s.GSTNo1 = txtgst.Text;
            sbl.UpdateSupplier(s);
            
            Response.Redirect("ViewSupplier.aspx");
        }   
    }
}