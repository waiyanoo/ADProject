using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class DeliverOrderDA
    {
        LogicUniversityEntities context = new LogicUniversityEntities();
        public List<PurchaseOrder> FindPONumber()
        {
            return context.PurchaseOrders.Where(x => x.DeliveryDate == null).ToList();
        }

        public List<PurchaseItem> FindPurchaseItem(String ponumber)
        {
            return context.PurchaseItems.Where(x=> x.PONo == ponumber).ToList();
        }

        public void SaveDeliverOrder (string ponumber, string deliverno, DateTime deliverydate)
        {
            PurchaseOrder po = context.PurchaseOrders.Where(x => x.PONo == ponumber).First();
            po.DeliveryDate = deliverydate;
            po.DONo = deliverno;
            
            context.SaveChanges();
        }
    }
}
