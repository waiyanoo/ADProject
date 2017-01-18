using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccess;

namespace BusinessLogic
{
    public class SupplierBL
    {
        public void AddSupplier(SupplierBO sbo)
        {
            SupplierDA sda = new SupplierDA();
            sda.AddSupplier(sbo);
        }

        public void DeleteSupplier(String id)
        {
            SupplierDA sda = new SupplierDA();
            sda.deleteSupplier(id);
        }
    }
}
