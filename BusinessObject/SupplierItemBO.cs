//Created by Ei Yadanar Kyaw

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class SupplierItemBO
    {
        //Declaring variables for SupplierItemBO
        private SupplierBO supplierID;
        private ItemBO itemID;
        private float price;

        //Getters and Setters
        //To access SupplierID from SupplierBO
        public SupplierBO SupplierID
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
        //To access ItemID from ItemBO
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

        //Declaring constructor
        public SupplierItemBO(SupplierBO supplierID, ItemBO itemID, float price)
        {
            this.SupplierID = supplierID;
            this.ItemID = itemID;
            this.Price = price;
        }
    }
}
