using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;

namespace BusinessLogic
{
    public class DeliverOrderBL
    {
        DeliverOrderDA doda = new DeliverOrderDA();
        public List<PurchaseOrder> FindPONumber()
        {
            return doda.FindPONumber();
        }

        public List<PurchaseItem> FindPurchaseItem(String ponumber)
        {
            return doda.FindPurchaseItem(ponumber);
        }

        public void SaveDeliverOrder(string ponumber, string deliverno, DateTime deliverydate)
        {
            doda.SaveDeliverOrder(ponumber, deliverno, deliverydate);
        }
    }
}
