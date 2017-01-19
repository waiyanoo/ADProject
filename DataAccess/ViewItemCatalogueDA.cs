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
        LogicUniversityEntities context = new LogicUniversityEntities();
        public List<Item> FindCatalogue(String itemdesc)
        { 
            List <Item> itemlist= context.Items.Where(x => x.Description.Contains(itemdesc)).ToList();
            return itemlist;
        }

        public List<Item> FindAllCatalogue()
        {
            List<Item> itemlist = context.Items.ToList();
            return itemlist;
        }
    }
}
