using KurumsalAjanda.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KurumsalAjanda.Controllers
{
    public class HomeController : Controller
    {

        PersonerlManagement Personel = new PersonerlManagement();
        KurumsalAjandaEntities db = new KurumsalAjandaEntities();
        // GET: Home
        public ActionResult Index()
        {
            var model = db.Personeller.ToList();
            if (Session["email"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            return View();
        }
        public ActionResult logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Login");
        }
        public ActionResult yetki()
        {
            return View();
        }
        public ActionResult AdminDuzenle()
        {
            if (!Session["email"].Equals("eniskaragoz2@gmail.com"))
            {
                return RedirectToAction("Index", "Home");
            }
            var model = (from i in db.Personeller where i.Personel_ID != 6 && i.Is_Active==true select i).ToList();
            return View(model);
        }

        public ActionResult Admin(int id)
        {
            if (!Session["email"].Equals("eniskaragoz2@gmail.com"))
            {
                return RedirectToAction("Index", "Home");
            }
            var admin = (from i in db.Personeller where id == i.Personel_ID select i.Admin).Single();
            if (admin==true)
            {
                Personel.AdminKaldır(id);
            }
            else
            {
                Personel.AdminYap(id);
            }


            return RedirectToAction("AdminDuzenle", "Home");
        }
    }

}