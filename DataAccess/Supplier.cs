//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class Supplier
    {
        public Supplier()
        {
            this.PurchaseOrders = new HashSet<PurchaseOrder>();
            this.SupplierItems = new HashSet<SupplierItem>();
        }
    
        public string SupplierID { get; set; }
        public string SupplierName { get; set; }
        public string ContactName { get; set; }
        public Nullable<int> Phone { get; set; }
        public Nullable<int> Fax { get; set; }
        public string Address { get; set; }
        public string GSTNo { get; set; }
    
        public virtual ICollection<PurchaseOrder> PurchaseOrders { get; set; }
        public virtual ICollection<SupplierItem> SupplierItems { get; set; }
    }
}
