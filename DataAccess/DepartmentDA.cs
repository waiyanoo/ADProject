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
            Department department = new Department();

            department.DepartmentID = dbo.DepartmentID; 
            department.DepartmentName = dbo.DepartmentName;
            department.ContactName = dbo.ContactName;
            department.Phone =Convert.ToInt32(dbo.Phone); 
            department.Fax = Convert.ToInt32(dbo.Fax);
            department.HeadName = dbo.HeadName;
            department.CollectionPoint = dbo.CollectionPoint;
            department.CollectionTime = dbo.CollectionTime;
            department.Representative = dbo.Representative;

            context.Departments.Add(department);
            context.SaveChanges();

           
           
        }

      
        public bool updatedepartment(DepartmentBO dbo)
        {
            var depart = context.Departments.FirstOrDefault(d => d.DepartmentID == dbo.DepartmentID);
            depart.DepartmentID = dbo.DepartmentID;
            depart.DepartmentName = dbo.DepartmentName;
            depart.ContactName = dbo.ContactName;
            depart.HeadName = dbo.HeadName;
            depart.CollectionPoint = dbo.CollectionPoint;
            depart.CollectionTime = dbo.CollectionTime;
            depart.Phone =Convert.ToInt32( dbo.Phone);
            depart.Fax = Convert.ToInt32(dbo.Fax);
            depart.Representative = dbo.Representative;
            context.SaveChanges();
            return true;
        }

        public List<Department> getAllDepartment()
        {
            return context.Departments.ToList<Department>();
        }

        public DepartmentBO getDepartmentByID(String id)
        {

            
            Department department = new Department();
            department = context.Departments.First(i => i.DepartmentID == id);

            DepartmentBO dbo = new DepartmentBO();
            dbo.DepartmentID = department.DepartmentID;
            dbo.DepartmentName = department.DepartmentName;
            dbo.ContactName = department.ContactName;
             dbo.Fax = Convert.ToString(department.Fax);
             dbo.Phone = Convert.ToString(department.Phone);
             dbo.HeadName = department.HeadName;
             dbo.CollectionPoint = department.CollectionPoint;
             dbo.CollectionTime = department.CollectionTime;
             dbo.Representative = department.Representative;
             return dbo;

            
        }
    
    }
}
