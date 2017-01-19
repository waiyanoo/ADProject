using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;

namespace BusinessLogic
{
    public class ViewItemCatalogueBL
    {
        public List<Item> FindItem(string itemdesc)
        {
            ViewItemCatalogueDA vicda = new ViewItemCatalogueDA();
            return vicda.FindCatalogue(itemdesc);
        }
        public List<Item> FindAllItem()
        {
            ViewItemCatalogueDA vicda = new ViewItemCatalogueDA();
            return vicda.FindAllCatalogue();
        }
    }
}
