using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccess;

namespace BusinessLogic
{
    public class StockCardBL
    {
        public List<StockCardBO> getStockList(string id)
        {
            StockCardDA scda = new StockCardDA();
            return scda.getStocklist(id);
        }
    }
}
