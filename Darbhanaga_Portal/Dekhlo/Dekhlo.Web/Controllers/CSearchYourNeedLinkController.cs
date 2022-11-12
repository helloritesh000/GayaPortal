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
    public class CSearchYourNeedLinkController : Controller
    {
        private PORTALEntitiy db = new PORTALEntitiy();

        //
        // GET: /CSearchYourNeedLink/

        public ActionResult Index()
        {
            return View(db.SearchYourNeedLinks.ToList());
        }

        //
        // GET: /CSearchYourNeedLink/Details/5

        public ActionResult Details(long id = 0)
        {
            SearchYourNeedLink searchyourneedlink = db.SearchYourNeedLinks.Find(id);
            if (searchyourneedlink == null)
            {
                return HttpNotFound();
            }
            return View(searchyourneedlink);
        }

        //
        // GET: /CSearchYourNeedLink/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /CSearchYourNeedLink/Create

        [HttpPost]
        public ActionResult Create(SearchYourNeedLink searchyourneedlink)
        {
            if (ModelState.IsValid)
            {
                searchyourneedlink.CreatedOn = DateTime.Now;
                searchyourneedlink.CreatedBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.SearchYourNeedLinks.Add(searchyourneedlink);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(searchyourneedlink);
        }

        //
        // GET: /CSearchYourNeedLink/Edit/5

        public ActionResult Edit(long id = 0)
        {
            SearchYourNeedLink searchyourneedlink = db.SearchYourNeedLinks.Find(id);
            if (searchyourneedlink == null)
            {
                return HttpNotFound();
            }
            return View(searchyourneedlink);
        }

        //
        // POST: /CSearchYourNeedLink/Edit/5

        [HttpPost]
        public ActionResult Edit(SearchYourNeedLink searchyourneedlink)
        {
            if (ModelState.IsValid)
            {
                searchyourneedlink.UpdatedOn = DateTime.Now;
                searchyourneedlink.UpdateBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.Entry(searchyourneedlink).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(searchyourneedlink);
        }

        //
        // GET: /CSearchYourNeedLink/Delete/5

        public ActionResult Delete(long id = 0)
        {
            SearchYourNeedLink searchyourneedlink = db.SearchYourNeedLinks.Find(id);
            if (searchyourneedlink == null)
            {
                return HttpNotFound();
            }
            return View(searchyourneedlink);
        }

        //
        // POST: /CSearchYourNeedLink/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            SearchYourNeedLink searchyourneedlink = db.SearchYourNeedLinks.Find(id);
            db.SearchYourNeedLinks.Remove(searchyourneedlink);
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