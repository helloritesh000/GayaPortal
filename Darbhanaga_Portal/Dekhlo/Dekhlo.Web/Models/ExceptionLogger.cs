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
    
    public partial class ExceptionLogger
    {
        public long Id { get; set; }
        public string ExceptionMessage { get; set; }
        public string ExceptionStackTrace { get; set; }
        public string ExceptionLoggedBy { get; set; }
        public Nullable<System.DateTime> ExceptionLoggedOn { get; set; }
        public string ExceptionPath { get; set; }
    }
}