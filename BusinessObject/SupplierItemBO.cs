using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class SupplierItemBO
    {
        private SupplierBO supplierID;
        private ItemBO itemID;
        private float price;

        internal SupplierBO SupplierID
        {
            get
            {
                return supplierID;
            }

            set
            {
                supplierID = value;
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

        public float Price
        {
            get
            {
                return price;
            }

            set
            {
                price = value;
            }
        }

        public SupplierItemBO(SupplierBO supplierID, ItemBO itemID, float price)
        {
            this.SupplierID = supplierID;
            this.ItemID = itemID;
            this.Price = price;
        }
    }
}
