using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class ItemAdjustmentBO
    {
        private AdjustmentBO voucherNo;
        private ItemBO itemID;
        private int adjustQty;
        private string reason;

        public AdjustmentBO VoucherNo 
        {
            get
            {
                return voucherNo;
            }

            set
            {
                voucherNo = value;
            }
        }

        public ItemBO ItemID
        {
            get
            {
                return itemID;
            }

            set
            {
                itemID = value;
            }
        }

        public int AdjustQty
        {
            get
            {
                return adjustQty;
            }

            set
            {
                adjustQty = value;
            }
        }

        public string Reason
        {
            get
            {
                return reason;
            }

            set
            {
                reason = value;
            }
        }

        public ItemAdjustmentBO(AdjustmentBO voucherNo, ItemBO itemID, int adjustQty, string reason)
        {
            this.VoucherNo = voucherNo;
            this.ItemID = itemID;
            this.AdjustQty = adjustQty;
            this.Reason = reason;
        }

        public ItemAdjustmentBO()
        { }

        
    }
}
