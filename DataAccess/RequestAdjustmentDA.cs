using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class RequestAdjustmentDA
    {
        //Declaring entity framework
        LogicUniversityEntities model = new LogicUniversityEntities();

        //getting the category
        public List<Category> getCategory()
        {   
            return model.Categories.ToList<Category>();
        }

        //getting the item
        public List<Item> getItem(string category)
        {
            return model.Items.Where(p => p.CategoryName == category).ToList<Item>();
        }

        //saving the adjustment voucher
        public void saveAdjustmentvoucher(AdjustmentBO abo)
        {
            Adjustment ad = new Adjustment();
            UserBO ubo = new UserBO();
            ubo = abo.UserID;
            ad.VoucherNo = abo.VoucherNo;
            ad.UserID = ubo.UserID;
            ad.Date = abo.Date;
            ad.ConfirmedBy = abo.ConfirmBy;
            ad.Status = "Pending";
            model.Adjustments.Add(ad);
            model.SaveChanges();
        }

        //saving item adjustment
        public void saveItemAdjustment(ItemAdjustmentBO iabo)
        {
            ItemBO ibo = new ItemBO();
            ibo = iabo.ItemID;
            AdjustmentBO abo = new AdjustmentBO();
            abo = iabo.VoucherNo;
            ItemAdjustment ia = new ItemAdjustment();
            ia.ItemID = ibo.ItemID;
            ia.VoucherNo = abo.VoucherNo;
            ia.AdjustedQty = iabo.AdjustQty;
            ia.AdjsutmentStatus = "Pending";
            if (iabo.Reason == null)
            {
                ia.Reason = "";
            }
            else ia.Reason = iabo.Reason;
            model.ItemAdjustments.Add(ia);
            model.SaveChanges();

        }
    }
}
