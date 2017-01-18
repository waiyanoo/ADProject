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

        internal UserBO UserID
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

        public AdjustmentBO(string voucherNo, UserBO userID, DateTime date, string confirmBy)
        {
            this.VoucherNo = voucherNo;
            this.UserID = userID;
            this.Date = date;
            this.ConfirmBy = confirmBy;
        }
    }
}
