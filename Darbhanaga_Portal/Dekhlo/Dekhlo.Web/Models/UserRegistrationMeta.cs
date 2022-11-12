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

    [MetadataType(typeof(UserRegistrationMeta))]
    public partial class UserRegistration
    {
    }
    
    public partial class UserRegistrationMeta
    {
        //public UserRegistration()
        //{
        //    this.VisitorCateogries = new HashSet<VisitorCateogry>();
        //    this.Pvcs = new HashSet<Pvc>();
        //}
    
        public long Id { get; set; }

        [Display(Name = "First Name")]
        [Required]
        [RegularExpression(@"^[a-zA-Z]+$", ErrorMessage = "Use letters only please")]
        public string FirstName { get; set; }

        [Display(Name = "Middle Name")]
        public string MiddleName { get; set; }

        [Display(Name = "Last Name")]
        [Required]
        [RegularExpression(@"^[a-zA-Z]+$", ErrorMessage = "Use letters only please")]
        public string LastName { get; set; }

        
        public string Address { get; set; }

        [Display(Name = "Email Id")]
        [DataType(DataType.EmailAddress)]
        public string EmailId { get; set; }

        [Display(Name = "Mobile No")]
        [Required]
        [DataType(DataType.PhoneNumber, ErrorMessage="Phone number not valid")]
        public string MobileNo { get; set; }

        [Display(Name = "User Name")]
        public string UserName { get; set; }

        [Display(Name = "Profile Pic")]

        public byte[] ProfilePic { get; set; }

        [Display(Name = "VisitorId")]
        public Nullable<bool> IsVisitor { get; set; }

      
        public Nullable<int> Status { get; set; }

        [Display(Name = "Created On")]
        public Nullable<System.DateTime> CreatedOn { get; set; }

        [Display(Name = "Created By")]
        public Nullable<long> CreatedBy { get; set; }

        [Display(Name = "Updated On")]
        public Nullable<System.DateTime> UpdatedOn { get; set; }

        [Display(Name = "Update By")]
        public Nullable<long> UpdateBy { get; set; }

        [Display(Name = "Pin Code")]
        public string PinCode { get; set; }

        [Display(Name = "Status Condition")]
    
        public virtual StatusCondition StatusCondition { get; set; }
        public virtual ICollection<VisitorCateogry> VisitorCateogries { get; set; }
        public virtual ICollection<Pvc> Pvcs { get; set; }
    }
}
