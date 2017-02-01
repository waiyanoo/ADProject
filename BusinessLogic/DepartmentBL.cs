using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess; //For accessing data access class
using BusinessObject; //For accessing business object class
//Code Owner: KARTHIKEYAN JAWAHAR JOTHI
namespace BusinessLogic
{
    public class DepartmentBL
    {
        public void AddDepartment(DepartmentBO dbo) //Accessing DepartmentBO 
        {
            DepartmentDA dda = new DepartmentDA(); //Creating object access
            dda.AddDepartment(dbo); //Calling method from data access class
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
