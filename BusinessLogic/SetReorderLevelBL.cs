using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccess;

namespace BusinessLogic
{
    public class SetReorderLevelBL
    {
        SetReorderLevelDA srlda = new SetReorderLevelDA();

        public List<CategoryBO> getCategoryList()
        {
            List<CategoryBO> cList;
            cList = srlda.getCategoryList();
            return cList;
        }

        //public List<ItemBO> getItemList(CategoryBO cBO)
        //{
            //List<ItemBO> iList;
            //iList = srlda.
            //return iList;
        //}
    }
}
