using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;//For accessing data access class
using DataAccess;//For accessing business object class

//Code Owner: EI YADANAR KYAW

namespace BusinessLogic
{
    public class SupplierBL
    {
        //Adding a new supplier
        public void AddSupplier(SupplierBO sbo)
        {
            SupplierDA sda = new SupplierDA();
            //Calling a method from supplierDA
            sda.AddSupplier(sbo);
        }

        //Updating the supplier information
        public bool UpdateSupplier(SupplierBO sbo)
        {
            SupplierDA sda = new SupplierDA();
            //Calling a method from supplierDA
            sda.UpdateSupplier(sbo);
            return true;
        }

        //to get the list of the suppliers
        public List<Supplier> GetAllSupplier()
        {
            SupplierDA sda = new SupplierDA();
            //Calling a method from supplierDA
            return sda.getAllSupplier();
        }

        //get supplier by id
        public SupplierBO GetSupplierbyID(String id)
        {
            SupplierDA sda = new SupplierDA();
            //Calling a method from supplierDA
            return sda.getSupplierbyID(id);
        }

       

       
    }
}
