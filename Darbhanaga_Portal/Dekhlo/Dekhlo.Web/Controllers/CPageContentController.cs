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
    public class CPageContentController : Controller
    {
        private PORTALEntitiy db = new PORTALEntitiy();

        //
        // GET: /CPageContent/

        public ActionResult Index()
        {
            return View(db.PageContents.ToList());
        }

        //
        // GET: /CPageContent/Details/5

        public ActionResult Details(int id = 0)
        {
            PageContent pagecontent = db.PageContents.Find(id);
            if (pagecontent == null)
            {
                return HttpNotFound();
            }
            return View(pagecontent);
        }

        //
        // GET: /CPageContent/Create

        public ActionResult Create()
        {
            ViewBag.PageType = new List<SelectListItem>() { 
                new SelectListItem{ Text="AboutUs", Value="AboutUs", Selected=false},
                new SelectListItem{ Text="SoftwareDevelopment", Value="SoftwareDevelopment", Selected=false},
                new SelectListItem{ Text="BookBusTicket", Value="BookBusTicket", Selected=false},
                new SelectListItem{ Text="BookHotel", Value="BookHotel", Selected=false},
                new SelectListItem{ Text="BookMovieTicket", Value="BookMovieTicket", Selected=false},
                new SelectListItem{ Text="ShareYourMemories", Value="ShareYourMemories", Selected=false},
                new SelectListItem{ Text="PopularSearches", Value="PopularSearches", Selected=false},
                new SelectListItem{ Text="ContactUs", Value="ContactUs", Selected=false},
                new SelectListItem{ Text="CancellationReturns", Value="CancellationReturns", Selected=false},
                new SelectListItem{ Text="FAQ", Value="FAQ", Selected=false},
                new SelectListItem{ Text="Payments", Value="Payments", Selected=false},
                new SelectListItem{ Text="FeatureAds", Value="FeatureAds", Selected=false},
                new SelectListItem{ Text="JoinDarbhanngaPortal", Value="JoinDarbhanngaPortal", Selected=false},
                new SelectListItem{ Text="TermsAndCondition", Value="TermsAndCondition", Selected=false},
                new SelectListItem{ Text="AdvertiseWithUs", Value="AdvertiseWithUs", Selected=false},
                new SelectListItem{ Text="ImportantLinks", Value="ImportantLinks", Selected=false},
                new SelectListItem{ Text="LocationWhereWeAre", Value="LocationWhereWeAre", Selected=false},
                new SelectListItem{ Text="AboutCity", Value="AboutCity", Selected=false},
                };
            return View();
        }

        //
        // POST: /CPageContent/Create
        
        [HttpPost]
        public ActionResult Create(PageContent pagecontent)
        {
            if (ModelState.IsValid)
            {
                ViewBag.PageType = new List<SelectListItem>() { 
                new SelectListItem{ Text="AboutUs", Value="AboutUs", Selected=false},
                new SelectListItem{ Text="SoftwareDevelopment", Value="SoftwareDevelopment", Selected=false},
                new SelectListItem{ Text="BookBusTicket", Value="BookBusTicket", Selected=false},
                new SelectListItem{ Text="BookHotel", Value="BookHotel", Selected=false},
                new SelectListItem{ Text="BookMovieTicket", Value="BookMovieTicket", Selected=false},
                new SelectListItem{ Text="ShareYourMemories", Value="ShareYourMemories", Selected=false},
                new SelectListItem{ Text="PopularSearches", Value="PopularSearches", Selected=false},
                new SelectListItem{ Text="ContactUs", Value="ContactUs", Selected=false},
                new SelectListItem{ Text="CancellationReturns", Value="CancellationReturns", Selected=false},
                new SelectListItem{ Text="FAQ", Value="FAQ", Selected=false},
                new SelectListItem{ Text="Payments", Value="Payments", Selected=false},
                new SelectListItem{ Text="FeatureAds", Value="FeatureAds", Selected=false},
                new SelectListItem{ Text="JoinDarbhanngaPortal", Value="JoinDarbhanngaPortal", Selected=false},
                new SelectListItem{ Text="TermsAndCondition", Value="TermsAndCondition", Selected=false},
                new SelectListItem{ Text="AdvertiseWithUs", Value="AdvertiseWithUs", Selected=false},
                new SelectListItem{ Text="ImportantLinks", Value="ImportantLinks", Selected=false},
                new SelectListItem{ Text="LocationWhereWeAre", Value="LocationWhereWeAre", Selected=false},
                new SelectListItem{ Text="AboutCity", Value="AboutCity", Selected=false},
                };
                pagecontent.CreatedOn = DateTime.Now;
                pagecontent.CreatedBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.PageContents.Add(pagecontent);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(pagecontent);
        }

        //
        // GET: /CPageContent/Edit/5

        public ActionResult Edit(int id = 0)
        {
            PageContent pagecontent = db.PageContents.Find(id);
            ViewBag.PageType = new List<SelectListItem>() { 
                new SelectListItem{ Text="AboutUs", Value="AboutUs", Selected=false},
                new SelectListItem{ Text="SoftwareDevelopment", Value="SoftwareDevelopment", Selected=false},
                new SelectListItem{ Text="BookBusTicket", Value="BookBusTicket", Selected=false},
                new SelectListItem{ Text="BookHotel", Value="BookHotel", Selected=false},
                new SelectListItem{ Text="BookMovieTicket", Value="BookMovieTicket", Selected=false},
                new SelectListItem{ Text="ShareYourMemories", Value="ShareYourMemories", Selected=false},
                new SelectListItem{ Text="PopularSearches", Value="PopularSearches", Selected=false},
                new SelectListItem{ Text="ContactUs", Value="ContactUs", Selected=false},
                new SelectListItem{ Text="CancellationReturns", Value="CancellationReturns", Selected=false},
                new SelectListItem{ Text="FAQ", Value="FAQ", Selected=false},
                new SelectListItem{ Text="Payments", Value="Payments", Selected=false},
                new SelectListItem{ Text="FeatureAds", Value="FeatureAds", Selected=false},
                new SelectListItem{ Text="JoinDarbhanngaPortal", Value="JoinDarbhanngaPortal", Selected=false},
                new SelectListItem{ Text="TermsAndCondition", Value="TermsAndCondition", Selected=false},
                new SelectListItem{ Text="AdvertiseWithUs", Value="AdvertiseWithUs", Selected=false},
                new SelectListItem{ Text="ImportantLinks", Value="ImportantLinks", Selected=false},
                new SelectListItem{ Text="LocationWhereWeAre", Value="LocationWhereWeAre", Selected=false},
                new SelectListItem{ Text="AboutCity", Value="AboutCity", Selected=false},
                };
            if (pagecontent == null)
            {
                return HttpNotFound();
            }
            return View(pagecontent);
        }

        //
        // POST: /CPageContent/Edit/5
        
        [HttpPost]
        public ActionResult Edit(PageContent pagecontent)
        {
            ViewBag.PageType = new List<SelectListItem>() { 
                new SelectListItem{ Text="AboutUs", Value="AboutUs", Selected=false},
                new SelectListItem{ Text="SoftwareDevelopment", Value="SoftwareDevelopment", Selected=false},
                new SelectListItem{ Text="BookBusTicket", Value="BookBusTicket", Selected=false},
                new SelectListItem{ Text="BookHotel", Value="BookHotel", Selected=false},
                new SelectListItem{ Text="BookMovieTicket", Value="BookMovieTicket", Selected=false},
                new SelectListItem{ Text="ShareYourMemories", Value="ShareYourMemories", Selected=false},
                new SelectListItem{ Text="PopularSearches", Value="PopularSearches", Selected=false},
                new SelectListItem{ Text="ContactUs", Value="ContactUs", Selected=false},
                new SelectListItem{ Text="CancellationReturns", Value="CancellationReturns", Selected=false},
                new SelectListItem{ Text="FAQ", Value="FAQ", Selected=false},
                new SelectListItem{ Text="Payments", Value="Payments", Selected=false},
                new SelectListItem{ Text="FeatureAds", Value="FeatureAds", Selected=false},
                new SelectListItem{ Text="JoinDarbhanngaPortal", Value="JoinDarbhanngaPortal", Selected=false},
                new SelectListItem{ Text="TermsAndCondition", Value="TermsAndCondition", Selected=false},
                new SelectListItem{ Text="AdvertiseWithUs", Value="AdvertiseWithUs", Selected=false},
                new SelectListItem{ Text="ImportantLinks", Value="ImportantLinks", Selected=false},
                new SelectListItem{ Text="LocationWhereWeAre", Value="LocationWhereWeAre", Selected=false},
                new SelectListItem{ Text="AboutCity", Value="AboutCity", Selected=false},
                };
            if (ModelState.IsValid)
            {
                pagecontent.UpdatedOn = DateTime.Now;
                pagecontent.UpdateBy = Convert.ToInt64(Session["LoggedInUserId"]);
                db.Entry(pagecontent).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(pagecontent);
        }

        //
        // GET: /CPageContent/Delete/5

        public ActionResult Delete(int id = 0)
        {
            PageContent pagecontent = db.PageContents.Find(id);
            if (pagecontent == null)
            {
                return HttpNotFound();
            }
            return View(pagecontent);
        }

        //
        // POST: /CPageContent/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            PageContent pagecontent = db.PageContents.Find(id);
            db.PageContents.Remove(pagecontent);
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