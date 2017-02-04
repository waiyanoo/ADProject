//Code Owner: Xiong Jie

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
            

           

            var d2 = (from i in ctx.Items
                        join si in ctx.SupplierItems
                        on new { ID = i.ItemID, Price = i.Price } equals new { ID = si.ItemID, Price = si.Price } into joinedData
                        from row2 in joinedData.DefaultIfEmpty()
                        where i.CurrentQty <= i.ReorderLevel where row2.SupplierID == spid
                        select new
                        {
                            i.ItemID,
                            i.Description,
                            i.CurrentQty,
                            i.ReorderLevel,
                            i.ReorderQty,
                            i.Price,
                            i.UnitOfMeasure
                        }).ToList();
          
            foreach(var id in d2)
            {
                Item i = new Item();
                i.ItemID = id.ItemID;
                i.Description = id.Description;
                i.CurrentQty = id.CurrentQty;
                i.ReorderLevel = id.ReorderLevel;
                i.ReorderQty = id.ReorderQty;
                i.Price = id.Price;
                i.UnitOfMeasure = id.UnitOfMeasure;
                itemslist.Add(i);
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
