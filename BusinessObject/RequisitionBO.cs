using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class RequisitionBO
    {
        private string requisitionID;
        private UserBO userID;
        private DateTime date;
        private string status;

        public string RequisitionID
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

        public RequisitionBO(string requisitionID, UserBO userID, DateTime date, string status)
        {
            this.RequisitionID = requisitionID;
            this.UserID = userID;
            this.Date = date;
            this.Status = status;
        }
    }
}
