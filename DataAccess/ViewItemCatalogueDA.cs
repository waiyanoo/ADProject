//Code Owner: Lin SiYin
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class ViewItemCatalogueDA
    {
        //Declaring entity framework
        LogicUniversityEntities context = new LogicUniversityEntities();

        //getting a category
        public List<Item> FindCatalogue(String itemdesc)
        { 
            List <Item> itemlist= context.Items.Where(x => x.Description.Contains(itemdesc)).ToList();
            return itemlist;
        }

        //getting all items
        public List<Item> FindAllCatalogue()
        {
            List<Item> itemlist = context.Items.ToList();
            return itemlist;
        }
    }
}
