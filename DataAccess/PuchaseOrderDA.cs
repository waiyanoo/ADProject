using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class PuchaseOrderDA
    {
        LogicUniversityEntities ctx = new LogicUniversityEntities();
        public List<Item> getItemsById(List<string> itemsid)
        {
            List<Item> itemlist = new List<Item>();
            foreach(var id in itemsid)
            {
                Item item = ctx.Items.Where(x => x.ItemID == id).ToList().FirstOrDefault();
                itemlist.Add(item);
            }

            return itemlist;
        }


        public void savePurchaseItem(List<PurchaseItemDetailBO> list)
        {
            PurchaseItem pi = new PurchaseItem();
            foreach(var p in list)
            {
                pi.ItemID = p.Itemno;
                pi.PONo = p.Pono;
                pi.Qty = p.Order_qty;
                pi.Price = p.Price;
                ctx.PurchaseItems.Add(pi);
            }
            ctx.SaveChanges();
        }
        public void savePO(PurchaseOrderBO po)
        {
            PurchaseOrder p = new PurchaseOrder();
            SupplierBO sbo = po.SupplierID;
            p.PONo = po.PoNo;
            p.PODate = po.POdate;
            p.SupplierID = sbo.SupplierID;
            ctx.PurchaseOrders.Add(p);
            ctx.SaveChanges();
        }

        public string getSupplierId(string name)
        {
            return ctx.Suppliers.Where(x => x.SupplierName == name).Select(x => x.SupplierID).FirstOrDefault();
        }
    }
}
