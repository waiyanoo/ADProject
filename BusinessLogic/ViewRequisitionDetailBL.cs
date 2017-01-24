using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using BusinessObject;

namespace BusinessLogic
{
    public class ViewRequisitionDetailBL
    {
        public string FindDepartmentByRequsitionId(string requsitionId)
        {
            ViewRequisitionDetailDA vrda = new ViewRequisitionDetailDA();
            return vrda.FindDepartmentByRequsitionId(requsitionId);
        }

        public List<ViewRequisitionDetailBO> ShowDetails(string requisitionId)
        {
            ViewRequisitionDetailDA vrda = new ViewRequisitionDetailDA();
            return vrda.ShowDetails(requisitionId);
        }
    }
}
