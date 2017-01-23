using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccess;

namespace BusinessLogic
{
    public class ViewRequisitionBL
    {
        ViewRequisitionDA vrda = new ViewRequisitionDA();
        public List<RequisitionBO> getRequisitionList()
        {
            return vrda.getRequisitionList();
        }

        public Boolean deleteRequisition(String requisitionId)
        {
            Boolean deleteResult = false;
            deleteResult = vrda.deleteRequisition(requisitionId);
            return deleteResult;
        }

    }
}
