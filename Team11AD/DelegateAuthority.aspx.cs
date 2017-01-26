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
                loadDataFields();
            }
        }

        protected string getUserIDfromSession()
        {
            string userID;
            //string userID = Session["userID"].ToString();
            userID = "D001";
            return userID;
        }

        protected void loadDataFields()
        {
            string userID = getUserIDfromSession();

            DepartmentBO dBO = dabl.getDepartmentByUserID(userID);
            UserBO deptHead = dabl.getDeptHead(dBO);
            UserBO currentAuthority = dabl.getCurrentAuthority(dBO);
            UserBO futureAuthority = dabl.getFutureAuthority(dBO);
            List<UserBO> uList = dabl.getDeptEmployeeXHeadList(dBO);

            txtdept.Text = dBO.DepartmentName;
            txtdepthead.Text = deptHead.Name;
            txtcurrentauthority.Text = currentAuthority.Name;
            txtcurrentfromdate.Text = String.Format("{0: dd/MM/yyyy}", currentAuthority.Startdate);

            if (currentAuthority.Enddate != default(DateTime))
            {
                txtcurrenttodate.Text = String.Format("{0: dd/MM/yyyy}", currentAuthority.Enddate);
            }
            else
            {
                //txtcurrenttodate.Font.Size = 22;
                txtcurrenttodate.Text = "\u221e";
            }

            if (futureAuthority != null)
            {
                txtfutureauthority.Text = futureAuthority.Name;
                txtfuturefromdate.Text = String.Format("{0: dd/MM/yyyy}", futureAuthority.Startdate);

                if (futureAuthority.Enddate != default(DateTime))
                {
                    txtfuturetodate.Text = String.Format("{0: dd/MM/yyyy}", futureAuthority.Enddate);
                }
                else
                {
                    txtfuturetodate.Text = "\u221e";
                }
            }
            else
            {
                txtfutureauthority.Text = "-";
                txtfuturefromdate.Text = "-";
                txtfuturetodate.Text = "-";
            }

            ddemployee.DataSource = uList;
            ddemployee.DataValueField = "UserID";
            ddemployee.DataTextField = "Name";
            ddemployee.DataBind();
        }

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
            catch (NoFutureAuthorityException)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Error! Currently no Employee delegated Requisition Approval Authority')", true);
            }
            finally
            {
                loadDataFields();
            }
        }

        protected void calstartdate_SelectionChanged(object sender, EventArgs e)
        {
            txtstartdate.Text = calstartdate.SelectedDate.ToShortDateString();
        }

        protected void calenddate_SelectionChanged(object sender, EventArgs e)
        {
            txtenddate.Text = calenddate.SelectedDate.ToShortDateString();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string userID = getUserIDfromSession();
            DepartmentBO dBO = dabl.getDepartmentByUserID(userID);

            UserBO futureAuthority = new UserBO();
            futureAuthority.UserID = ddemployee.SelectedValue.ToString();
            futureAuthority.Startdate = calstartdate.SelectedDate;
            futureAuthority.Enddate = calenddate.SelectedDate;

            try
            {
                if (dabl.delegateAuthority(dBO, futureAuthority) > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Success! Requisition Approval Authority delegated')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Error! Database not changed')", true);
                }
            }
            catch (DeptHeadNotCurrentAuthorityException)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Error! Current Person authorised to approve requisitions is not Department Head')", true);
            }
            catch (FutureAuthorityAlreadyExistException)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Error! Already delegated employee. To delegate another employee, cancel current delegation first')", true);
            }
            finally
            {
                loadDataFields();
            }

        }
    }
}