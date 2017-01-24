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
    public partial class SetCollectionPoint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetCollectionPointBL spbl = new SetCollectionPointBL();
                List<CollectionPointBO> cpbo = spbl.getCollectionPoint();
                ddcPoint.DataSource = cpbo;
                ddcPoint.DataValueField = "CollectionPointName";
                ddcPoint.DataTextField = "CollectionPointName";
                ddcPoint.DataBind();
                string user = "D001";
                DepartmentBO dbo = new DepartmentBO();
                CollectionPointBO cbo = new CollectionPointBO();
                
                dbo= spbl.getCollectionDatabyID(user);
                cbo = dbo.CollectionPointName;
                ddcPoint.SelectedValue = cbo.CollectionPointName;
                ddcTime.SelectedValue = dbo.CollectionTime;

            }
        }

        protected void btnSet_Click(object sender, EventArgs e)
        {
            DepartmentBO dbo = new DepartmentBO();
            CollectionPointBO cbo = new CollectionPointBO();
            dbo.CollectionTime = ddcTime.SelectedValue;
            cbo.CollectionPointName = ddcPoint.SelectedValue;
            dbo.CollectionPointName = cbo;
            SetCollectionPointBL scpbl = new SetCollectionPointBL();
            scpbl.updateCollectionPoint(dbo);
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert Box", "alert('Successfully Updated')", true);
            

        }
    }
}