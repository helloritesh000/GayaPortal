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
    
    public partial class SearchYourNeedLink
    {
        public SearchYourNeedLink()
        {
            this.SearchYourNeeds = new HashSet<SearchYourNeed>();
        }
    
        public long Id { get; set; }
        public string LinkType { get; set; }
        public string LinkText { get; set; }
        public bool Status { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<long> CreatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<long> UpdateBy { get; set; }
    
        public virtual ICollection<SearchYourNeed> SearchYourNeeds { get; set; }
    }
}
