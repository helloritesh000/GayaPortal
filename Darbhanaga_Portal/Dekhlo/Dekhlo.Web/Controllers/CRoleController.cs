using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dekhlo.Web.Models;

namespace Dekhlo.Web.Controllers
{
    [HandleErrorCustom(View="ErrorAdmin")]
    public class CRoleController : Controller
    {
        private PORTALEntitiy db = new PORTALEntitiy();

        //
        // GET: /CRole/

        public ActionResult Index()
        {
            return View(db.webpages_Roles.ToList());
        }

        //
        // GET: /CRole/Details/5

        public ActionResult Details(int id = 0)
        {
            webpages_Roles webpages_roles = db.webpages_Roles.Find(id);
            if (webpages_roles == null)
            {
                return HttpNotFound();
            }
            return View(webpages_roles);
        }

        //
        // GET: /CRole/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /CRole/Create

        [HttpPost]
        public ActionResult Create(webpages_Roles webpages_roles)
        {
            if (ModelState.IsValid)
            {
                db.webpages_Roles.Add(webpages_roles);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(webpages_roles);
        }

        //
        // GET: /CRole/Edit/5

        public ActionResult Edit(int id = 0)
        {
            webpages_Roles webpages_roles = db.webpages_Roles.Find(id);
            if (webpages_roles == null)
            {
                return HttpNotFound();
            }
            return View(webpages_roles);
        }

        //
        // POST: /CRole/Edit/5

        [HttpPost]
        public ActionResult Edit(webpages_Roles webpages_roles)
        {
            if (ModelState.IsValid)
            {
                db.Entry(webpages_roles).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(webpages_roles);
        }

        //
        // GET: /CRole/Delete/5

        public ActionResult Delete(int id = 0)
        {
            webpages_Roles webpages_roles = db.webpages_Roles.Find(id);
            if (webpages_roles == null)
            {
                return HttpNotFound();
            }
            return View(webpages_roles);
        }

        //
        // POST: /CRole/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            webpages_Roles webpages_roles = db.webpages_Roles.Find(id);
            db.webpages_Roles.Remove(webpages_roles);
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