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

        public List<DepartmentBO> GetAllDepartment()
        {

            DepartmentDA dda = new DepartmentDA();
            return dda.getAllDepartment();
        }

       

        public DepartmentBO GetDepartmentById(String id)
        {
            DepartmentDA dda = new DepartmentDA();
            return dda.getDepartmentByID(id);
        }
        public bool updateDepartment(DepartmentBO d)
        {
            DepartmentDA dda = new DepartmentDA();
            dda.updatedepartment(d);
            return true;
        }
    }
}
