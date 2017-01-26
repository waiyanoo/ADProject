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
    public partial class ReportInventoryStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "Select * from Item";
                SqlConnection conn = new SqlConnection("Persist Security Info=False;Integrated Security=true;Initial Catalog=LogicUniversity;Data Source=(local)");
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                // create data adapter
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable("IneventoryDt");
                // this will query your database and return the result to your datatable
                da.Fill(dataTable);
                conn.Close();
                da.Dispose();
                rvInventoryStatus.ProcessingMode = ProcessingMode.Local;
                rvInventoryStatus.LocalReport.DataSources.Clear();
                rvInventoryStatus.LocalReport.DataSources.Add(new ReportDataSource("Invetory", dataTable));
                rvInventoryStatus.LocalReport.Refresh();
            }
        }
    }
}