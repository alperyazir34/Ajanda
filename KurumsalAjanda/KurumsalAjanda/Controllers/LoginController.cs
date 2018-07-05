using KurumsalAjanda.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Helpers;

namespace KurumsalAjanda.Controllers
{

    public class LoginController : Controller
    {


        KurumsalAjandaEntities db = new KurumsalAjandaEntities();
        [HttpGet]
        public ActionResult Index()
        {
            if (Session["email"]!=null)
            {
                return RedirectToAction("Index","Home");
            }
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(string kullaniciAdiLogin,string kullaniciSifreLogin)
        {
            db = new Models.KurumsalAjandaEntities();
            PersonerlManagement kullanici = new PersonerlManagement();
            var md5 = Crypto.Hash(kullaniciSifreLogin, "MD5");
            if (kullanici.KullaniciLoginSrgu(kullaniciAdiLogin, md5))
            {
                Personeller sorgu = (from i in db.Personeller where i.E_Mail == kullaniciAdiLogin && i.Sifre == kullaniciSifreLogin select i).Single();
                Session["email"] = kullaniciAdiLogin;
                Session["AdSoyad"] =sorgu.Ad + " " + sorgu.Soyad;
                Session["Yetki"] = sorgu.Admin;
                Session["BasHarf"]=sorgu.Bas_Harfler;
                return RedirectToAction("Index", "Home");

            }
            else
            {
                ViewBag.hata = "UYARI : Kullanıcı adını veya şifreyi hatalı girdiniz";
                return View("Index");
            }
        }
    }
}
