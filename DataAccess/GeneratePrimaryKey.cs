using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class GeneratePrimaryKey
    {
        LogicUniversityEntities context = new LogicUniversityEntities();
        public string getKeyforAdjustment()
        {
            string id = context.Adjustments.Max(i=> i.VoucherNo);
            int key =Convert.ToInt32(id)+1;
            return key.ToString();
        }

        public string getKeyforRequisition()
        {
            string id = context.RequisitionItems.Max(i => i.RequisitionID);
            int key = Convert.ToInt32(id) + 1;
            return key.ToString();
        }

        public string getKeyforPurchaseOrder()
        {
            string id = context.PurchaseOrders.Max(i => i.PONo);
            int key = Convert.ToInt32(id) + 1;
            return key.ToString();
        }
    }
}
