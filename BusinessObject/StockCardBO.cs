using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class StockCardBO
    {
        private string itemID;
        private string tDate;
        private string description;
        private string dQty;

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

        public string TDate
        {
            get
            {
                return tDate;
            }

            set
            {
                tDate = value;
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

        public string DQty
        {
            get
            {
                return dQty;
            }

            set
            {
                dQty = value;
            }
        }

        public StockCardBO(string itemID, string tDate, string description, string dQty)
        {
            this.itemID = itemID;
            this.tDate = tDate;
            this.description = description;
            this.dQty = dQty;
        }

        public StockCardBO() { }
    }
}
