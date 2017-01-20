using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;

namespace BusinessLogic
{
    public class ApproveAdjustmentBL
    {
        public List<Adjustment> GetVoucher()
        {
            ApproveAdjustmentDA rada = new ApproveAdjustmentDA();
            return rada.getAdjustmentNo();
        }
    }
}
