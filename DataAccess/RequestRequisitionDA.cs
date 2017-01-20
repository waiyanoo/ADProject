using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;


namespace DataAccess
{
    
    public class RequestRequisitionDA
    {
        LogicUniversityEntities model = new LogicUniversityEntities();
        public void saveRequisition(RequisitionBO rbo)
        {
            Requisition r = new Requisition();
            UserBO ubo = new UserBO();
            ubo = rbo.UserID;
            r.RequisitionID = rbo.RequisitionID;
            r.UserID = ubo.UserID;
            r.Date = rbo.Date;
            r.Status = rbo.Status;
            model.Requisitions.Add(r);
            model.SaveChanges();
        }

        public void saveItemRequisition(RequisitionItemBO ribo)
        {
            ItemBO ibo = new ItemBO();
            ibo = ribo.ItemID;
            RequisitionBO rbo = new RequisitionBO();
            rbo = ribo.RequisitionID;
            RequisitionItem ri = new RequisitionItem();
            ri.ItemID = ibo.ItemID;
            ri.RequisitionID = rbo.RequisitionID;
            ri.RequiredQty = ribo.RequiredQty;
            ri.FulfilledQty = ribo.FulfilledQty;
            ri.AllocatedQty = ribo.AllocatedQty;
            ri.FulfilledStatus = ribo.FulfilledStatus;
            model.RequisitionItems.Add(ri);
            model.SaveChanges();

        }
    }
}
