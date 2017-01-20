using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using BusinessObject;

namespace BusinessLogic
{
    public class RequestAdjustmentBL
    {
        public List<Category> GetCategory()
        {
            RequestAdjustmentDA rada = new RequestAdjustmentDA();
            return rada.getCategory();
        }

        public List<Item> GetItem(string id)
        {
            RequestAdjustmentDA rada = new RequestAdjustmentDA();
            return rada.getItem(id);
        }

        public void SaveAdjustmentVocher(AdjustmentBO abo)
        {
            RequestAdjustmentDA rada = new RequestAdjustmentDA();
            rada.saveAdjustmentvoucher(abo);
        }

        public void SaveItemAdjustment(ItemAdjustmentBO iabo)
        {
            RequestAdjustmentDA rada = new RequestAdjustmentDA();
            rada.saveItemAdjustment(iabo);
        }
    }
}
