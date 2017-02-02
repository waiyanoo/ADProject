using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using BusinessLogic;

namespace Team11AD
{
    public partial class Trend_Analysis : System.Web.UI.Page
    {
        RequestAdjustmentBL rabl = new RequestAdjustmentBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddcategory.DataSource = rabl.GetCategory();
                ddcategory.DataTextField = "CategoryName";
                ddcategory.DataValueField = "CategoryName";
                ddcategory.DataBind();
                ddcategory.Items.Insert(0, new ListItem("Select Category", String.Empty));
                ddcategory.SelectedIndex = 0;
                
            }
            
        }

        protected void Show_Click(object sender, EventArgs e)
        {


            List<ListItem> selected = cbkDepartment.Items.Cast<ListItem>().Where(li => li.Selected).ToList();
            string s = null;
            foreach(var d in selected)
            {
                s += "'"+d.Value+ "', ";
            }
            s = s.Remove(s.Length - 2);

            if (firstdate.Text == "")
            {
                Label1.Text = "Please Select the First Date";
                
            }
            else if(seconddate.Text == "")
            {
                Label1.Text = "Please Select the Second Date";
            }
            else if(thirddate.Text == "") {
                Label1.Text = "Please Select the Third Date";
            }
            else if (s == null)
            {
                Label1.Text = "Please Select the Department";
            }
            else if(dditemdescription.SelectedValue.ToString() == null)
            {
                Label1.Text = "Please Select the Category";
            }
            else
            {
                string fsdate = firstdate.Text + "-01";
                string fedate = addenddate(firstdate.Text);

                string ssdate = seconddate.Text + "-01";
                string tsdate = thirddate.Text + "-01";

                string sedate = addenddate(seconddate.Text);
                string tedate = addenddate(thirddate.Text);

                string item = dditemdescription.SelectedValue.ToString();

                string query = "SELECT	d.DepartmentName, " +
                        "SUM(CASE  WHEN r.Date BETWEEN '" + fsdate + "' AND '" + fedate + "' THEN ri.RequiredQty ELSE 0 END) FirstMonth, " +
                        "SUM(CASE  WHEN r.Date BETWEEN '" + ssdate + "' AND '" + sedate + "' THEN ri.RequiredQty ELSE 0 END) SecondMonth, " +
                        "SUM(CASE  WHEN r.Date BETWEEN '" + tsdate + "' AND '" + tedate + "'THEN ri.RequiredQty ELSE 0 END) ThirdMonth " +
                        "FROM RequisitionItem ri, Requisition r, [User] " +
                        "u, Department d " +
                        "WHERE ri.RequisitionID = r.RequisitionID " +
                        "AND r.UserID = u.UserID " +
                        "AND u.DepartmentID = d.DepartmentID " +
                        "AND ri.ItemID = '"+item+"' " +
                        "AND d.DepartmentID IN ( "+s+") " +
                        "GROUP BY d.DepartmentName";
                //                
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

        protected string addenddate(string s)
        {
            string[] parts = s.Split('-');
            switch (parts[1])
            {
                case "01":
                case "03":
                case "05":
                case "07":
                case "08":
                case "10":
                case "12":
                s = s + "-31";
                    return s;
                case "04":
                case "06":
                case "09":
                case "11":
                    s = s + "-30";
                    return s;
                default:
                    s = s + "-28";
                    return s;
            }
        }

        protected void ddcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string category = ddcategory.SelectedValue;
            dditemdescription.DataSource = rabl.GetItem(category);
            dditemdescription.DataTextField = "Description";
            dditemdescription.DataValueField = "ItemID";
            dditemdescription.DataBind();
            dditemdescription.Items.Insert(0, new ListItem("Select Item Description", String.Empty));
            dditemdescription.SelectedIndex = 0;
        }
    }
}