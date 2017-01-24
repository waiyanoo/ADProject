using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class ViewRequisitionDetailDA
    {
        LogicUniversityEntities context = new LogicUniversityEntities();
        public string FindDepartmentByRequsitionId (string requisitionId)
        {
            string id = context.Requisitions.Where(x => x.RequisitionID == requisitionId).Select(x => x.UserID).FirstOrDefault();
            return context.Users.Where(y => y.UserID == id).Select(y => y.Name).FirstOrDefault();
        }

        public List<ViewRequisitionDetailBO> ShowDetails(string requisitionId)
        {
            var q = (from r in context.RequisitionItems
                     where
                       r.RequisitionID == requisitionId
                     select new
                     {
                         ID = r.ItemID,
                         Desc = r.Item.Description,
                         RQty = r.RequiredQty,
                         FQty = r.FulfilledQty
                     }).ToList();
            List<ViewRequisitionDetailBO> rdlist = new List<ViewRequisitionDetailBO>();
            foreach (var data in q)
            {
                ViewRequisitionDetailBO vrdbo = new ViewRequisitionDetailBO();
                vrdbo.ItemId = data.ID;
                vrdbo.ItemDescription = data.Desc;
                vrdbo.RequiredQty = (int)data.RQty;
                vrdbo.FulfilledQty = (int)data.FQty;
                rdlist.Add(vrdbo);
            }
            return rdlist;
        }
    }
}
