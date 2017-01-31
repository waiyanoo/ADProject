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
    public partial class ViewDisbursementDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["requisitionid"] != null)
            {
                string rId = Request.QueryString["requisitionid"];
                RIDlable.Text = rId;
                ViewRequisitionDetailBL vrbl = new ViewRequisitionDetailBL();
                EmployeeNamelable.Text = vrbl.FindDepartmentByRequsitionId(rId);

                gvrequisitiondetails.DataSource = vrbl.ShowDetails(rId);
                gvrequisitiondetails.DataBind();


                
            }
            else
            {
                Response.Redirect("ViewDisbursementList.aspx");
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewDisbursementList.aspx");
        }
    }
}