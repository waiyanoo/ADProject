using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using BusinessObject;
using System.Net.Mail;
using System.Net;

namespace Team11AD
{
    public partial class ViewRequisitionDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["requisitionid"] != null)
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
                Response.Redirect("ViewRequisitionList.aspx");
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            string rId = Request.QueryString["requisitionid"];
            RequisitionBO rbo = new RequisitionBO();
            rbo.RequisitionID = rId;
            rbo.Status = "Approved";
            ApprovedRequisitionBL rabl = new ApprovedRequisitionBL();
            rabl.ApproveRequisition(rbo);
            UserBO session = new UserBO();
            session = (UserBO)Session["user"];
            string body = "Requisition "+ rId +" has been approved.";
            sendEmail(session.UserID, "Approved" ,body);
            Response.Redirect("ViewRequisitionList.aspx");
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            string rId = Request.QueryString["requisitionid"];
            RequisitionBO rbo = new RequisitionBO();
            rbo.RequisitionID = rId;
            rbo.Status = "Reject";
            ApprovedRequisitionBL rabl = new ApprovedRequisitionBL();
            rabl.ApproveRequisition(rbo);
            UserBO session = new UserBO();
            session = (UserBO)Session["user"];
            string body = "Requisition " + rId + " has been rejected.";
            sendEmail(session.UserID, "Approved", body);
            Response.Redirect("ViewRequisitionList.aspx");
        }

        public void sendEmail(string emailto, string status, string body)
        {
            string email = null;
            
            EmailBL ebl = new EmailBL();
            if(status == "Approved")
            {
                email = ebl.getDepartmentHeadEmail(emailto) + ", " + ebl.getStoreClerkEmail(emailto);
                
            }
            else
            {
                email = ebl.getDepartmentHeadEmail(emailto);
            }
            
            using (MailMessage mm = new MailMessage("logicuniversityteam11@gmail.com", email))
            {
                mm.Subject = "Notification for Requisition";
                mm.Body = body;

                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("logicuniversityteam11@gmail.com", "team11@43");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);

            }
        }
    }
}