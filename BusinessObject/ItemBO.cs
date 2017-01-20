using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class ItemBO
    {
        private string itemID;
        private string description;
        private int reorderLevel;
        private int reorderQty;
        private string unitOfMeasure;
        private int currentQty;
        private float price;
        private string bin;
        private CategoryBO categoryName;

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

        public int ReorderLevel
        {
            get
            {
                return reorderLevel;
            }

            set
            {
                reorderLevel = value;
            }
        }

        public int ReorderQty
        {
            get
            {
                return reorderQty;
            }

            set
            {
                reorderQty = value;
            }
        }

        public string UnitOfMeasure
        {
            get
            {
                return unitOfMeasure;
            }

            set
            {
                unitOfMeasure = value;
            }
        }

        public int CurrentQty
        {
            get
            {
                return currentQty;
            }

            set
            {
                currentQty = value;
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

        public string Bin
        {
            get
            {
                return bin;
            }

            set
            {
                bin = value;
            }
        }

        public CategoryBO CategoryName
        {
            get
            {
                return categoryName;
            }

            set
            {
                categoryName = value;
            }
        }

        public ItemBO(string itemID, string description, int reorderLevel, int reorderQty, string unitOfMeasure, int currentQty, float price, string bin, CategoryBO categoryName)
        {
            this.ItemID = itemID;
            this.Description = description;
            this.ReorderLevel = reorderLevel;
            this.ReorderQty = reorderQty;
            this.UnitOfMeasure = unitOfMeasure;
            this.CurrentQty = currentQty;
            this.Price = price;
            this.Bin = bin;
            this.CategoryName = categoryName;
        }

        public ItemBO()
        {

        }
    }
}
