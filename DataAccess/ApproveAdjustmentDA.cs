using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class ApproveAdjustmentDA
    {
        LogicUniversityEntities context = new LogicUniversityEntities();
        public List<Adjustment> getAdjustmentNo()
        {
            List<Adjustment> adjustment = context.Adjustments.Where(x => x.Status == "Pending" ).ToList();
            return adjustment;
        }
        public List<AdjustmentBO> getAdjustmentNoAbove()
        {

            return null;
        }
    }
}
