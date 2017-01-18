using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class SetReorderLevelDA
    {
        LogicUniversityEntities context = new LogicUniversityEntities();

        //retrieve list of category
        public List<CategoryBO> getCategoryList()
        {
            List<CategoryBO> cList = new List<CategoryBO>();
            cList.Add(new CategoryBO(null));
            List<Category> lst = context.Categories.ToList();
            foreach (Category c in lst)
            {
                CategoryBO cBO = new CategoryBO();
                cBO.CategoryName = c.CategoryName;
                cList.Add(cBO);
            }
            return cList;
        }

        //retrieve list of item
        public List<ItemBO> getItemList(CategoryBO cBO)
        {
            List<ItemBO> iList = new List<ItemBO>();
            List<Item> lst = context.Items.Where(x => x.Category.CategoryName == cBO.CategoryName).ToList();
            foreach(Item i in lst)
            {
                ItemBO iBO = new ItemBO();
                iBO.ItemID = i.ItemID;
                iBO.Description = i.Description;
                iBO.ReorderLevel = (i.ReorderLevel == null) ? 0 : (int)i.ReorderLevel;
                iBO.ReorderQty = (i.ReorderQty == null) ? 0 : (int)i.ReorderQty;
                iBO.UnitOfMeasure = i.UnitOfMeasure;
                iBO.CurrentQty = (i.CurrentQty == null) ? 0 : (int)i.CurrentQty;
                iBO.Price = (i.Price == null) ? 0 : (int)i.Price;
                iBO.Bin = i.Bin;
                //iBO.CategoryBO = i.Category;
            }
            return iList;
        }
    }
}
