using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
   public class PurchaseItemBO
    {
        private PurchaseItemBO poNo;
        private ItemBO itemID;
        private int qty;
        private float purchasePrice;

        internal PurchaseItemBO PoNo
        {
            get
            {
                return poNo;
            }

            set
            {
                poNo = value;
            }
        }

        internal ItemBO ItemID
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

        public int Qty
        {
            get
            {
                return qty;
            }

            set
            {
                qty = value;
            }
        }

        public float PurchasePrice
        {
            get
            {
                return purchasePrice;
            }

            set
            {
                purchasePrice = value;
            }
        }

        public PurchaseItemBO(PurchaseItemBO poNo, ItemBO itemID, int qty, float purchasePrice)
        {
            this.PoNo = poNo;
            this.ItemID = itemID;
            this.Qty = qty;
            this.PurchasePrice = purchasePrice;
        }
    }
}
