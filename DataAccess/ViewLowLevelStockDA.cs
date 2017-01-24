using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class ViewLowLevelStockDA
    {
        LogicUniversityEntities ctx = new LogicUniversityEntities();

        //get low level stocks by supplier name. sp - supplier name
        public List<Item> getLowLevelStocks(string sp)
        {   // according to supplier name get supplier id
            string spid = ctx.Suppliers.Where(x => x.SupplierName == sp).Select(x => x.SupplierID).FirstOrDefault();
            //according to supplier id get items' id list
            List<string> itemsid = ctx.SupplierItems.Where(x => x.SupplierID == spid).Select(x => x.ItemID).ToList();
            List<Item> itemslist = new List<Item>();
            //add the item whose item id is in the itemsid list above into the itemslist
            foreach(var id in itemsid)
            {
                Item item = ctx.Items.Where(x => x.ItemID == id && x.CurrentQty < x.ReorderLevel).ToList().FirstOrDefault();
                itemslist.Add(item);
            }
            return itemslist;
        }

        public List<PurchaseOrder> getLowLevelStocksPOandDate(string pono)
        {
            return ctx.PurchaseOrders.Where(x => x.PONo == pono).ToList();
        }

        public List<string> getLowLevelPONo(string itemid)
        {
            return ctx.PurchaseItems.Where(x => x.ItemID == itemid).Select(x => x.PONo).ToList();
        }

        public List<string> getSupplierName()
        {
            return ctx.Suppliers.Select(x => x.SupplierName).ToList();
        }

    }

}
