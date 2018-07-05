using KurumsalAjanda.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KurumsalAjanda.Controllers
{
    public class IsController : Controller
    {
        KurumsalAjandaEntities db = new KurumsalAjandaEntities();
        
        public IsController()
        {

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


            MultiSelectList talepeden = new MultiSelectList(db.Personeller.ToList(), "Personel_ID", "Ad");
            SelectList isdurumu = new SelectList(db.Toplanti_Onemi.ToList(), "Toplanti_Onemi_ID", "Toplanti_Isim");
            SelectList talepbirim = new SelectList(db.Departmanlar.ToList(), "Departman_ID", "Departman_Adi");
            SelectList isturu = new SelectList(db.Is_Turleri.ToList(), "Is_Turu_ID", "Tur_Adi");
            ViewBag.talepeden = talepeden;
            ViewBag.isdurumu = isdurumu;
            ViewBag.talepbirim = talepbirim;
            ViewBag.isturu = isturu;
            return View("IsForm");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Kaydet(int talepeden, int isdurumu, int talepbirim, int isturu, string baslik, string aciklama, DateTime baslamatarihi, DateTime bitistarihi, Is_Detay Isx)
        {

            MultiSelectList talepedena = new MultiSelectList(db.Personeller.ToList(), "Personel_ID", "Ad");
            SelectList isdurumua = new SelectList(db.Toplanti_Onemi.ToList(), "Toplanti_Onemi_ID", "Toplanti_Isim");
            SelectList talepbirima = new SelectList(db.Departmanlar.ToList(), "Departman_ID", "Departman_Adi");
            SelectList isturua = new SelectList(db.Is_Turleri.ToList(), "Is_Turu_ID", "Tur_Adi");
            ViewBag.talepeden = talepedena;
            ViewBag.isdurumu = isdurumua;
            ViewBag.talepbirim = talepbirima;
            ViewBag.isturu = isturua;
            if (Session["email"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            if (!Session["Yetki"].Equals(true))
            {
                return RedirectToAction("yetki", "Home");
            }

            if (Isx.Is_Detay_ID == 0)
            {
                var Is = new Is_Detay();
                Is.Personel_ID = talepeden;
                Is.Toplanti_Onemi_ID = isdurumu;
                Is.Departman_ID = talepbirim;
                Is.Is_Turu_ID = isturu;
                Is.Isin_Adi = baslik;
                Is.Isin_Açiklamasi = aciklama;
                Is.Baslama_tarihi = baslamatarihi;
                Is.Bitis_Tarihi = bitistarihi;
                Is.Is_Active = true;
                db.Is_Detay.Add(Is);
            }
            else
            {
                var guncellenecekIs = db.Is_Detay.Find(Isx.Is_Detay_ID);
                if (guncellenecekIs == null)
                {
                    return HttpNotFound();
                }
                guncellenecekIs.Personel_ID = talepeden;
                guncellenecekIs.Toplanti_Onemi_ID = isdurumu;
                guncellenecekIs.Departman_ID = talepbirim;
                guncellenecekIs.Is_Turu_ID = isturu;
                guncellenecekIs.Isin_Adi = baslik;
                guncellenecekIs.Isin_Açiklamasi = aciklama;
                guncellenecekIs.Baslama_tarihi = baslamatarihi;
                guncellenecekIs.Bitis_Tarihi = bitistarihi;
                guncellenecekIs.Is_Active = true;
            }
            db.SaveChanges();
            ViewBag.eklemebasarili = "İşlem Başarılı.";
            return View("IsForm");
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
            List<Is_Detay> model = db.Is_Detay.ToList();
            return View(model);
        }
        public ActionResult Guncelle(int id)
        {
            if (Session["email"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            if (!Session["Yetki"].Equals(true))
            {
                return RedirectToAction("yetki", "Home");
            }
            MultiSelectList talepedena = new MultiSelectList(db.Personeller.ToList(), "Personel_ID", "Ad");
            SelectList isdurumua = new SelectList(db.Toplanti_Onemi.ToList(), "Toplanti_Onemi_ID", "Toplanti_Isim");
            SelectList talepbirima = new SelectList(db.Departmanlar.ToList(), "Departman_ID", "Departman_Adi");
            SelectList isturua = new SelectList(db.Is_Turleri.ToList(), "Is_Turu_ID", "Tur_Adi");
            ViewBag.talepeden = talepedena;
            ViewBag.isdurumu = isdurumua;
            ViewBag.talepbirim = talepbirima;
            ViewBag.isturu = isturua;
            var model = db.Is_Detay.Find(id);
            if (model == null)
                return HttpNotFound();
            return View("IsForm", model);
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
            var silinecekIs = db.Is_Detay.Find(id);
            if (silinecekIs == null)
                return HttpNotFound();
            silinecekIs.Is_Active = false;
            db.SaveChanges();
            return RedirectToAction("Listele");
        }
    }
}