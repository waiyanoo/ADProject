using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class GeneratePrimaryKey
    {
        LogicUniversityEntities context = new LogicUniversityEntities();
        public string getKeyforAdjustment()
        {
            string id = context.Adjustments.Max(i=> i.VoucherNo);
            int key =Convert.ToInt32(id)+1;
            return key.ToString();
        }

        public string getKeyforRequisition()
        {
            string id = context.RequisitionItems.Max(i => i.RequisitionID);
            string first = id.Substring(0, 1);
            int num = Convert.ToInt32(id.Substring(1, id.Length - 1)) + 1;
            string key = first + num;
            return key;
        }
    }
}
