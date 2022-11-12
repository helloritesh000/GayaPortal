using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dekhlo.Web.Models;
using System.Configuration;
using System.IO;

namespace Dekhlo.Web.Controllers
{
    [HandleErrorCustom(View="ErrorAdmin")]
    public class CPostCategoryController : Controller
    {
        private PORTALEntitiy db = new PORTALEntitiy();

        //
        // GET: /CPostCategory/

        public ActionResult Index()
        {
            var postcateogrymappings = db.PostCateogryMappings.Include(p => p.Cateogry).Include(p => p.Post);
            return View(postcateogrymappings.ToList());
        }

        //
        // GET: /CPostCategory/Details/5

        public ActionResult Details(long id = 0)
        {
            PostCateogryMapping postcateogrymapping = db.PostCateogryMappings.Find(id);
            if (postcateogrymapping == null)
            {
                return HttpNotFound();
            }
            return View(postcateogrymapping);
        }

        //
        // GET: /CPostCategory/Create

        public ActionResult Create()
        {
            ViewBag.CateogryId = new SelectList(db.Cateogries, "Id", "CateogryName");
            ViewBag.PostId = new SelectList(db.Posts, "Id", "PostTitle");
            return View();
        }

        //
        // POST: /CPostCategory/Create

        [HttpPost]
        public ActionResult Create(PostCateogryMapping postcateogrymapping)
        {
            if (ModelState.IsValid)
            {
                postcateogrymapping.CreatedOn = DateTime.Now;
                postcateogrymapping.CreatedBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.PostCateogryMappings.Add(postcateogrymapping);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CateogryId = new SelectList(db.Cateogries, "Id", "CateogryName", postcateogrymapping.CateogryId);
            ViewBag.PostId = new SelectList(db.Posts, "Id", "PostTitle", postcateogrymapping.PostId);
            return View(postcateogrymapping);
        }

        //
        // GET: /CPostCategory/Edit/5

        public ActionResult Edit(long id = 0)
        {
            PostCateogryMapping postcateogrymapping = db.PostCateogryMappings.Find(id);
            if (postcateogrymapping == null)
            {
                return HttpNotFound();
            }
            ViewBag.CateogryId = new SelectList(db.Cateogries, "Id", "CateogryName", postcateogrymapping.CateogryId);
            ViewBag.PostId = new SelectList(db.Posts, "Id", "PostTitle", postcateogrymapping.PostId);
            return View(postcateogrymapping);
        }

        //
        // POST: /CPostCategory/Edit/5

        [HttpPost]
        public ActionResult Edit(PostCateogryMapping postcateogrymapping)
        {
            if (ModelState.IsValid)
            {
                postcateogrymapping.UpdatedOn = DateTime.Now;
                postcateogrymapping.UpdateBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.Entry(postcateogrymapping).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CateogryId = new SelectList(db.Cateogries, "Id", "CateogryName", postcateogrymapping.CateogryId);
            ViewBag.PostId = new SelectList(db.Posts, "Id", "PostTitle", postcateogrymapping.PostId);
            return View(postcateogrymapping);
        }

        //
        // GET: /CPostCategory/Delete/5

        public ActionResult Delete(long id = 0)
        {
            PostCateogryMapping postcateogrymapping = db.PostCateogryMappings.Find(id);
            if (postcateogrymapping == null)
            {
                return HttpNotFound();
            }
            return View(postcateogrymapping);
        }

        //
        // POST: /CPostCategory/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            PostCateogryMapping postcateogrymapping = db.PostCateogryMappings.Find(id);
            db.PostCateogryMappings.Remove(postcateogrymapping);
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