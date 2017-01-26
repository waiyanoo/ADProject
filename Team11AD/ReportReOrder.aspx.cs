using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace Team11AD
{
    public partial class ReportReOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "SELECT i.ItemID, i.Description, i.CurrentQty, i.ReorderLevel, i.ReorderQty, po.PONo, po.DeliveryDate FROM Item i, PurchaseOrder po, PurchaseItem p WHERE   i.ItemID = p.ItemID AND p.PONo = po.PONo Order By po.PONo";
                SqlConnection conn = new SqlConnection("Persist Security Info=False;Integrated Security=true;Initial Catalog=LogicUniversity;Data Source=(local)");
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                // create data adapter
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable("OrderDt");
                // this will query your database and return the result to your datatable
                da.Fill(dataTable);
                conn.Close();
                da.Dispose();
                rvOrder.ProcessingMode = ProcessingMode.Local;
                rvOrder.LocalReport.DataSources.Clear();
                rvOrder.LocalReport.DataSources.Add(new ReportDataSource("OrderDs", dataTable));
                rvOrder.LocalReport.Refresh();
            }
        }
    }
}