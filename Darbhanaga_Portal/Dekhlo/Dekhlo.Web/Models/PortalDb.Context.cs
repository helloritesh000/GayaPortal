﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class PORTALEntitiy : DbContext
    {
        public PORTALEntitiy()
            : base("name=PORTALEntitiy")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<PostCateogryMapping> PostCateogryMappings { get; set; }
        public DbSet<PostImage> PostImages { get; set; }
        public DbSet<StatusCondition> StatusConditions { get; set; }
        public DbSet<VisitorCateogry> VisitorCateogries { get; set; }
        public DbSet<Cateogry> Cateogries { get; set; }
        public DbSet<SliderConfig> SliderConfigs { get; set; }
        public DbSet<PageContent> PageContents { get; set; }
        public DbSet<Logo> Logoes { get; set; }
        public DbSet<PopularSearch> PopularSearches { get; set; }
        public DbSet<UserRegistration> UserRegistrations { get; set; }
        public DbSet<webpages_Membership> webpages_Membership { get; set; }
        public DbSet<webpages_OAuthMembership> webpages_OAuthMembership { get; set; }
        public DbSet<webpages_Roles> webpages_Roles { get; set; }
        public DbSet<PvcAdharDocument> PvcAdharDocuments { get; set; }
        public DbSet<Pvc> Pvcs { get; set; }
        public DbSet<SearchYourNeed> SearchYourNeeds { get; set; }
        public DbSet<SearchYourNeedLink> SearchYourNeedLinks { get; set; }
        public DbSet<Memory> Memories { get; set; }
        public DbSet<MemoryPicture> MemoryPictures { get; set; }
        public DbSet<Post> Posts { get; set; }
        public DbSet<Enquiry> Enquiries { get; set; }
        public DbSet<webpages_UsersInRoles> webpages_UsersInRoles { get; set; }
        public DbSet<Search> Searches { get; set; }
        public DbSet<ExceptionLogger> ExceptionLoggers { get; set; }
        public DbSet<Otp> Otps { get; set; }
    }
}
