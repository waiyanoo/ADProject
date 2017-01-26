using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class ApproveAdjustmentDA
    {
        LogicUniversityEntities context = new LogicUniversityEntities();
        public List<Adjustment> getAdjustmentNo()
        {
            List<Adjustment> adjustment = context.Adjustments.Where(x => x.Status == "Pending" ).ToList();
            return adjustment;
        }
        public List<ApproveAdjustmentBO> getAdjustmentNoAbove(string id)
        {
            List<ApproveAdjustmentBO> aabo = new List<ApproveAdjustmentBO>();
            var data = (from a in context.Adjustments
                        join ia in context.ItemAdjustments on a.VoucherNo equals ia.VoucherNo
                        join i in context.Items on ia.ItemID equals i.ItemID
                        where a.Status == "Pending"
                        where ia.AdjsutmentStatus == "Pending"
                        where ia.AdjustedQty * i.Price >= 250
                        where a.VoucherNo == id
                        select new
                        {
                            item = i.ItemID,
                            cat = i.Category,
                            description = i.Description,
                            qty = ia.AdjustedQty,
                            total = ia.AdjustedQty * i.Price
                        }).ToList();
            foreach (var v in data)
            {
                ApproveAdjustmentBO abo = new ApproveAdjustmentBO();
                abo.ItemID = v.item;
                abo.Cat = v.cat.CategoryName;
                abo.Description = v.description;
                abo.Qty = v.qty.ToString();
                abo.Price = v.total.ToString();
                aabo.Add(abo);

            }
            return aabo;
        }
        public List<ApproveAdjustmentBO> getAdjustmentNoBelow(string id)
        {
            List<ApproveAdjustmentBO> aabo = new List<ApproveAdjustmentBO>();
            var data = (from a in context.Adjustments
                        join ia in context.ItemAdjustments on a.VoucherNo equals ia.VoucherNo
                        join i in context.Items on ia.ItemID equals i.ItemID
                        where a.Status == "Pending"
                        where ia.AdjsutmentStatus == "Pending"
                        where ia.AdjustedQty * i.Price < 250
                        where a.VoucherNo == id
                        select new
                        {
                            item = i.ItemID,
                            cat = i.Category,
                            description = i.Description,
                            qty = ia.AdjustedQty,
                            total = ia.AdjustedQty * i.Price
                        }).ToList();
            foreach (var v in data)
            {
                ApproveAdjustmentBO abo = new ApproveAdjustmentBO();
                abo.ItemID = v.item;
                abo.Cat = v.cat.CategoryName;
                abo.Description = v.description;
                abo.Qty = v.qty.ToString();
                abo.Price = v.total.ToString();
                aabo.Add(abo);

            }
            return aabo;
        }

        public void ApproveItem(string voucher, string item, string status)
        {
            context = new LogicUniversityEntities();
            ItemAdjustment ia = new ItemAdjustment();
            var data = context.ItemAdjustments.FirstOrDefault(s => s.ItemID == item && s.VoucherNo == voucher);
            if(data != null)
            {
                data.ItemID = item;
                data.VoucherNo = voucher;
                data.AdjsutmentStatus = status;
                data.Reason = data.Reason;
                data.AdjustedQty = data.AdjustedQty;
                
                context.SaveChanges();
                updateItemQty(voucher);
            }
            
           
        }
        public void updateItemQty(string vonumber)
        {
            List<ItemAdjustment> listpi = context.ItemAdjustments.Where(x => x.VoucherNo == vonumber).ToList();
            foreach (var pi in listpi)
            {
                var i = context.Items.FirstOrDefault(x => x.ItemID == pi.ItemID);
                i.CurrentQty = i.CurrentQty + pi.AdjustedQty;
                context.SaveChanges();
            }
        }
    }
}
