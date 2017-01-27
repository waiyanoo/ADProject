using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class ApprovedRequisitionDA
    {
        LogicUniversityEntities context = new LogicUniversityEntities();
        public void approvedRequisition(RequisitionBO rbo)
        {
            Requisition r = new Requisition();
            var v = context.Requisitions.Where(x => x.RequisitionID == rbo.RequisitionID).FirstOrDefault();
            v.RequisitionID = rbo.RequisitionID;
            v.Status = rbo.Status;
            context.SaveChanges();
        }
    }
}
