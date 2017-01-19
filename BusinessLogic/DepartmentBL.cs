using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using BusinessObject;

namespace BusinessLogic
{
    public class DepartmentBL
    {
        public void AddDepartment(DepartmentBO dbo)
        {
            DepartmentDA dda = new DepartmentDA();
            dda.AddDepartment(dbo);
        }

        public List<Department> GetAllDepartment()
        {

            DepartmentDA dda = new DepartmentDA();
            return dda.getAllDepartment();
        }

        public void DeleteDepartment(String id)
        {
            DepartmentDA dda = new DepartmentDA();
            dda.deleteDepartment(id);
        }

        public DepartmentBO GetDepartment(String id)
        {
            DepartmentDA dda = new DepartmentDA();
            return dda.getDepartment(id);
        }
    }
}
