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
    
    public partial class User
    {
        public User()
        {
            this.Requisitions = new HashSet<Requisition>();
        }
    
        public string UserID { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public string RoleName { get; set; }
        public string Email { get; set; }
        public Nullable<int> Phone { get; set; }
        public string DepartmentID { get; set; }
        public Nullable<int> Whatsapp { get; set; }
        public byte[] Photo { get; set; }
    
        public virtual Department Department { get; set; }
        public virtual ICollection<Requisition> Requisitions { get; set; }
        public virtual Role Role { get; set; }
    }
}
