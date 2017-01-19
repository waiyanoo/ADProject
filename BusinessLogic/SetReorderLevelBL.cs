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

        public List<ItemBO> getItemList(CategoryBO cBO)
        {
            List<ItemBO> iList;
            iList = srlda.getItemList(cBO);
            return iList;
        }

        public ItemBO getItemInfo(String itemID)
        {
            ItemBO iBO = new ItemBO();
            iBO = srlda.getItemInfo(itemID);
            return iBO;
        }

        public Boolean setItemInfo(String itemID, int reorderLevel, int reorderQty)
        {
            Boolean writeResult = false;
            writeResult = srlda.setItemInfo(itemID, reorderLevel, reorderQty);
            return writeResult;
        }
    }
}
