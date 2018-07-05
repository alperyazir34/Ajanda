using KurumsalAjanda.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KurumsalAjanda.Controllers
{
    public class ToplantiController : Controller
    {
        KurumsalAjandaEntities db;
        public ToplantiController()
        {
            db = new KurumsalAjandaEntities();
        }
        public ActionResult Listele()
        {
            if (Session["email"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            var toplanti= (from i in db.Toplantilar where i.Is_Active == true select i).ToList();
            return View(toplanti);
        }
        [HttpGet]
        public ActionResult Ekle()
        {
            var selectlistper = (from i in db.Personeller where i.Is_Active.Value select i).ToList();
            var selectlistmus = (from i in db.Musteriler where i.Is_Active.Value select i).ToList();
            SelectList saatx = new SelectList(db.Saat.ToList(), "Id", "saat1");
            SelectList onemi = new SelectList(db.Toplanti_Onemi.ToList(), "Toplanti_Onemi_ID", "Toplanti_Isim");
            MultiSelectList katilimciperx = new MultiSelectList(selectlistper, "Ad", "Ad");
            MultiSelectList katilimcimusx = new MultiSelectList(selectlistmus, "Ad", "Ad");
            ViewBag.saat = saatx;
            ViewBag.onem = onemi;
            ViewBag.katilimciper = katilimciperx;
            ViewBag.katilimcimus = katilimcimusx;
            if (Session["email"] == null)
            {
                return RedirectToAction("Index", "Login");
            }

            return View();
        }
        [HttpPost]
        public ActionResult Kaydet(DateTime toplantitarih, int saat,int onem, string ad,string aciklama, Toplantilar toplantiX)
        {
            var selectlistper = (from i in db.Personeller where i.Is_Active.Value select i).ToList();
            var selectlistmus = (from i in db.Musteriler where i.Is_Active.Value select i).ToList();
            SelectList saatx = new SelectList(db.Saat.ToList(), "Id", "saat1");
            SelectList onemi = new SelectList(db.Toplanti_Onemi.ToList(), "Toplanti_Onemi_ID", "Toplanti_Isim");
            MultiSelectList katilimciperx = new MultiSelectList(selectlistper, "Ad", "Ad");
            MultiSelectList katilimcimusx = new MultiSelectList(selectlistmus, "Ad", "Ad");
            ViewBag.saat = saatx;
            ViewBag.onem = onemi;
            ViewBag.katilimciper = katilimciperx;
            ViewBag.katilimcimus = katilimcimusx;
            string katilimciper = Request.Form["katilimciper"];
            string[] katilimcilarper = katilimciper.Split(',');
            string katilimciperList = string.Empty;
            for (int i = 0; i < katilimcilarper.Length; i++)
            {
                katilimciperList += katilimcilarper[i].TrimEnd(' ');
                katilimciperList += ",";
            }
            string katilimcimus = Request.Form["katilimcimus"];
            string katilimcimusList = string.Empty;
            for (int i = 0; i < katilimcimus.Split(',').Length; i++)
            {
                katilimcimusList += katilimcimus.Split(',')[i].TrimEnd(' ');
                katilimcimusList += ",";
            }
            
            if (toplantiX.Toplanti_ID==0)
            {

                var toplanti = new Toplantilar();
                toplanti.Toplanti_Tarih = toplantitarih;
                toplanti.Saat_ID = saat;
                toplanti.Toplanti_Onemi_ID = onem;
                toplanti.Toplanti_Ad = ad;
                toplanti.Toplanti_Aciklama = aciklama;
                toplanti.Katılan_Personeller = katilimciperList;
                toplanti.Katılan_Musteri = katilimcimus;
                toplanti.Is_Active = true;
                db.Toplantilar.Add(toplanti);
            }
            else
            {
                var guncellenecektoplanti = db.Toplantilar.Find(toplantiX.Toplanti_ID);
                if (guncellenecektoplanti==null)
                {
                    return HttpNotFound();
                }
                guncellenecektoplanti.Toplanti_Tarih = toplantitarih;
                guncellenecektoplanti.Saat_ID = saat;
                guncellenecektoplanti.Toplanti_Onemi_ID = onem;
                guncellenecektoplanti.Toplanti_Ad = ad;
                guncellenecektoplanti.Toplanti_Aciklama = aciklama;
                guncellenecektoplanti.Katılan_Personeller = katilimciper;
                guncellenecektoplanti.Katılan_Musteri = katilimcimus;
                guncellenecektoplanti.Is_Active = true;
            }
            db.SaveChanges();
            ViewBag.eklemebasarili = "İşlem Başarılı.";
            return RedirectToAction("Listele");
        }
        public ActionResult Guncelle(int id)
        {
            var selectlistper = (from i in db.Personeller where i.Is_Active.Value select i).ToList();
            var selectlistmus = (from i in db.Musteriler where i.Is_Active.Value select i).ToList();
            SelectList saatx = new SelectList(db.Saat.ToList(), "Id", "saat1");
            SelectList onemi = new SelectList(db.Toplanti_Onemi.ToList(), "Toplanti_Onemi_ID", "Toplanti_Isim");
            MultiSelectList katilimciperx = new MultiSelectList(selectlistper, "Ad", "Ad");
            MultiSelectList katilimcimusx = new MultiSelectList(selectlistmus, "Ad", "Ad");
            ViewBag.saat = saatx;
            ViewBag.onem = onemi;
            ViewBag.katilimciper = katilimciperx;
            ViewBag.katilimcimus = katilimcimusx;
            if (Session["email"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            var model = db.Toplantilar.Find(id);
            if (model == null)
                return HttpNotFound();
            return View("Ekle", model);
        }
        public ActionResult Sil(int id)
        {
            if (Session["email"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            var silinecekToplanti = db.Toplantilar.Find(id);
            if (silinecekToplanti == null)
                return HttpNotFound();
            silinecekToplanti.Is_Active = false;
            db.SaveChanges();
            return RedirectToAction("Listele");
        }
    }
}