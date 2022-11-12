using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Dekhlo.Web.Models
{
    public class CUserInRoleController : Controller
    {
        private PORTALEntitiy db = new PORTALEntitiy();
        private UsersContext dbUserContext = new UsersContext();

        //
        // GET: /CUserInRole/

        public ActionResult Index()
        {
            var webpages_usersinroles = db.webpages_UsersInRoles.Include(w => w.webpages_Roles);
            return View(webpages_usersinroles.ToList());
        }

        //
        // GET: /CUserInRole/Details/5

        public ActionResult Details(int id = 0)
        {
            webpages_UsersInRoles webpages_usersinroles = db.webpages_UsersInRoles.Find(id);
            if (webpages_usersinroles == null)
            {
                return HttpNotFound();
            }
            return View(webpages_usersinroles);
        }

        //
        // GET: /CUserInRole/Create

        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(dbUserContext.Logons, "UserId", "UserName");
            ViewBag.RoleId = new SelectList(db.webpages_Roles, "RoleId", "RoleName");
            return View();
        }

        //
        // POST: /CUserInRole/Create

        [HttpPost]
        public ActionResult Create(webpages_UsersInRoles webpages_usersinroles)
        {
            if (ModelState.IsValid)
            {
                db.webpages_UsersInRoles.Add(webpages_usersinroles);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserId = new SelectList(dbUserContext.Logons, "UserId", "UserName", webpages_usersinroles.UserId);
            ViewBag.RoleId = new SelectList(db.webpages_Roles, "RoleId", "RoleName", webpages_usersinroles.RoleId);
            return View(webpages_usersinroles);
        }

        //
        // GET: /CUserInRole/Edit/5

        public ActionResult Edit(int id = 0)
        {
            webpages_UsersInRoles webpages_usersinroles = db.webpages_UsersInRoles.Find(id);
            if (webpages_usersinroles == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserId = new SelectList(dbUserContext.Logons, "UserId", "UserName", webpages_usersinroles.UserId);
            ViewBag.RoleId = new SelectList(db.webpages_Roles, "RoleId", "RoleName", webpages_usersinroles.RoleId);
            return View(webpages_usersinroles);
        }

        //
        // POST: /CUserInRole/Edit/5

        [HttpPost]
        public ActionResult Edit(webpages_UsersInRoles webpages_usersinroles)
        {
            if (ModelState.IsValid)
            {
                db.Entry(webpages_usersinroles).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserId = new SelectList(dbUserContext.Logons, "UserId", "UserName", webpages_usersinroles.UserId);
            ViewBag.RoleId = new SelectList(db.webpages_Roles, "RoleId", "RoleName", webpages_usersinroles.RoleId);
            return View(webpages_usersinroles);
        }

        //
        // GET: /CUserInRole/Delete/5

        public ActionResult Delete(int id = 0)
        {
            webpages_UsersInRoles webpages_usersinroles = db.webpages_UsersInRoles.Find(id);
            if (webpages_usersinroles == null)
            {
                return HttpNotFound();
            }
            return View(webpages_usersinroles);
        }

        //
        // POST: /CUserInRole/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            webpages_UsersInRoles webpages_usersinroles = db.webpages_UsersInRoles.Find(id);
            db.webpages_UsersInRoles.Remove(webpages_usersinroles);
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