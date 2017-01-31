using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using BusinessObject;

namespace BusinessLogic
{
    public class ViewRequisitionListBL
    {
        public List<ViewRequsitionListBO> FindAllRequisition(UserBO ubo)
        {
           
            ViewRequisitionListDA vrda = new ViewRequisitionListDA();
            return vrda.FindAllRequisition(ubo);
        }

        public List<ViewRequsitionListBO> FindDisbursement()
        {
            ViewRequisitionListDA vrda = new ViewRequisitionListDA();
            return vrda.FindDisbursementlist();
        }
    }
}
