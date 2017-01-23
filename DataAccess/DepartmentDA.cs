using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;



namespace DataAccess
{
    public class DepartmentDA
    {
        LogicUniversityEntities context = new LogicUniversityEntities();

        public void AddDepartment(DepartmentBO dbo)
        {
            CollectionPointBO cpbo = new CollectionPointBO();
            cpbo = dbo.CollectionPointName;
            Department department = new Department();

            department.DepartmentID = dbo.DepartmentID; 
            department.DepartmentName = dbo.DepartmentName;
            department.ContactName = dbo.ContactName;
            department.Phone =Convert.ToInt32(dbo.Phone); 
            department.Fax = Convert.ToInt32(dbo.Fax);
            department.HeadName = dbo.HeadName;
            department.CollectionPointName = cpbo.CollectionPointName;
            department.CollectionTime = dbo.CollectionTime;
            department.Representative = dbo.Representative;

            context.Departments.Add(department);
            context.SaveChanges();

           
           
        }

      
        public bool updatedepartment(DepartmentBO dbo)
        {
            CollectionPointBO cpbo = new CollectionPointBO();
            cpbo = dbo.CollectionPointName;
            var depart = context.Departments.FirstOrDefault(d => d.DepartmentID == dbo.DepartmentID);
            depart.DepartmentID = dbo.DepartmentID;
            depart.DepartmentName = dbo.DepartmentName;
            depart.ContactName = dbo.ContactName;
            depart.HeadName = dbo.HeadName;
            depart.CollectionPointName = cpbo.CollectionPointName;
            depart.CollectionTime = dbo.CollectionTime;
            depart.Phone =Convert.ToInt32( dbo.Phone);
            depart.Fax = Convert.ToInt32(dbo.Fax);
            depart.Representative = dbo.Representative;
            context.SaveChanges();
            return true;
        }

        public List<DepartmentBO> getAllDepartment()
        {
            List<DepartmentBO> list = new List<DepartmentBO>();
            var data = context.Departments.ToList<Department>();
            foreach(var d in data)
            {
                DepartmentBO dbo = new DepartmentBO();
                CollectionPointBO cbo = new CollectionPointBO();
                dbo.DepartmentID = d.DepartmentID;
                dbo.DepartmentName = d.DepartmentName;
                dbo.ContactName = d.ContactName;
                dbo.Phone = d.Phone.ToString();
                dbo.Fax = d.Fax.ToString();
                dbo.HeadName = d.HeadName;
                cbo.CollectionPointName = d.CollectionPointName;
                dbo.CollectionPointName = cbo;
                dbo.CollectionTime = d.CollectionTime;
                dbo.Representative = d.Representative;
                list.Add(dbo);
            }
            return list;
        }

        public DepartmentBO getDepartmentByID(String id)
        {

            
            Department department = new Department();
            department = context.Departments.First(i => i.DepartmentID == id);

            DepartmentBO dbo = new DepartmentBO();
            CollectionPointBO cpbo = new CollectionPointBO();
            dbo.DepartmentID = department.DepartmentID;
            dbo.DepartmentName = department.DepartmentName;
            dbo.ContactName = department.ContactName;
            dbo.Fax = Convert.ToString(department.Fax);
            dbo.Phone = Convert.ToString(department.Phone);
            dbo.HeadName = department.HeadName;
            cpbo.CollectionPointName = department.CollectionPointName;
            dbo.CollectionPointName = cpbo;
            dbo.CollectionTime = department.CollectionTime;
            dbo.Representative = department.Representative;
            return dbo;

            
        }
    
    }
}
