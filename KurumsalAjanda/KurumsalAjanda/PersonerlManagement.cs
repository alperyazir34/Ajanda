using KurumsalAjanda.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Helpers;


namespace KurumsalAjanda
{
    public class PersonerlManagement
    {
        KurumsalAjandaEntities db=new KurumsalAjandaEntities();
        public bool KullaniciLoginSrgu(string email,string sifre)
        {
            var md5 = Crypto.Hash(sifre,"MD5");
            db = new Models.KurumsalAjandaEntities();
            var sorgu = db.Personeller.Where(i => i.E_Mail.Equals(email) && i.Sifre.Equals(md5)).SingleOrDefault();
            if (sorgu!=null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public void AdminYap(int id)
        {
            var result = (from i in db.Personeller where i.Personel_ID == id select i).SingleOrDefault();
            result.Admin = true;
            db.SaveChanges();
        }
        public void AdminKaldır(int id)
        {
            var result = (from i in db.Personeller where i.Personel_ID == id select i).SingleOrDefault();
            result.Admin = false;
            db.SaveChanges();
        }
        public static byte[] ImageToBinary(string path)
        {
            FileStream fileStream = new FileStream(path, FileMode.Open, FileAccess.Read);
            byte[] binarydata = new byte[fileStream.Length];
            fileStream.Read(binarydata, 0, (int)fileStream.Length);
            fileStream.Close();
            return binarydata;
        }
    }
}