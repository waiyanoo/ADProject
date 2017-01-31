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
    public partial class DelegateAuthority : System.Web.UI.Page
    {
        //instantiate business object
        DelegateAuthorityBL dabl = new DelegateAuthorityBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userID = getUserIDfromSession();
                DepartmentBO dBO = dabl.getDepartmentByUserID(userID);
                UserBO deptHead = dabl.getDeptHead(dBO);

                //only Department Head can delegate authority. Staff will be redirected to ViewRequisition UI
                if(userID != deptHead.UserID)
                {
                   
                    Response.Write("<script>alert('You do not have authority to delegate authority. Only Department Head may access this page.')</script>");
                    Response.Write("<script>window.location.href='ViewRequisitionList.aspx';</script>");
                }

                loadDataFields(dBO);

                //dropdownlist for department employees excluding department head
                List<UserBO> uList = dabl.getDeptEmployeeXHeadList(dBO);
                ddemployee.DataSource = uList;
                ddemployee.DataValueField = "UserID";
                ddemployee.DataTextField = "Name";
                ddemployee.DataBind();

                //Authorised-From date for new delegate must be today or later
                cvalidatorstartdate.ValueToCompare = DateTime.Today.ToShortDateString();
            }
        }

        protected string getUserIDfromSession()
        {
            UserBO ubo = new UserBO();
            ubo =  (UserBO)Session["user"];
            string userID;
            userID = ubo.UserID;
            return userID;
        }

        protected void loadDataFields(DepartmentBO dBO)
        {
            UserBO deptHead = dabl.getDeptHead(dBO);
            UserBO currentAuthority = dabl.getCurrentAuthority(dBO);
            UserBO futureAuthority = dabl.getFutureAuthority(dBO);
            

            txtdept.Text = dBO.DepartmentName;
            txtdepthead.Text = deptHead.Name;

            txtcurrentauthority.Text = currentAuthority.Name;
            if(currentAuthority.UserID == deptHead.UserID)
            {
                //currentAuthority is deptHead & futureAuthority is nobody
                if(futureAuthority == null)
                {
                    txtcurrentfromdate.Text = String.Format("{0: dd/MM/yyyy}", currentAuthority.Startdate);
                    txtcurrenttodate.Text = "\u221e";

                    txtfutureauthority.Text = "-";
                    txtfuturefromdate.Text = "-";
                    txtfuturetodate.Text = "-";
                }
                //currentAuthority is deptHead & futureAuthority is staff
                else
                {
                    txtcurrentfromdate.Text = String.Format("{0: dd/MM/yyyy}", currentAuthority.Enddate);
                    txtcurrenttodate.Text = String.Format("{0: dd/MM/yyyy}", futureAuthority.Startdate.AddDays(-1));

                    txtfutureauthority.Text = futureAuthority.Name;
                    txtfuturefromdate.Text = String.Format("{0: dd/MM/yyyy}", futureAuthority.Startdate);
                    txtfuturetodate.Text = String.Format("{0: dd/MM/yyyy}", futureAuthority.Enddate);
                }
            }
            //currentAuthority is staff & futureAuthority is deptHead
            else
            {
                txtcurrentfromdate.Text = String.Format("{0: dd/MM/yyyy}", currentAuthority.Startdate);
                txtcurrenttodate.Text = String.Format("{0: dd/MM/yyyy}", currentAuthority.Enddate);

                txtfutureauthority.Text = futureAuthority.Name;
                txtfuturefromdate.Text = String.Format("{0: dd/MM/yyyy}", futureAuthority.Startdate);
                txtfuturetodate.Text = "\u221e";
            }

            
            ddemployee.ClearSelection();

            txtstartdate.Text = string.Empty;
            txtenddate.Text = string.Empty;
        }

        //cancels the delegation authority of any employee other than the department head
        //sets the currentAuthority to department head
        protected void btncanceldelegation_Click(object sender, EventArgs e)
        {
            string userID = getUserIDfromSession();

            DepartmentBO dBO = dabl.getDepartmentByUserID(userID);
            try
            {
                if (dabl.cancelDelegation(dBO) > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Department Head takes back Requisition Approval Authority')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Error! Database not changed')", true);
                }
            }
            catch (NoFutureAuthorityException) //must have a futureAuthority to cancel delegation
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Department Head already holds Requisition Approval Authority')", true);
            }
            finally
            {
                loadDataFields(dBO);
            }
        }

        protected void btndelegate_Click(object sender, EventArgs e)
        {
            string userID = getUserIDfromSession();
            DepartmentBO dBO = dabl.getDepartmentByUserID(userID);

            UserBO futureAuthority = new UserBO();
            futureAuthority.UserID = ddemployee.SelectedValue.ToString();
            futureAuthority.Startdate = DateTime.Parse(txtstartdate.Text);
            futureAuthority.Enddate = DateTime.Parse(txtenddate.Text);

            try
            {
                if (dabl.delegateAuthority(dBO, futureAuthority) > 0)
                {
                    //success in writing to database 
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Success! Requisition Approval Authority delegated')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Error! Database not changed')", true);
                }
            }
            catch (DeptHeadNotCurrentAuthorityException) //currentAuthority must be department head to cancel delegation
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Error! Already delegated employee. To delegate another employee, cancel current delegation first')", true);
            }
            catch (FutureAuthorityAlreadyExistException) //cannot assign more than 1 futureAuthority
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Error! Already delegated employee. To delegate another employee, cancel current delegation first')", true);
            }
            finally
            {
                loadDataFields(dBO);
            }

        }
    }
}