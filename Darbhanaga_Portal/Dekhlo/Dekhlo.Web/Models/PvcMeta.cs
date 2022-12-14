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
    using System.ComponentModel.DataAnnotations;

    [MetadataType(typeof(PvcMeta))]
    public partial class Pvc
    {
    }
    
    public partial class PvcMeta
    {
        //public Pvc()
        //{
        //    this.PvcAdharDocuments = new HashSet<PvcAdharDocument>();
        //}
    
        public long Id { get; set; }

         [Display(Name = "User Id")]
        public Nullable<long> UserId { get; set; }

         [Display(Name = "Number of Copies")]
        public Nullable<int> NumberofCopies { get; set; }

         [Display(Name = "Pin Code")]
         public string PinCode { get; set; }

         [Display(Name = "Created On")]
        public Nullable<System.DateTime> CreatedOn { get; set; }

         [Display(Name = "Created By")]
        public Nullable<long> CreatedBy { get; set; }

         [Display(Name = "Updated On")]
        public Nullable<System.DateTime> UpdatedOn { get; set; }

         [Display(Name = "Updated By")]
        public Nullable<long> UpdateBy { get; set; }

         [Display(Name = "Term Accepted")]
        public Nullable<bool> IsTermAccepted { get; set; }

         [Display(Name = "User Registration")]
    
        public virtual UserRegistration UserRegistration { get; set; }
        public virtual ICollection<PvcAdharDocument> PvcAdharDocuments { get; set; }
    }
}
