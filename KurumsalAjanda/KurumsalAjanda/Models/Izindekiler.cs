//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Izindekiler
    {
        public int Izindekiler_ID { get; set; }
        public Nullable<int> Personel_ID { get; set; }
        public Nullable<int> Deparman_ID { get; set; }
        public Nullable<System.DateTime> Izine_Cikis_Tarihi { get; set; }
        public Nullable<System.DateTime> Izinden_Donus_Tarihi { get; set; }
        public bool Is_Active { get; set; }
    
        public virtual Departmanlar Departmanlar { get; set; }
        public virtual Personeller Personeller { get; set; }
    }
}