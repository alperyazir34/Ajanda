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
    
    public partial class Toplantilar
    {
        public int Toplanti_ID { get; set; }
        public Nullable<System.DateTime> Toplanti_Tarih { get; set; }
        public Nullable<int> Saat_ID { get; set; }
        public Nullable<int> Toplanti_Onemi_ID { get; set; }
        public string Toplanti_Ad { get; set; }
        public string Toplanti_Aciklama { get; set; }
        public string Katılan_Personeller { get; set; }
        public string Katılan_Musteri { get; set; }
        public Nullable<bool> Is_Active { get; set; }
    
        public virtual Saat Saat { get; set; }
        public virtual Toplanti_Onemi Toplanti_Onemi { get; set; }
    }
}
