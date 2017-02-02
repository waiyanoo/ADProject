//Code Owner: Wai Yan Oo
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    //Auto-generating the primary keys
    public class GeneratePrimaryKey
    {
        LogicUniversityEntities context = new LogicUniversityEntities();

        //Primary key for Adjustment table
        public string getKeyforAdjustment()
        {
            string id = context.Adjustments.Max(i=> i.VoucherNo);
            int key =Convert.ToInt32(id)+1;
            return key.ToString();
        }

        //Primary key for Requisition table
        public string getKeyforRequisition()
        {
            string id = context.Requisitions.Max(i => i.RequisitionID);
            int key = Convert.ToInt32(id) + 1;
            return key.ToString();
        }

        //Primary key for PurchaseOrder table
        public string getKeyforPurchaseOrder()
        {
            string id = context.PurchaseOrders.Max(i => i.PONo);
            int key = Convert.ToInt32(id) + 1;
            return key.ToString();
        }
    }
}
