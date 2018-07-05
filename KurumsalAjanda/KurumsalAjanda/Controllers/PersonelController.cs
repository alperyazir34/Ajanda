using KurumsalAjanda.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Web.Helpers;

namespace KurumsalAjanda.Controllers
{
    public class PersonelController : Controller
    {
        KurumsalAjandaEntities db;
        SelectList departman;
        public PersonelController()
        {
            db = new KurumsalAjandaEntities();
            departman = new SelectList(db.Departmanlar, "Departman_ID", "Departman_Adi");
        }
        [HttpGet]
        public ActionResult Ekle()
        {
            if (Session["email"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            if (!Session["Yetki"].Equals(true))
            {
                return RedirectToAction("yetki", "Home");
            }
            ViewBag.departman = departman;
            return View("PersonelForm");
        }
        [HttpPost]
        public ActionResult Kaydet(int departmanAdi, string sifre, string ad, string soyad, string basHarf, DateTime dogumTrh, string email, string tel_no, string vasfi, string sifretekrar, int yillikizin, Personeller pers, HttpPostedFileBase resimyukle)
        {
            if (Session["email"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            if (!Session["Yetki"].Equals(true))
            {
                return RedirectToAction("yetki", "Home");
            }
            ViewBag.departman = departman;
            if (pers.Personel_ID == 0)
            {
                var personelsorgu = (from i in db.Personeller where i.E_Mail == email select i).Count();
                try
                {

                
                    if (personelsorgu < 1 && sifre == sifretekrar)
                    {
                        var personel = new Personeller();
                        personel.Derpartman_ID = departmanAdi;
                        personel.Sifre = Crypto.Hash(sifre, "MD5");
                        personel.Ad = ad;
                        personel.Soyad = soyad;
                        personel.Bas_Harfler = basHarf;
                        personel.Dogum_Tarihi = dogumTrh;
                        personel.E_Mail = email;
                        personel.Telefon_No = tel_no;
                        personel.Vasfi = vasfi;
                        personel.Ise_Giris_Tarihi = DateTime.Now;
                        personel.Is_Active = true;
                        personel.Admin = false;
                        personel.Yillik_Izin_Gun_Sayisi = yillikizin;
                        db.Personeller.Add(personel);
                        db.SaveChanges();

                        string Mesaj ="Sayın"+" "+ad+" "+soyad+ ", " + email+" mail adresi üzerinden Kurumsal Ajanda uygulamamıza kayıt işleminiz başarılı bir şekilde gerçekleşmiştir";
                        System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                        mail.From = new MailAddress("karagozenis1@gmail.com");//Verici
                        mail.To.Add(email);//Alıcı
                        mail.IsBodyHtml = true;//Html mi 
                        mail.Subject = "Kurumsal Ajanda Kayıt";//Mail Konusu
                        mail.BodyEncoding = System.Text.Encoding.UTF8;//UTF-8 Encoding
                        mail.Body = Mesaj;//Mail Mesajı
                        SmtpClient sc = new SmtpClient();
                        sc.Host = "smtp.gmail.com";//Smtp Host
                        sc.Port = 587;//Smtp Port
                        sc.EnableSsl = true;//Enable SSL
                        sc.Credentials = new NetworkCredential("karagozenis1@gmail.com", "enis1903");//Gmail Kulanıcı - Şifre
                        sc.Send(mail);//Mail Gönder

                        return View("PersonelForm");
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

                    return RedirectToAction("","");
                }
            }
            else
            {
                var guncellenecekpersonel = db.Personeller.Find(pers.Personel_ID);
                if (guncellenecekpersonel == null)
                {
                    return HttpNotFound();
                }
                guncellenecekpersonel.Derpartman_ID = departmanAdi;
                guncellenecekpersonel.Sifre = sifre;
                guncellenecekpersonel.Ad = ad;
                guncellenecekpersonel.Soyad = soyad;
                guncellenecekpersonel.Bas_Harfler = basHarf;
                guncellenecekpersonel.Dogum_Tarihi = dogumTrh;
                guncellenecekpersonel.E_Mail = email;
                guncellenecekpersonel.Telefon_No = tel_no;
                guncellenecekpersonel.Vasfi = vasfi;
                guncellenecekpersonel.Ise_Giris_Tarihi = DateTime.Now;
                guncellenecekpersonel.Is_Active = true;
                guncellenecekpersonel.Admin = false;
                guncellenecekpersonel.Yillik_Izin_Gun_Sayisi = yillikizin;

            }
            db.SaveChanges();
            return View("PersonelForm");
        }
        public ActionResult Listele()
        {
            if (Session["email"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            if (!Session["Yetki"].Equals(true))
            {
                return RedirectToAction("yetki", "Home");
            }
            var model = (from i in db.Personeller select i).ToList();
            return View(model);
        }
        public ActionResult Guncelle(int id)
        {
            ViewBag.departman = departman;
            if (Session["email"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            if (!Session["Yetki"].Equals(true))
            {
                return RedirectToAction("yetki", "Home");
            }
            var model = db.Personeller.Find(id);
            if (model == null)
                return HttpNotFound();
            return View("PersonelForm", model);
        }
        public ActionResult Sil(int id)
        {
            if (Session["email"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            if (!Session["Yetki"].Equals(true))
            {
                return RedirectToAction("yetki", "Home");
            }
            var silinecekPersonel = db.Personeller.Find(id);
            if (silinecekPersonel == null)
                return HttpNotFound();
            silinecekPersonel.Is_Active = false;
            db.SaveChanges();
            return RedirectToAction("Listele");
        }
    }
}