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
    public class CPostImageConfigController : Controller
    {
        private PORTALEntitiy db = new PORTALEntitiy();

        //
        // GET: /CPostImageConfig/

        public ActionResult Index()
        {
            var postimages = db.PostImages.Include(p => p.Post);
            return View(postimages.ToList());
        }

        //
        // GET: /CPostImageConfig/Details/5

        public ActionResult Details(long id = 0)
        {
            PostImage postimage = db.PostImages.Find(id);
            if (postimage == null)
            {
                return HttpNotFound();
            }
            return View(postimage);
        }

        //
        // GET: /CPostImageConfig/Create

        public ActionResult Create()
        {
            ViewBag.PostId = new SelectList(db.Posts, "Id", "PostTitle");
            return View();
        }

        //
        // POST: /CPostImageConfig/Create

        [HttpPost]
        public ActionResult Create(PostImage postimage)
        {
            if (ModelState.IsValid)
            {
                //postimage.CreatedOn = DateTime.Now;
                //postimage.CreatedBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.PostImages.Add(postimage);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PostId = new SelectList(db.Posts, "Id", "PostTitle", postimage.PostId);
            return View(postimage);
        }

        //
        // GET: /CPostImageConfig/Edit/5

        public ActionResult Edit(long id = 0)
        {
            PostImage postimage = db.PostImages.Find(id);
            if (postimage == null)
            {
                return HttpNotFound();
            }
            ViewBag.PostId = new SelectList(db.Posts, "Id", "PostTitle", postimage.PostId);
            return View(postimage);
        }

        //
        // POST: /CPostImageConfig/Edit/5

        [HttpPost]
        public ActionResult Edit(PostImage postimage)
        {
            if (ModelState.IsValid)
            {
                db.Entry(postimage).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PostId = new SelectList(db.Posts, "Id", "PostTitle", postimage.PostId);
            return View(postimage);
        }

        //
        // GET: /CPostImageConfig/Delete/5

        public ActionResult Delete(long id = 0)
        {
            PostImage postimage = db.PostImages.Find(id);
            if (postimage == null)
            {
                return HttpNotFound();
            }
            return View(postimage);
        }

        //
        // POST: /CPostImageConfig/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            PostImage postimage = db.PostImages.Find(id);
            db.PostImages.Remove(postimage);
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