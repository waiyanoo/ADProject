//Created by Ei Yadanar Kyaw

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class PurchaseItemDetailBO
    {
        //Declaring variables
       private int sequence;
       private string itemno;
       private string description;
       private int recommended_reorder_qty;
       private int order_qty;
       private double price;
       private double amount;
       private string pono;
       private string dono;

        //Getters and Setters
        public int Sequence
        {
            get
            {
                return sequence;
            }

            set
            {
                sequence = value;
            }
        }

        public string Itemno
        {
            get
            {
                return itemno;
            }

            set
            {
                itemno = value;
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

        public int Recommended_reorder_qty
        {
            get
            {
                return recommended_reorder_qty;
            }

            set
            {
                recommended_reorder_qty = value;
            }
        }

        public int Order_qty
        {
            get
            {
                return order_qty;
            }

            set
            {
                order_qty = value;
            }
        }

        public double Price
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

        public double Amount
        {
            get
            {
                return amount;
            }

            set
            {
                amount = value;
            }
        }

        public string Pono
        {
            get
            {
                return pono;
            }

            set
            {
                pono = value;
            }
        }

        public string Dono
        {
            get
            {
                return dono;
            }

            set
            {
                dono = value;
            }
        }
    }
}
