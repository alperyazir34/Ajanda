using KurumsalAjanda.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KurumsalAjanda.Controllers
{
    public class MusteriController : Controller
    {
        KurumsalAjanda.Models.KurumsalAjandaEntities db = new KurumsalAjandaEntities();
        MusteriManagement musteri = new MusteriManagement();
        [HttpGet]
        public ActionResult Giris_Kayit()
        {
            if (Session["email"] != null)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Giris_Kayit(string departmanAdi, string sifre, string ad, string soyad, string basHarf, DateTime dogumTrh, string email, string tel_no, string vasfi, string sifretekrar)
        {
            var musterisorgu = (from i in db.Musteriler where i.E_Mail == email select i).Count();
            try
            {
                if (musterisorgu <0 && sifre==sifretekrar)
                {
                    var musteri = new Musteriler();
                    musteri.Ad = ad;
                    musteri.Soyad = soyad;
                    musteri.Bas_Harfler = basHarf;
                    musteri.Dogum_Tarihi = dogumTrh;
                    musteri.Telefon_No = tel_no;
                    musteri.Vasfi = vasfi;
                    musteri.E_Mail = email;
                    musteri.Departman_Adi = departmanAdi;
                    musteri.Sifre = sifre;
                    db.Musteriler.Add(musteri);
                    db.SaveChanges();
                    return View();
                }
                else
                {
                    if (sifre != sifretekrar)
                    {
                        ViewBag.hata = "Şifreler Uyuşmuyor.";
                    }
                    else
                    {
                        ViewBag.hata = "Böyle bir kayıt zaten mevcut.";
                    }

                }
            }
            catch (Exception)
            {
                throw;
            }
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string kullaniciAdiLogin, string kullaniciSifreLogin)
        {
            db = new Models.KurumsalAjandaEntities();
            MusteriManagement kullanici = new MusteriManagement();
            if (kullanici.MusteriLoginSorgu(kullaniciAdiLogin, kullaniciSifreLogin) == true)
            {
                Musteriler sorgu = (from i in db.Musteriler where i.E_Mail==kullaniciAdiLogin && i.Sifre == kullaniciSifreLogin select i).Single();
                Session["email"] = kullaniciAdiLogin;
                Session["AdSoyad"] = sorgu.Ad + " " + sorgu.Soyad;
                Session["Yetki"] = false;
                Session["BasHarf"] = sorgu.Bas_Harfler;
                Session.Timeout = 30;
                return RedirectToAction("Index", "Home");

            }
            else
            {
                ViewBag.hata = "UYARI : Kullanıcı adını veya şifreyi hatalı girdiniz";
                return View("Index");
            }
        }
        public ActionResult Listele()
        {
            if (Session["email"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            var musteri = (from i in db.Musteriler where i.Is_Active==true select i).ToList();
            return View(musteri);
        }
    }
}