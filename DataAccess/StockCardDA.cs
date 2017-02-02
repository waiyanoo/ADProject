//Code Owner: Wai Yan Oo
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class StockCardDA
    {
        //Declaring entity framework
        LogicUniversityEntities context = new LogicUniversityEntities();

        //getting the list of stock
        //select an item to check the transaction of that item like purchase order quantity of that item, 
        //and how much each deaprtment has ordered
        public List<StockCardBO> getStocklist(string id)
        {
            List<StockCardBO> list = new List<StockCardBO>();
            var data = (from PC in context.PurchaseItems
                        join PO in context.PurchaseOrders on PC.PONo equals PO.PONo
                        join S in context.Suppliers on PO.SupplierID equals S.SupplierID
                        where PC.ItemID == id
                        select new
                        {
                            ItemID = PC.ItemID,
                            TDate = PO.PODate,
                            Description = S.SupplierName,
                            DQty = PC.Qty
                        }).Union(

                       from IA in context.ItemAdjustments
                       join A in context.Adjustments on IA.VoucherNo equals A.VoucherNo
                       where IA.ItemID == id
                       select new
                       {
                           ItemID = IA.ItemID,
                           TDate = A.Date,
                           Description = "Adjustment",
                           DQty = IA.AdjustedQty
                       }).Union(
                       from RI in context.RequisitionItems
                       join R in context.Requisitions on RI.RequisitionID equals R.RequisitionID
                       join U in context.Users on R.UserID equals U.UserID
                       join D in context.Departments on U.DepartmentID equals D.DepartmentID
                       where RI.ItemID == id
                       select new
                       {
                           ItemID = RI.ItemID,
                           TDate = R.Date,
                           Description = D.DepartmentName,
                           DQty =  RI.FulfilledQty
                       }).ToList();

            foreach(var li in data)
            {
                StockCardBO scbo= new StockCardBO();
                scbo.ItemID = li.ItemID;
                scbo.DQty = li.DQty.ToString();
                scbo.Description = li.Description;
                scbo.TDate = li.TDate.Value.ToShortDateString();
                list.Add(scbo);
            }

            return list;
        }
    }
}
