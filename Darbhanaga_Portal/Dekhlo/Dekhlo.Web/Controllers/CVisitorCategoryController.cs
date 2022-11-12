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
    public class CVisitorCategoryController : Controller
    {
        private PORTALEntitiy db = new PORTALEntitiy();

        //
        // GET: /CVisitorCategory/

        public ActionResult Index()
        {
            var visitorcateogries = db.VisitorCateogries.Include(v => v.Cateogry).Include(v => v.UserRegistration);
            return View(visitorcateogries.ToList());
        }

        //
        // GET: /CVisitorCategory/Details/5

        public ActionResult Details(long id = 0)
        {
            VisitorCateogry visitorcateogry = db.VisitorCateogries.Find(id);
            if (visitorcateogry == null)
            {
                return HttpNotFound();
            }
            return View(visitorcateogry);
        }

        //
        // GET: /CVisitorCategory/Create

        public ActionResult Create()
        {
            ViewBag.CateogryId = new SelectList(db.Cateogries, "Id", "CateogryName");
            ViewBag.VisitorId = new SelectList(db.UserRegistrations, "Id", "FirstName");
            return View();
        }

        //
        // POST: /CVisitorCategory/Create

        [HttpPost]
        public ActionResult Create(VisitorCateogry visitorcateogry)
        {
            if (ModelState.IsValid)
            {
                visitorcateogry.CreatedOn = DateTime.Now;
                visitorcateogry.CreatedBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.VisitorCateogries.Add(visitorcateogry);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CateogryId = new SelectList(db.Cateogries, "Id", "CateogryName", visitorcateogry.CateogryId);
            ViewBag.VisitorId = new SelectList(db.UserRegistrations, "Id", "FirstName", visitorcateogry.VisitorId);
            return View(visitorcateogry);
        }

        //
        // GET: /CVisitorCategory/Edit/5

        public ActionResult Edit(long id = 0)
        {
            VisitorCateogry visitorcateogry = db.VisitorCateogries.Find(id);
            if (visitorcateogry == null)
            {
                return HttpNotFound();
            }
            ViewBag.CateogryId = new SelectList(db.Cateogries, "Id", "CateogryName", visitorcateogry.CateogryId);
            ViewBag.VisitorId = new SelectList(db.UserRegistrations, "Id", "FirstName", visitorcateogry.VisitorId);
            return View(visitorcateogry);
        }

        //
        // POST: /CVisitorCategory/Edit/5

        [HttpPost]
        public ActionResult Edit(VisitorCateogry visitorcateogry)
        {
            if (ModelState.IsValid)
            {
                visitorcateogry.UpdatedOn = DateTime.Now;
                visitorcateogry.UpdateBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.Entry(visitorcateogry).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CateogryId = new SelectList(db.Cateogries, "Id", "CateogryName", visitorcateogry.CateogryId);
            ViewBag.VisitorId = new SelectList(db.UserRegistrations, "Id", "FirstName", visitorcateogry.VisitorId);
            return View(visitorcateogry);
        }

        //
        // GET: /CVisitorCategory/Delete/5

        public ActionResult Delete(long id = 0)
        {
            VisitorCateogry visitorcateogry = db.VisitorCateogries.Find(id);
            if (visitorcateogry == null)
            {
                return HttpNotFound();
            }
            return View(visitorcateogry);
        }

        //
        // POST: /CVisitorCategory/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            VisitorCateogry visitorcateogry = db.VisitorCateogries.Find(id);
            db.VisitorCateogries.Remove(visitorcateogry);
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