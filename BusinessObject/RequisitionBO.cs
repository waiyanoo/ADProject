//Created by Ei Yadanar Kyaw

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class RequisitionBO 
    {
        //Declaring variables
        private string requisitionID;
        private UserBO userID;
        private DateTime date;
        private string status;
        private string AllocatedQty;
        private string FulfilledQty;

        //Getters and Setters
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

        public string AllocatedQty1
        {
            get
            {
                return AllocatedQty;
            }

            set
            {
                AllocatedQty = value;
            }
        }

        public string FulfilledQty1
        {
            get
            {
                return FulfilledQty;
            }

            set
            {
                FulfilledQty = value;
            }
        }


        public RequisitionBO()
        {

        }

        //Declaring constructor
        public RequisitionBO(string requisitionID, UserBO userID, DateTime date, string status, string allocatedQty, string fulfilledQty)
        {
            this.requisitionID = requisitionID;
            this.userID = userID;
            this.date = date;
            this.status = status;
            AllocatedQty = allocatedQty;
            FulfilledQty = fulfilledQty;
        }
    }
}
