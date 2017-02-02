//Code Owner: Wai Yan Oo

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess; //For accessing data access class
using BusinessObject; //For accessing business object class

namespace BusinessLogic
{
    public class ApproveAdjustmentBL
    {
        public List<Adjustment> GetVoucher()
        {
            //To institiate data access object
            ApproveAdjustmentDA rada = new ApproveAdjustmentDA();
            //Calling method from DA
            return rada.getAdjustmentNo();
        }

        public List<ApproveAdjustmentBO> GetItemabove(string id)
        {
            ApproveAdjustmentDA rada = new ApproveAdjustmentDA();
            //Getting the method from DA which is for the vouchers with price above $250
            return rada.getAdjustmentNoAbove(id);
        }

        public List<ApproveAdjustmentBO> GetItembelow(string id)
        {
            ApproveAdjustmentDA rada = new ApproveAdjustmentDA();
            //Getting the method from DA which is for the vouchers with price under $250
            return rada.getAdjustmentNoBelow(id);
        }

        public void ApproveItem(string voucher, string item, string status)
        {
            ApproveAdjustmentDA rada = new ApproveAdjustmentDA();
            //Getting mothod from DA 
            rada.ApproveItem(voucher, item, status);
        }
    }
}
