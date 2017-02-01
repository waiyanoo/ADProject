using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Created by Ei Yadanar Kyaw
namespace BusinessObject
{
    public class ApproveAdjustmentBO
    {

        //Declaring varialbles for ApproveAdjustmentBO
        private string itemID;
        private string cat;
        private string description;
        private string qty;
        private string price;

       //Empty constructor
        public ApproveAdjustmentBO()
        {

        }
        //Declaring constructor
        public ApproveAdjustmentBO(string itemID, string cat, string description, string qty, string price)
        {
            this.itemID = itemID;
            this.cat = cat;
            this.description = description;
            this.qty = qty;
            this.price = price;
        }

        //getters and setters
        public string ItemID
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

        


        public string Description
        {
            get
            {
                return description;
            }

            set
            {
                description = value;
            }
        }

        public string Qty
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

        public string Price
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

        public string Cat
        {
            get
            {
                return cat;
            }

            set
            {
                cat = value;
            }
        }
    }
}
