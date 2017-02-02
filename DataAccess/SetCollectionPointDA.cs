//Code Owner: Wai Yan Oo

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class SetCollectionPointDA
    {
        //Declaring entity framework
        LogicUniversityEntities context = new LogicUniversityEntities();

        //getting the collection point names
        public List<CollectionPointBO> getCollectionPoint()
        {
            List<CollectionPointBO> list = new List<CollectionPointBO>();
            List<CollectionPoint> clist = context.CollectionPoints.ToList();
            foreach(CollectionPoint cp in clist)
            {
                CollectionPointBO cpbo = new CollectionPointBO();
                cpbo.CollectionPointName = cp.CollectionPointName;
                list.Add(cpbo);
            }
            return list;
        }

        //getting the collection point and time by department
        public DepartmentBO getCollectionDatabyID(string id)
        {
            User user = context.Users.Where(x => x.UserID == id).FirstOrDefault();
            DepartmentBO dbo = new DepartmentBO();
            CollectionPointBO cpbo = new CollectionPointBO(); 
            Department dp = context.Departments.Where(x => x.DepartmentID == user.DepartmentID).FirstOrDefault();
            if (dp != null)
            {
                cpbo.CollectionPointName = dp.CollectionPointName;
                dbo.CollectionPointName = cpbo;
                dbo.CollectionTime = dp.CollectionTime;
                
            }
            return dbo;
        }

        //updating the collection point name and time
        public void updateCollectionPoint(DepartmentBO dbo)
        {
            Department dp = context.Departments.Where(x => x.DepartmentID == dbo.DepartmentID).First();
            CollectionPointBO cpbo = dbo.CollectionPointName;
            dp.CollectionPointName = cpbo.CollectionPointName;
            dp.CollectionTime = dbo.CollectionTime;
            context.SaveChanges();
        }

        public string getDepartmentID(string id)
        {
            string s = context.Users.Where(x => x.UserID == id).Select(y => y.DepartmentID).FirstOrDefault();
            return s;
        }
    }
}
