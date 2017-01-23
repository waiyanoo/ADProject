using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using BusinessObject;

namespace BusinessLogic
{
    public class ApproveAdjustmentBL
    {
        public List<Adjustment> GetVoucher()
        {
            ApproveAdjustmentDA rada = new ApproveAdjustmentDA();
            return rada.getAdjustmentNo();
        }

        public List<ApproveAdjustmentBO> GetItemabove(string id)
        {
            ApproveAdjustmentDA rada = new ApproveAdjustmentDA();
            return rada.getAdjustmentNoAbove(id);
        }

        public List<ApproveAdjustmentBO> GetItembelow(string id)
        {
            ApproveAdjustmentDA rada = new ApproveAdjustmentDA();
            return rada.getAdjustmentNoBelow(id);
        }

        public void ApproveItem(string voucher, string item, string status)
        {
            ApproveAdjustmentDA rada = new ApproveAdjustmentDA();
            rada.ApproveItem(voucher, item, status);
        }
    }
}
