using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Data.SqlClient;
using System.Data;
using BusinessLogic;

namespace Team11AD
{
    public partial class ReportOrderHistoryByDepartment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RequestAdjustmentBL rabl = new RequestAdjustmentBL();
                ddCategory.DataSource = rabl.GetCategory();
                ddCategory.DataTextField = "CategoryName";
                ddCategory.DataValueField = "CategoryName";
                ddCategory.DataBind();
                ddCategory.Items.Insert(0, new ListItem("Select Category", String.Empty));
                ddCategory.SelectedIndex = 0;
                
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string ssdate = startdate.Text;
            string sedate = enddate.Text;
            string category = ddCategory.SelectedValue;
            if (ssdate == "")
            {
                Label1.Text = "Please Select Start Date and End Date";
            }
            else if (sedate == "")
            {
                Label1.Text = "Please Select Start Date and End Date";
            }
            else if(ddCategory.SelectedValue == "")
            {
                Label1.Text = "Please Select Category";
            }
            else
            {
                Label1.Text = "";

                string query = "SELECT SUM(ri.RequiredQty) AS ItemCount, c.CategoryName, d.DepartmentName FROM Item i, Category c, RequisitionItem ri, Requisition r, [User] u, Department d WHERE	i.CategoryName = c.CategoryName AND		i.ItemID = ri.ItemID AND		ri.RequisitionID = r.RequisitionID AND u.DepartmentID = d.DepartmentID AND r.UserID = u.UserID AND r.Date BETWEEN '"+ssdate+"' AND '"+sedate+"' AND c.CategoryName = '"+category+"' GROUP BY c.CategoryName, d.DepartmentName";
                SqlConnection conn = new SqlConnection("Persist Security Info=False;Integrated Security=true;Initial Catalog=LogicUniversity;Data Source=(local)");
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                // create data adapter
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable("SOBDDt");
                // this will query your database and return the result to your datatable
                da.Fill(dataTable);
                conn.Close();
                da.Dispose();
                rvOrderReport.ProcessingMode = ProcessingMode.Local;
                rvOrderReport.LocalReport.DataSources.Clear();
                rvOrderReport.LocalReport.DataSources.Add(new ReportDataSource("OrderByDept", dataTable));
                rvOrderReport.LocalReport.Refresh();
            }
        }
    }
}