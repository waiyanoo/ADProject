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

        public List<Department> getAllDepartment()
        {
            return context.Departments.ToList<Department>();
        }

        public void deleteDepartment(String id)

        {
            
            var department = context.Departments.FirstOrDefault(d => d.DepartmentID == id);
            if (department != null)
            {
                context.Departments.Remove(department);
                context.SaveChanges();
                
            }

        }

        

    }
}
