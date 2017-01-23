using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class RequisitionItemBO
    {
        private RequisitionBO requisitionID;
        private ItemBO itemID;
        private int requiredQty;
        private int fulfilledQty;
        private int allocatedQty;
        private string fulfilledStatus;

        public RequisitionBO RequisitionID
        {
            get
            {
                return requisitionID;
            }

            set
            {
                requisitionID = value;
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

        public int AllocatedQty
        {
            get
            {
                return allocatedQty;
            }

            set
            {
                allocatedQty = value;
            }
        }

        public string FulfilledStatus
        {
            get
            {
                return fulfilledStatus;
            }

            set
            {
                fulfilledStatus = value;
            }
        }

        public RequisitionItemBO(RequisitionBO requisitionID, ItemBO itemID, int requiredQty, int fulfilledQty, int allocatedQty, string fulfilledStatus)
        {
            this.RequisitionID = requisitionID;
            this.ItemID = itemID;
            this.RequiredQty = requiredQty;
            this.FulfilledQty = fulfilledQty;
            this.AllocatedQty = allocatedQty;
            this.FulfilledStatus = fulfilledStatus;
        }
       public RequisitionItemBO()
        {

        }
    }
}
