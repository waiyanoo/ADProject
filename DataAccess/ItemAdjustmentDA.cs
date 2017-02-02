// Code Owner : Wai Yan Oo
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;// for acessing bussiness object class

namespace DataAccess
{
    public class ItemAdjustmentDA
    {
        //Declaring entity framework
        LogicUniversityEntities context = new LogicUniversityEntities();

        //Add Item Adjustment data to item adjustment table
        public void AddItemAdjustment(ItemAdjustmentBO itemAdjust )
        {
            ItemAdjustment ia = new ItemAdjustment();

            AdjustmentBO b = itemAdjust.VoucherNo;
            ia.VoucherNo =b.VoucherNo;

            ItemBO i = itemAdjust.ItemID;
            ia.ItemID = i.ItemID;

            ia.AdjustedQty = itemAdjust.AdjustQty;
            ia.Reason = itemAdjust.Reason;

            context.ItemAdjustments.Add(ia);
            context.SaveChanges();

        }


        

      

        
    }
}
