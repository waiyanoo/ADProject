using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;


namespace DataAccess
{
    public class SupplierDA
    {
        LogicUniversityEntities context = new LogicUniversityEntities();
        public void AddSupplier(SupplierBO sbo)
        {
            
            Supplier supplier = new Supplier();

            supplier.SupplierID = sbo.SupplierID;
            supplier.SupplierName = sbo.SupplierName;
            supplier.ContactName = sbo.ContactName;
            supplier.Phone = Convert.ToInt32(sbo.Phone);
            supplier.Fax = Convert.ToInt32(sbo.Fax);
            supplier.Address = sbo.Address;
            supplier.GSTNo = sbo.GSTNo1;
            context.Suppliers.Add(supplier);
            context.SaveChanges();
            
        }

        public void deleteSupplier(String id)
        {
            var supplier = context.Suppliers.FirstOrDefault(s => s.SupplierID == id);
            if (supplier!= null)
            {
                context.Suppliers.Remove(supplier);
                context.SaveChanges();
            }
        }

        public List<Supplier> getAllSupplier()
        {
            return context.Suppliers.ToList<Supplier>();
        }

        public SupplierBO getSupplierbyID(String id)
        {
            Supplier supplier = new Supplier();
            supplier = context.Suppliers.First(i => i.SupplierID==id);
            SupplierBO sbo = new SupplierBO();
            sbo.SupplierID = supplier.SupplierID;
            sbo.SupplierName = supplier.SupplierName;
            sbo.ContactName = supplier.ContactName;
            sbo.Phone = supplier.Phone.ToString();
            sbo.Fax = supplier.Fax.ToString();
            sbo.Address = supplier.Address;
            sbo.GSTNo1 = supplier.GSTNo;
            return sbo;
        }
    }
}
