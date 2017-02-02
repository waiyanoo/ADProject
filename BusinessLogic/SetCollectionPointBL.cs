using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccess;

namespace BusinessLogic
{
    public class SetCollectionPointBL
    {
        public List<CollectionPointBO> getCollectionPoint()
        {
            SetCollectionPointDA spda = new SetCollectionPointDA();
            return spda.getCollectionPoint();
        }

        public DepartmentBO getCollectionDatabyID(string id)
        {
            SetCollectionPointDA spda = new SetCollectionPointDA();
            return spda.getCollectionDatabyID(id);
        }

        public void updateCollectionPoint(DepartmentBO dbo)
        {
            SetCollectionPointDA spda = new SetCollectionPointDA();
            spda.updateCollectionPoint(dbo);
        }

        public string getdepartmentID(string id)
        {
            SetCollectionPointDA spda = new SetCollectionPointDA();
            return spda.getDepartmentID(id);
        }
    }
}
