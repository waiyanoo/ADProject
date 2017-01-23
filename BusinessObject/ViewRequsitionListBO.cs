using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class ViewRequsitionListBO
    {
        private string requsitionId;
        private string date;
        private string name;
        private string status;

        public ViewRequsitionListBO(string requsitionId, string date, string name, string status)
        {
            this.requsitionId = requsitionId;
            this.date = date;
            this.name = name;
            this.status = status;
        }
        public ViewRequsitionListBO() { }

        public string RequsitionId
        {
            get
            {
                return requsitionId;
            }

            set
            {
                requsitionId = value;
            }
        }

        public string Date
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

        public string Name
        {
            get
            {
                return name;
            }

            set
            {
                name = value;
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
    }
}
