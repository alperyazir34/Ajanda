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
    
    public partial class Is_Detay
    {
        public int Is_Detay_ID { get; set; }
        public Nullable<int> Personel_ID { get; set; }
        public Nullable<int> Is_Turu_ID { get; set; }
        public Nullable<int> Toplanti_Onemi_ID { get; set; }
        public Nullable<int> Departman_ID { get; set; }
        public string Isin_Adi { get; set; }
        public string Isin_Açiklamasi { get; set; }
        public Nullable<System.DateTime> Baslama_tarihi { get; set; }
        public Nullable<System.DateTime> Bitis_Tarihi { get; set; }
        public Nullable<bool> Is_Active { get; set; }
    
        public virtual Departmanlar Departmanlar { get; set; }
        public virtual Is_Turleri Is_Turleri { get; set; }
        public virtual Personeller Personeller { get; set; }
        public virtual Toplanti_Onemi Toplanti_Onemi { get; set; }
    }
}
