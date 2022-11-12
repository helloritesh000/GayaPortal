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
    public class CCategoryController : Controller
    {
        private PORTALEntitiy db = new PORTALEntitiy();

        //
        // GET: /CCategory/

        public ActionResult Index()
        {
            var cateogries = db.Cateogries.Include(c => c.StatusCondition).Include(c => c.Cateogry2);
            return View(cateogries.ToList());
        }

        //
        // GET: /CCategory/Details/5

        public ActionResult Details(long id = 0)
        {
            Cateogry cateogry = db.Cateogries.Find(id);
            if (cateogry == null)
            {
                return HttpNotFound();
            }
            return View(cateogry);
        }

        //
        // GET: /CCategory/Create

        public ActionResult Create()
        {
            ViewBag.Status = new SelectList(db.StatusConditions, "Id", "StatusName");
            ViewBag.ParentCateogry = new SelectList(db.Cateogries, "Id", "CateogryName");
            return View();
        }

        //
        // POST: /CCategory/Create

        [HttpPost]
        public ActionResult Create(Cateogry cateogry)
        {
            if (ModelState.IsValid)
            {
                cateogry.CreatedOn = DateTime.Now;
                cateogry.CreatedBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.Cateogries.Add(cateogry);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Status = new SelectList(db.StatusConditions, "Id", "StatusName", cateogry.Status);
            ViewBag.ParentCateogry = new SelectList(db.Cateogries, "Id", "CateogryName", cateogry.ParentCateogry);
            return View(cateogry);
        }

        //
        // GET: /CCategory/Edit/5

        public ActionResult Edit(long id = 0)
        {
            Cateogry cateogry = db.Cateogries.Find(id);
            if (cateogry == null)
            {
                return HttpNotFound();
            }
            ViewBag.Status = new SelectList(db.StatusConditions, "Id", "StatusName", cateogry.Status);
            ViewBag.ParentCateogry = new SelectList(db.Cateogries, "Id", "CateogryName", cateogry.ParentCateogry);
            return View(cateogry);
        }

        //
        // POST: /CCategory/Edit/5

        [HttpPost]
        public ActionResult Edit(Cateogry cateogry)
        {
            if (ModelState.IsValid)
            {
                cateogry.UpdatedOn = DateTime.Now;
                cateogry.UpdateBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.Entry(cateogry).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Status = new SelectList(db.StatusConditions, "Id", "StatusName", cateogry.Status);
            ViewBag.ParentCateogry = new SelectList(db.Cateogries, "Id", "CateogryName", cateogry.ParentCateogry);
            return View(cateogry);
        }

        //
        // GET: /CCategory/Delete/5

        public ActionResult Delete(long id = 0)
        {
            Cateogry cateogry = db.Cateogries.Find(id);
            if (cateogry == null)
            {
                return HttpNotFound();
            }
            return View(cateogry);
        }

        //
        // POST: /CCategory/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            Cateogry cateogry = db.Cateogries.Find(id);
            db.Cateogries.Remove(cateogry);
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