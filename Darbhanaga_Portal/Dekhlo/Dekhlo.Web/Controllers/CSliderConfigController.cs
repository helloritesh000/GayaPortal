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
using System.Data.Entity.Infrastructure;

namespace Dekhlo.Web.Controllers
{
    [HandleErrorCustom(View="ErrorAdmin")]
    public class CSliderConfigController : Controller
    {
        private PORTALEntitiy db = new PORTALEntitiy();

        //
        // GET: /CSliderConfig/

        public ActionResult Index()
        {
            return View(db.SliderConfigs.ToList());
        }

        //
        // GET: /CSliderConfig/Details/5

        public ActionResult Details(long id = 0)
        {
            SliderConfig sliderconfig = db.SliderConfigs.Find(id);
            if (sliderconfig == null)
            {
                return HttpNotFound();
            }
            return View(sliderconfig);
        }

        //
        // GET: /CSliderConfig/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /CSliderConfig/Create

        [HttpPost]
        public ActionResult Create(SliderConfig sliderconfig)
        {
            if (ModelState.IsValid)
            {
                HttpPostedFileBase httpPostedFileBase = Request.Files["fldImageUrl"];
                if (httpPostedFileBase != null && httpPostedFileBase.ContentLength > 0)
                {
                    string UploadRootPath = ConfigurationManager.AppSettings["UploadRootPath"];
                    string folderPath = UploadRootPath + "SliderImages";

                    string fileName = folderPath + "/"
                        + Path.GetFileNameWithoutExtension(httpPostedFileBase.FileName)
                        + "_" + Path.GetRandomFileName().Replace(".", "")
                        + "_" + DateTime.Now.Ticks.ToString().Replace(".", "")
                        + Path.GetExtension(httpPostedFileBase.FileName);
                    if (!Directory.Exists(Server.MapPath(folderPath)))
                        Directory.CreateDirectory(Server.MapPath(folderPath));
                    httpPostedFileBase.SaveAs(Server.MapPath(fileName));
                    //sliderconfig.CreatedOn = DateTime.Now;
                    //sliderconfig.CreatedBy = Convert.ToInt64(Session["LoggedInUserId"]);
                    sliderconfig.ImageUrl = fileName;
                    db.SliderConfigs.Add(sliderconfig);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }

            return View(sliderconfig);
        }

        //
        // GET: /CSliderConfig/Edit/5

        public ActionResult Edit(long id = 0)
        {
            SliderConfig sliderconfig = db.SliderConfigs.Find(id);
            if (sliderconfig == null)
            {
                return HttpNotFound();
            }
            return View(sliderconfig);
        }

        //
        // POST: /CSliderConfig/Edit/5

        [HttpPost]
        public ActionResult Edit(SliderConfig sliderconfig)
        {
            if (ModelState.IsValid)
            {
                HttpPostedFileBase httpPostedFileBase = Request.Files["fldImageUrl"];
                string fileName = string.Empty;
                if (httpPostedFileBase != null && httpPostedFileBase.ContentLength > 0)
                {
                    string UploadRootPath = ConfigurationManager.AppSettings["UploadRootPath"];
                    string folderPath = UploadRootPath + "SliderImages";

                    fileName = folderPath + "/"
                        + Path.GetFileNameWithoutExtension(httpPostedFileBase.FileName)
                        + "_" + Path.GetRandomFileName().Replace(".", "")
                        + "_" + DateTime.Now.Ticks.ToString().Replace(".", "")
                        + Path.GetExtension(httpPostedFileBase.FileName);
                    if (!Directory.Exists(Server.MapPath(folderPath)))
                        Directory.CreateDirectory(Server.MapPath(folderPath));
                    httpPostedFileBase.SaveAs(Server.MapPath(fileName));
                    //sliderconfig.CreatedOn = DateTime.Now;
                    //sliderconfig.CreatedBy = Convert.ToInt64(Session["LoggedInUserId"]);
                    sliderconfig.ImageUrl = fileName;
                }

                SliderConfig sliderConfigDb = db.SliderConfigs.Find(sliderconfig.Id);
                ((IObjectContextAdapter)db).ObjectContext.Detach(sliderConfigDb);

                db.Entry(sliderconfig).State = EntityState.Modified;
                db.SaveChanges();

                if (sliderConfigDb != null && !String.IsNullOrEmpty(fileName))
                {
                    if(!String.IsNullOrEmpty(sliderConfigDb.ImageUrl) && System.IO.File.Exists(Server.MapPath(sliderConfigDb.ImageUrl)))
                    {
                        System.IO.File.Delete(Server.MapPath(sliderConfigDb.ImageUrl));
                    }
                }

                return RedirectToAction("Index");
            }
            return View(sliderconfig);
        }

        //
        // GET: /CSliderConfig/Delete/5

        public ActionResult Delete(long id = 0)
        {
            SliderConfig sliderconfig = db.SliderConfigs.Find(id);
            if (sliderconfig == null)
            {
                return HttpNotFound();
            }
            return View(sliderconfig);
        }

        //
        // POST: /CSliderConfig/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            SliderConfig sliderconfig = db.SliderConfigs.Find(id);
            db.SliderConfigs.Remove(sliderconfig);
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