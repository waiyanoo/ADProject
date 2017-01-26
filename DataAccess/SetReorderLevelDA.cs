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
        //retrieve list of all categories
        public List<CategoryBO> getCategoryList()
        {
            List<CategoryBO> cList = new List<CategoryBO>();
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                List<Category> lst = context.Categories.ToList();
                foreach (Category c in lst)
                {
                    CategoryBO cBO = new CategoryBO();
                    cBO.CategoryName = c.CategoryName;
                    cList.Add(cBO);
                }
            }
            return cList;
        }

        //retrieve list of items belonging to that category 
        public List<ItemBO> getItemList(CategoryBO cBO)
        {
            List<ItemBO> iList = new List<ItemBO>();
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                List<Item> lst = context.Items.Where(x => x.Category.CategoryName == cBO.CategoryName).ToList();
                foreach (Item item in lst)
                {
                    //instantiate ItemBO object using values in entity Item object
                    String itemID = item.ItemID;
                    String description = item.Description;
                    int reorderLevel = (item.ReorderLevel == null) ? 0 : (int)item.ReorderLevel; //database column can be null
                    int reorderQty = (item.ReorderQty == null) ? 0 : (int)item.ReorderQty;
                    String unitOfMeasure = item.UnitOfMeasure;
                    int currentQty = (item.CurrentQty == null) ? 0 : (int)item.CurrentQty;
                    float price = (item.Price == null) ? 0 : (int)item.Price;
                    string bin = item.Bin;
                    CategoryBO categoryName = new CategoryBO(cBO.CategoryName);
                    ItemBO iBO = new ItemBO(itemID, description, reorderLevel, reorderQty, unitOfMeasure, currentQty, price, bin, categoryName);

                    iList.Add(iBO);
                }
            }
            return iList;
        }

        //retrieve Item entity object with key 'itemID', instantiate ItemBO, transfer values from Item to ItemBO, return ItemBO
        public ItemBO getItemInfo(String itemID)
        {
            ItemBO iBO = new ItemBO();
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                Item item = context.Items.Where(x => x.ItemID == itemID).FirstOrDefault();
                try
                {
                    //if itemID != null, can retrieve item entity object
                    iBO.ItemID = item.ItemID;
                    iBO.Description = item.Description;
                    iBO.ReorderLevel = (item.ReorderLevel == null) ? 0 : (int)item.ReorderLevel;
                    iBO.ReorderQty = (item.ReorderQty == null) ? 0 : (int)item.ReorderQty;
                    iBO.UnitOfMeasure = item.UnitOfMeasure;
                    iBO.CurrentQty = (item.CurrentQty == null) ? 0 : (int)item.CurrentQty;
                    iBO.Price = (item.Price == null) ? 0 : (int)item.Price;
                    iBO.Bin = item.Bin;
                    iBO.CategoryName = new CategoryBO(item.CategoryName);
                }
                catch (Exception)
                {
                    //itemID is null(1st item in iList for dropdownList is blank), item = null, so just return iBO with values unset
                    return iBO;
                }
            }
            return iBO;
        }

        public Boolean setItemInfo(String itemID, int reorderLevel, int reorderQty)
        {
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                Item item = context.Items.Where(x => x.ItemID == itemID).FirstOrDefault();
                if (item != null)
                {
                    item.ReorderLevel = reorderLevel;
                    item.ReorderQty = reorderQty;

                    context.SaveChanges();
                    return true;
                }
            }
            return false;
        }

    }
}
