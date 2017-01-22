using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
   public class AdjustmentBO
    {
        private string voucherNo;
        private UserBO userID;
        private DateTime date;
        private string confirmBy;
        private string status;

        public string VoucherNo
        {
            get
            {
                return voucherNo;
            }

            set
            {
                voucherNo = value;
            }
        }

        public UserBO UserID
        {
            get
            {
                return userID;
            }

            set
            {
                userID = value;
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

        public string ConfirmBy
        {
            get
            {
                return confirmBy;
            }

            set
            {
                confirmBy = value;
            }
        }

        public string Status
        {
            get
            {
                return status;
            }

            set
            {
                status = value;
            }
        }

        public AdjustmentBO(string voucherNo, UserBO userID, DateTime date, string confirmBy, string status)
        {
            this.VoucherNo = voucherNo;
            this.UserID = userID;
            this.Date = date;
            this.ConfirmBy = confirmBy;
            this.Status = status;
        }
        public AdjustmentBO()
        {

        }
    }
}
