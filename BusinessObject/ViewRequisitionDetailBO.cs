//Created by Ei Yadanar Kyaw

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class ViewRequisitionDetailBO
    {
        //Declaring variables for ViewRequisitionDetailsBO
        private string itemId, itemDescription;
        private int requiredQty, fulfilledQty;

        //Getters and Setters
        public string ItemId
        {
            get
            {
                return itemId;
            }

            set
            {
                itemId = value;
            }
        }

        public string ItemDescription
        {
            get
            {
                return itemDescription;
            }

            set
            {
                itemDescription = value;
            }
        }

        public int RequiredQty
        {
            get
            {
                return requiredQty;
            }

            set
            {
                requiredQty = value;
            }
        }

        public int FulfilledQty
        {
            get
            {
                return fulfilledQty;
            }

            set
            {
                fulfilledQty = value;
            }
        }

        //Declaring Constructor
        public ViewRequisitionDetailBO(string itemId, string itemDescription, int requiredQty, int fulfilledQty)
        {
            this.itemId = itemId;
            this.itemDescription = itemDescription;
            this.requiredQty = requiredQty;
            this.fulfilledQty = fulfilledQty;
        }
        public ViewRequisitionDetailBO()
        {

        }

    }
}
