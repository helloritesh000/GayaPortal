using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dekhlo.Web.Models;
using System.IO;
using System.Text;
using System.Drawing;

namespace Dekhlo.Web.Controllers
{
    [HandleErrorCustom(View="ErrorAdmin")]
    public class CLogoController : Controller
    {
        private PORTALEntitiy db = new PORTALEntitiy();

        //
        // GET: /CLogo/

        public ActionResult Index()
        {
            //Image image = Image.FromStream()
            return View(db.Logoes.ToList());
        }

        public Image ByteArrayToImage(byte[] byteArrayIn)
        {
            using (MemoryStream mStream = new MemoryStream(byteArrayIn))
            {
                return Image.FromStream(mStream);
            }
        }

        //
        // GET: /CLogo/Details/5

        public ActionResult Details(int id = 0)
        {
            Logo logo = db.Logoes.Find(id);
            if (logo == null)
            {
                return HttpNotFound();
            }
            return View(logo);
        }

        //
        // GET: /CLogo/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /CLogo/Create

        [HttpPost]
        public ActionResult Create(Logo logo, FormCollection formCollection)
        {
            if (ModelState.IsValid)
            {
                byte[] fileData = null;
                using (var binaryReader = new BinaryReader(Request.Files["fldImageContent"].InputStream))
                {
                    fileData = binaryReader.ReadBytes(Request.Files["fldImageContent"].ContentLength);
                }
                logo.ImageContent = fileData;
                //logo.CreatedOn = DateTime.Now;
                //logo.CreatedBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.Logoes.Add(logo);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(logo);
        }

        //
        // GET: /CLogo/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Logo logo = db.Logoes.Find(id);
            if (logo == null)
            {
                return HttpNotFound();
            }
            return View(logo);
        }

        //
        // POST: /CLogo/Edit/5

        [HttpPost]
        public ActionResult Edit(Logo logo)
        {
            if (ModelState.IsValid)
            {
                byte[] fileData = null;
                using (var binaryReader = new BinaryReader(Request.Files["fldImageContent"].InputStream))
                {
                    fileData = binaryReader.ReadBytes(Request.Files["fldImageContent"].ContentLength);
                }
                logo.ImageContent = fileData;
                //logo.UpdatedOn = DateTime.Now;
                //logo.UpdateBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.Entry(logo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(logo);
        }

        //
        // GET: /CLogo/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Logo logo = db.Logoes.Find(id);
            if (logo == null)
            {
                return HttpNotFound();
            }
            return View(logo);
        }

        //
        // POST: /CLogo/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Logo logo = db.Logoes.Find(id);
            db.Logoes.Remove(logo);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}