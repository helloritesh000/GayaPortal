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
    public class CUserRegistrationController : Controller
    {
        private PORTALEntitiy db = new PORTALEntitiy();

        //
        // GET: /CUserRegistration/

        public ActionResult Index()
        {
            var userregistrations = db.UserRegistrations.Include(u => u.StatusCondition);
            return View(userregistrations.ToList());
        }

        //
        // GET: /CUserRegistration/Details/5

        public ActionResult Details(long id = 0)
        {
            UserRegistration userregistration = db.UserRegistrations.Find(id);
            if (userregistration == null)
            {
                return HttpNotFound();
            }
            return View(userregistration);
        }

        //
        // GET: /CUserRegistration/Create

        public ActionResult Create()
        {
            ViewBag.Status = new SelectList(db.StatusConditions, "Id", "StatusName");
            return View();
        }

        //
        // POST: /CUserRegistration/Create

        [HttpPost]
        public ActionResult Create(UserRegistration userregistration)
        {
            if (ModelState.IsValid)
            {
                userregistration.CreatedOn = DateTime.Now;
                userregistration.CreatedBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.UserRegistrations.Add(userregistration);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Status = new SelectList(db.StatusConditions, "Id", "StatusName", userregistration.Status);
            return View(userregistration);
        }

        //
        // GET: /CUserRegistration/Edit/5

        public ActionResult Edit(long id = 0)
        {
            UserRegistration userregistration = db.UserRegistrations.Find(id);
            if (userregistration == null)
            {
                return HttpNotFound();
            }
            ViewBag.Status = new SelectList(db.StatusConditions, "Id", "StatusName", userregistration.Status);
            return View(userregistration);
        }

        //
        // POST: /CUserRegistration/Edit/5

        [HttpPost]
        public ActionResult Edit(UserRegistration userregistration)
        {
            if (ModelState.IsValid)
            {
                userregistration.UpdatedOn = DateTime.Now;
                userregistration.UpdateBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.Entry(userregistration).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Status = new SelectList(db.StatusConditions, "Id", "StatusName", userregistration.Status);
            return View(userregistration);
        }

        //
        // GET: /CUserRegistration/Delete/5

        public ActionResult Delete(long id = 0)
        {
            UserRegistration userregistration = db.UserRegistrations.Find(id);
            if (userregistration == null)
            {
                return HttpNotFound();
            }
            return View(userregistration);
        }

        //
        // POST: /CUserRegistration/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            UserRegistration userregistration = db.UserRegistrations.Find(id);
            db.UserRegistrations.Remove(userregistration);
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