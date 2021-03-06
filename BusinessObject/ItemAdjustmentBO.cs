﻿//Created by Ei Yadanar Kyaw

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class ItemAdjustmentBO
    {
        //Declaring variables
        private AdjustmentBO voucherNo;
        private ItemBO itemID;
        private int adjustQty;
        private string reason;
        private string adjustedStatus;

        //Getters and Setters
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

        public string AdjustedStatus
        {
            get
            {
                return adjustedStatus;
            }

            set
            {
                adjustedStatus = value;
            }
        }

        //Declaring constructor
        public ItemAdjustmentBO(AdjustmentBO voucherNo, ItemBO itemID, int adjustQty, string reason, string adjustedStatus)
        {
            this.VoucherNo = voucherNo;
            this.ItemID = itemID;
            this.AdjustQty = adjustQty;
            this.Reason = reason;
            this.AdjustedStatus = adjustedStatus;
        }

        public ItemAdjustmentBO()
        { }

        
    }
}
