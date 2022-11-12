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
    public class CStatusConditionController : Controller
    {
        private PORTALEntitiy db = new PORTALEntitiy();

        //
        // GET: /CStatusCondition/

        public ActionResult Index()
        {
            return View(db.StatusConditions.ToList());
        }

        //
        // GET: /CStatusCondition/Details/5

        public ActionResult Details(int id = 0)
        {
            StatusCondition statuscondition = db.StatusConditions.Find(id);
            if (statuscondition == null)
            {
                return HttpNotFound();
            }
            return View(statuscondition);
        }

        //
        // GET: /CStatusCondition/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /CStatusCondition/Create

        [HttpPost]
        public ActionResult Create(StatusCondition statuscondition)
        {
            if (ModelState.IsValid)
            {
                //statuscondition.CreatedOn = DateTime.Now;
                //statuscondition.CreatedBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.StatusConditions.Add(statuscondition);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(statuscondition);
        }

        //
        // GET: /CStatusCondition/Edit/5

        public ActionResult Edit(int id = 0)
        {
            StatusCondition statuscondition = db.StatusConditions.Find(id);
            if (statuscondition == null)
            {
                return HttpNotFound();
            }
            return View(statuscondition);
        }

        //
        // POST: /CStatusCondition/Edit/5

        [HttpPost]
        public ActionResult Edit(StatusCondition statuscondition)
        {
            if (ModelState.IsValid)
            {
                db.Entry(statuscondition).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(statuscondition);
        }

        //
        // GET: /CStatusCondition/Delete/5

        public ActionResult Delete(int id = 0)
        {
            StatusCondition statuscondition = db.StatusConditions.Find(id);
            if (statuscondition == null)
            {
                return HttpNotFound();
            }
            return View(statuscondition);
        }

        //
        // POST: /CStatusCondition/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            StatusCondition statuscondition = db.StatusConditions.Find(id);
            db.StatusConditions.Remove(statuscondition);
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