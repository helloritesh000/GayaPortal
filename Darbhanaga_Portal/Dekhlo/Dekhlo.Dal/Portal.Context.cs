﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Dekhlo.Dal
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class PORTALEntities : DbContext
    {
        public PORTALEntities()
            : base("name=PORTALEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Cateogry> Cateogries { get; set; }
        public DbSet<Post> Posts { get; set; }
        public DbSet<PostCateogryMapping> PostCateogryMappings { get; set; }
        public DbSet<PostImage> PostImages { get; set; }
        public DbSet<StatusCondition> StatusConditions { get; set; }
        public DbSet<SubCateogry> SubCateogries { get; set; }
        public DbSet<UserRegistration> UserRegistrations { get; set; }
        public DbSet<VisitorCateogry> VisitorCateogries { get; set; }
    }
}