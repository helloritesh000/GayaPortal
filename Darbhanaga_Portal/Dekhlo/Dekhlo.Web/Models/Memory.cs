//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Dekhlo.Web.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Memory
    {
        public Memory()
        {
            this.MemoryPictures = new HashSet<MemoryPicture>();
        }
    
        public long Id { get; set; }
        public long UserId { get; set; }
        public byte[] ProfilePic { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailId { get; set; }
        public string MobileNo { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<long> CreatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<long> UpdatedOBy { get; set; }
    
        public virtual UserRegistration UserRegistration { get; set; }
        public virtual ICollection<MemoryPicture> MemoryPictures { get; set; }
    }
}
