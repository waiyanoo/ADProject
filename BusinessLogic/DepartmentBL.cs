using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccess;

namespace BusinessLogic
{
    public class DepartmentBL
    {
        public void AddDepartment(DepartmentBO dbo)
        {
            DepartmentDA dda = new DepartmentDA();
            dda.AddDepartment(dbo);
        }
    }
}
