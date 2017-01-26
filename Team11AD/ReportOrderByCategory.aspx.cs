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
    public partial class ReportOrderByCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string ssdate = startdate.Text;
            string sedate = enddate.Text;

            if (ssdate == "")
            {
                Label1.Text = "Please Select Start Date and End Date";
            }
            else if (sedate == "")
            {
                Label1.Text = "Please Select Start Date and End Date";
            }
            else {
                Label1.Text = "";
                string query = "SELECT SUM(ri.RequiredQty) AS ItemCount, c.CategoryName FROM Item i, Category c, RequisitionItem ri, Requisition r WHERE i.CategoryName = c.CategoryName AND i.ItemID = ri.ItemID AND ri.RequisitionID = r.RequisitionID AND r.Date BETWEEN '" + ssdate + "' AND '" + sedate + "' Group BY c.CategoryName";
                SqlConnection conn = new SqlConnection("Persist Security Info=False;Integrated Security=true;Initial Catalog=LogicUniversity;Data Source=(local)");
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                // create data adapter
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable("SOBCDt");
                // this will query your database and return the result to your datatable
                da.Fill(dataTable);
                conn.Close();
                da.Dispose();
                rbOrderCat.ProcessingMode = ProcessingMode.Local;
                rbOrderCat.LocalReport.DataSources.Clear();
                rbOrderCat.LocalReport.DataSources.Add(new ReportDataSource("OrderByCategory", dataTable));
                rbOrderCat.LocalReport.Refresh();
            }
        }
    }
}