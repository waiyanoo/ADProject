using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccess;

namespace BusinessLogic
{
    public class RequestRequisitiionBL
    {
        public void SaveRequisition(RequisitionBO rbo)
        {
            RequestRequisitionDA rrda = new RequestRequisitionDA();
            rrda.saveRequisition(rbo);
        }

        public void SaveItemRequisition(RequisitionItemBO ribo)
        {
            RequestRequisitionDA rrda = new RequestRequisitionDA();
            rrda.saveItemRequisition(ribo);
        }
    }
}
