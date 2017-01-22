using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class ViewRequisitionDA
    {
        LogicUniversityEntities context = new LogicUniversityEntities();

        public List<RequisitionBO> getRequisitionList()
        {
            List<RequisitionBO> rList = new List<RequisitionBO>();

            //List<RequisitionItem> riList = context.RequisitionItems.Where(x => (x.RequiredQty - x.FulfilledQty) > 0).ToList();
            List<Requisition> reqList = context.Requisitions.Where(x => x.RequisitionItems.Any(y => ((y.RequiredQty - y.FulfilledQty) > 0))).ToList();

            foreach (Requisition req in reqList)
            {
                RequisitionBO rBO = new RequisitionBO();
                rBO.RequisitionID = req.RequisitionID;

                UserBO uBO = new UserBO();
                uBO.UserID = req.User.UserID;
                uBO.Name = req.User.Name;
                rBO.UserID = uBO;

                rBO.Date = (req.Date == null) ? new DateTime(1970,01,01) : (DateTime)req.Date;
                rBO.Status = req.Status;

                rList.Add(rBO);
            }
            
            return rList;
        }

        public Boolean deleteRequisition(String requisitionId)
        {
            Boolean deleteResult = false;
            Requisition requisition = context.Requisitions.Where(x => x.RequisitionID == requisitionId).FirstOrDefault();
            if (requisition != null)
            {
                context.Requisitions.Remove(requisition);
                context.SaveChanges();
                deleteResult = true;
            }
            return deleteResult;
        }

    }
}
