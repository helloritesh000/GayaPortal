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
    
    public partial class Otp
    {
        public long Id { get; set; }
        public long UserId { get; set; }
        public string OtpCode { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsVerified { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
    
        public virtual UserRegistration UserRegistration { get; set; }
    }
}