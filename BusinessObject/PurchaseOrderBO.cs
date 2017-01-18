using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class PurchaseOrderBO
    {
        private string poNo;
        private DateTime date;
        private string deliverTo;
        private string attn;
        private SupplierBO supplierID;

        public string PoNo
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

        public DateTime Date
        {
            get
            {
                return date;
            }

            set
            {
                date = value;
            }
        }

        public string DeliverTo
        {
            get
            {
                return deliverTo;
            }

            set
            {
                deliverTo = value;
            }
        }

        public string Attn
        {
            get
            {
                return attn;
            }

            set
            {
                attn = value;
            }
        }

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

        public PurchaseOrderBO(string poNo, DateTime date, string deliverTo, string attn, SupplierBO supplierID)
        {
            this.PoNo = poNo;
            this.Date = date;
            this.DeliverTo = deliverTo;
            this.Attn = attn;
            this.SupplierID = supplierID;
        }
    }
}
