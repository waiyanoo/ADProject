using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccess;

namespace BusinessLogic
{
    public class ViewRequisitionBL : IComparer<RequisitionBO>
    {
        //instantiate data access object
        ViewRequisitionDA vrda = new ViewRequisitionDA();

        //Because Requisition.RequisitionID is type String, in database, Requisition is ordered by 1st digit of requisitionID column
        //The retrieved List<RequisitionBO> has to be sorted correctly by requisitionID, before passing to UI
        public List<RequisitionBO> getRequisitionList()
        {
            List<RequisitionBO> rList = vrda.getRequisitionList();
            rList.Sort(this);
            return rList;
        }

        //just passing along instructions to data access layer
        public Boolean deleteRequisition(String requisitionId)
        {
            Boolean deleteResult = false;
            deleteResult = vrda.deleteRequisition(requisitionId);
            return deleteResult;
        }

        //To sort List<RequisitionBO>, convert requisitionID from String to int
        public int Compare(RequisitionBO x, RequisitionBO y)
        {
            int result;
            if(Convert.ToInt32(x.RequisitionID) < Convert.ToInt32(y.RequisitionID))
            {
                result = -1;
            }
            else if(Convert.ToInt32(x.RequisitionID) > Convert.ToInt32(y.RequisitionID))
            {
                result = 1;
            }
            else
            {
                result = 0;
            }
            return result;
        }
    }
}
