﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class ItemAdjustmentDA
    {
        LogicUniversityEntities context = new LogicUniversityEntities();

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