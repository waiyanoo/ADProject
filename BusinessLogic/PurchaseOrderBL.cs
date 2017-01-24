using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using System.Data;
using BusinessObject;

namespace BusinessLogic
{
    public class PurchaseOrderBL
    {
        public static List<PurchaseItemDetailBO> GeneratePurchaseOrder(List<Item> itemslist)
        {
            List<PurchaseItemDetailBO> list = new List<PurchaseItemDetailBO>();
            int i = 1;
            foreach(var item in itemslist)
            {
                PurchaseItemDetailBO p = new PurchaseItemDetailBO();
                p.Sequence = i;
                p.Itemno = item.ItemID;
                p.Description = item.Description;
                p.Recommended_reorder_qty = (int)item.ReorderQty;
                p.Order_qty = (int)item.ReorderQty;
                p.Price = (double)item.Price;
                list.Add(p);
                i++;
            }
            return list;
        }

        public static List<Item> getItemsById(List<string> list)
        {
            return new PuchaseOrderDA().getItemsById(list);
        }

        public static void savePurchaseItem(List<PurchaseItemDetailBO> list)
        {
            PuchaseOrderDA poda = new PuchaseOrderDA();
            poda.savePurchaseItem(list);
        }

        //save purchase order into database
        public static void savePO(PurchaseOrderBO po)
        {
            new PuchaseOrderDA().savePO(po);
        }

        public static string getSupplierId(string name)
        {
            return new PuchaseOrderDA().getSupplierId(name);
        }
    }
}
