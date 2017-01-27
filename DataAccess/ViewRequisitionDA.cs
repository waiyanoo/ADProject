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
        //Retrieves list of Requisitions from database.
        public List<RequisitionBO> getRequisitionList(string id)
        {
            List<RequisitionBO> rList = new List<RequisitionBO>();

            List<Requisition> reqList = new List<Requisition>();
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                //Filters out outstanding RequisitionItem objects by checking if RequiredQty > FulfilledQty. 
                //Only the Requisitions containing these RequisitionItems are active and should be retrieved from database
                //Get the Requisitions objects which have these RequisitionItems in their RequisitionItems collection
                reqList = context.Requisitions.Where(x => x.RequisitionItems.Any(y => ((y.RequiredQty - y.FulfilledQty) > 0))).Where(x=> x.UserID == id).ToList();
                
                //loads a list of business objects to pass on to business layer
                foreach (Requisition req in reqList)
                {
                    RequisitionBO rBO = new RequisitionBO();
                    rBO.RequisitionID = req.RequisitionID;

                    UserBO uBO = new UserBO();
                    uBO.UserID = req.User.UserID;
                    uBO.Name = req.User.Name;
                    rBO.UserID = uBO; //this is an object attribute

                    rBO.Date = (req.Date == null) ? new DateTime(1970, 01, 01) : (DateTime)req.Date; //date can be null in database
                    rBO.Status = req.Status;

                    rList.Add(rBO);
                }
            }
            return rList;
        }

        //Deletes one Requisition with that particular RequisitionID, returns 'true' if successful
        public Boolean deleteRequisition(String requisitionId)
        {
            Boolean deleteResult = false;
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                Requisition requisition = context.Requisitions.Where(x => x.RequisitionID == requisitionId).FirstOrDefault();
                if (requisition != null)
                {
                    context.Requisitions.Remove(requisition);
                    context.SaveChanges();
                    deleteResult = true;
                }
            }
            return deleteResult;
        }

    }
}
