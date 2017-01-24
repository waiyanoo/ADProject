using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using System.Data;

namespace BusinessLogic
{
    public class ViewLowLevelStockBL
    {
        // get the items whose current qty is bellow the reorder level according to supplier name, sp-supplier name
        public static List<Item> getLowlevelStocks(string sp)
        {
            return new ViewLowLevelStockDA().getLowLevelStocks(sp);
        }

        //get the items' purchase order number and purchase date by item id
        public static List<PurchaseOrder> getLowLevelStocksPOandDate(string itemid)
        {
            return new ViewLowLevelStockDA().getLowLevelStocksPOandDate(itemid);
        }

        //get the items' purchase order number by item id
        public static List<string> getLowLevelStocksPOno(string itemid)
        {
            return new ViewLowLevelStockDA().getLowLevelPONo(itemid);
        }

        //get the datasource of gridview. sp-supplier name, itemlist-list object of item
        public static DataTable generateLowLevelStockTable(List<Item> itemlist, string sp)
        {
            DataTable dt = new DataTable();
            int i = 1;
            //set table columns' name
            dt.Columns.Add("#");
            dt.Columns.Add("Item code");
            dt.Columns.Add("Description");
            dt.Columns.Add("Supplier");
            dt.Columns.Add("Quantity on hand");
            dt.Columns.Add("Reorder level");
            dt.Columns.Add("Reorder quantity");
            dt.Columns.Add("Unit");
            //put the data in itemlist into the table
            foreach(var item in itemlist)
            {
                DataRow dr = dt.NewRow();
                if(item != null)
                {
                    dr["#"] = i;
                    dr["Item code"] = item.ItemID.ToString();
                    dr["Description"] = item.Description.ToString();
                    dr["Supplier"] = sp;
                    dr["Quantity on hand"] = item.CurrentQty.ToString();
                    dr["Reorder level"] = item.ReorderLevel.ToString();
                    dr["Reorder quantity"] = item.ReorderQty.ToString();
                    dr["Unit"] = item.UnitOfMeasure;
                    dt.Rows.Add(dr);
                    i++;
                }
                

            }
            return dt;
        }

        //get suppliers' name
        public static List<string> getSupplierName()
        {
            return new ViewLowLevelStockDA().getSupplierName();
        }
    }
}
