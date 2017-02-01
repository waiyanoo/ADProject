using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Created by Ei Yadanar Kyaw
namespace BusinessObject
{
    public class PurchaseOrderBO
    {
        private string poNo;
        private DateTime pOdate;
        private String dONo;
        private DateTime deliveryDate;
        private SupplierBO supplierID;

        public PurchaseOrderBO(string poNo, DateTime pOdate, string dONo, DateTime deliveryDate, SupplierBO supplierID)
        {
            this.poNo = poNo;
            this.pOdate = pOdate;
            this.dONo = dONo;
            this.deliveryDate = deliveryDate;
            this.supplierID = supplierID;
        }
        public PurchaseOrderBO() { }

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

        public DateTime POdate
        {
            get
            {
                return pOdate;
            }

            set
            {
                pOdate = value;
            }
        }

        public string DONo
        {
            get
            {
                return dONo;
            }

            set
            {
                dONo = value;
            }
        }

        public DateTime DeliveryDate
        {
            get
            {
                return deliveryDate;
            }

            set
            {
                deliveryDate = value;
            }
        }

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
    }
}
