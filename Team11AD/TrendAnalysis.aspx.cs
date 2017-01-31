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
    public partial class Trend_Analysis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "SELECT	d.DepartmentName, " +
        "SUM(CASE  WHEN r.Date BETWEEN '2016-10-01' AND '2016-10-31' THEN ri.RequiredQty ELSE 0 END) FirstMonth, " +
        "SUM(CASE  WHEN r.Date BETWEEN '2016-11-01' AND '2016-11-30' THEN ri.RequiredQty ELSE 0 END) SecondMonth, " +
        "SUM(CASE  WHEN r.Date BETWEEN '2016-12-01' AND '2016-12-31' THEN ri.RequiredQty ELSE 0 END) ThirdMonth " +
        "FROM RequisitionItem ri, Requisition r, [User] " +
        "u, Department d " +
        "WHERE ri.RequisitionID = r.RequisitionID " +
        "AND r.UserID = u.UserID " +
        "AND u.DepartmentID = d.DepartmentID " +
        "AND ri.ItemID = 'C001' " +
        "AND d.DepartmentID IN ( 'BIOL' , 'COMM', 'BIZM', 'CPSC', 'ENGL', 'REGR', 'STORE') " +
        "GROUP BY d.DepartmentName";
                query = "SELECT	d.DepartmentName, " + 
" CASE WHEN  r.Date BETWEEN '2016-10-01' AND '2016-10-31' THEN 'October' ELSE " + 
" CASE WHEN r.Date BETWEEN '2016-11-01' AND '2016-11-30' THEN 'November' ELSE " + 
" CASE  WHEN r.Date BETWEEN '2016-12-01' AND '2016-12-31' THEN 'December' ELSE '' " + 
" END END END AS[MMonth] " + 
" , SUM(ri.RequiredQty)AS E " + 
" FROM    RequisitionItem ri, Requisition r, [User] u, Department d " + 
" WHERE   ri.RequisitionID = r.RequisitionID " + 
" AND     r.UserID = u.UserID " + 
" AND     u.DepartmentID = d.DepartmentID " + 
" AND     ri.ItemID = 'C001' " + 
" AND     d.DepartmentID IN('BIOL', 'COMM', 'BIZM', 'CPSC', 'ENGL', 'REGR', 'STORE') " + 
" GROUP BY d.DepartmentName, CASE  WHEN  r.Date  BETWEEN '2016-10-01' AND '2016-10-31' THEN 'October' ELSE " + 
" CASE WHEN r.Date BETWEEN '2016-11-01' AND '2016-11-30' THEN 'November' ELSE " + 
" CASE  WHEN r.Date BETWEEN '2016-12-01' AND '2016-12-31' THEN 'December' ELSE '' " +
" END END END ORDER BY DepartmentName, MMONTH";
                SqlConnection conn = new SqlConnection("Persist Security Info=False;Integrated Security=true;Initial Catalog=LogicUniversity;Data Source=(local)");
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                // create data adapter
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable("TrendDt");
                // this will query your database and return the result to your datatable
                da.Fill(dataTable);
                conn.Close();
                da.Dispose();
                rvtrend.ProcessingMode = ProcessingMode.Local;
                rvtrend.LocalReport.DataSources.Clear();
                rvtrend.LocalReport.DataSources.Add(new ReportDataSource("TrendDS", dataTable));
                rvtrend.LocalReport.Refresh();
            }
            
        }
    }
}