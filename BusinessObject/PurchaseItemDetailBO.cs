using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class PurchaseItemDetailBO
    {
        int sequence;
        string itemno;
        string description;
        int recommended_reorder_qty;
        int order_qty;
        double price;
        double amount;
        string pono;
        string dono;

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
