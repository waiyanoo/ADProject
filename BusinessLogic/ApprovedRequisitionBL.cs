using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using BusinessObject;

namespace BusinessLogic
{
    public class ApprovedRequisitionBL
    {
        public void ApproveRequisition(RequisitionBO rbo)
        {
            ApprovedRequisitionDA arda = new ApprovedRequisitionDA();
            arda.approvedRequisition(rbo);
        }
    }
}
