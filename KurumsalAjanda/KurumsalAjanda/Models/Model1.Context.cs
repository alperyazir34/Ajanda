﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KurumsalAjanda.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class KurumsalAjandaEntities : DbContext
    {
        public KurumsalAjandaEntities()
            : base("name=KurumsalAjandaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Departmanlar> Departmanlar { get; set; }
        public virtual DbSet<Is_Detay> Is_Detay { get; set; }
        public virtual DbSet<Is_Turleri> Is_Turleri { get; set; }
        public virtual DbSet<Izindekiler> Izindekiler { get; set; }
        public virtual DbSet<Musteriler> Musteriler { get; set; }
        public virtual DbSet<Personeller> Personeller { get; set; }
        public virtual DbSet<Saat> Saat { get; set; }
        public virtual DbSet<Toplanti_Onemi> Toplanti_Onemi { get; set; }
        public virtual DbSet<Toplantilar> Toplantilar { get; set; }
    }
}