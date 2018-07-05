using KurumsalAjanda.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KurumsalAjanda
{
    public class MusteriManagement
    {
        KurumsalAjandaEntities db = new KurumsalAjandaEntities();
        public List<Musteriler> ListAllMusteri()
        {
            return (from i in db.Musteriler where i.Is_Active != false select i).ToList();
        }
        public void InsertMusteri(string departmanAdi, string sifre, string ad, string soyad, string basHarf, DateTime dogumTrh, string E_mail, string tel_no, string vasfi)
        {
            Musteriler Musteri = new Musteriler()
            {
                Departman_Adi = departmanAdi,
                Sifre = sifre,
                Ad = ad,
                Soyad = soyad,
                Bas_Harfler = basHarf,
                Dogum_Tarihi = dogumTrh,
                E_Mail = E_mail,
                Telefon_No = tel_no,
                Vasfi = vasfi
            };
            db.Musteriler.Add(Musteri);
            db.SaveChanges();
        }
        public bool MusteriLoginSorgu(string email, string sifre)
        {
            db = new Models.KurumsalAjandaEntities();
            var sorgu = db.Musteriler.Where(i => i.E_Mail.Equals(email) && i.Sifre.Equals(sifre)).SingleOrDefault();
            if (sorgu != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}