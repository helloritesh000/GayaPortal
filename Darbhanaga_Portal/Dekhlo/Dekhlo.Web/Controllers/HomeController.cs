using Dekhlo.Web.Models;
using Dekhlo.Web.Seo;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Text;
using System.Net.Mime;
using WebMatrix.WebData;

namespace Dekhlo.Web.Controllers
{
    [HandleErrorCustom(View="Error")]
    public class HomeController : Controller
    {
        PORTALEntitiy db = new PORTALEntitiy();

        [AllowAnonymous]
        public ActionResult Index()
        {
            Random r = new Random();
            List<Post> postsTemp = db.Posts.Include("PostImages").Include("UserRegistration").Include("StatusCondition")
                .Where(m => m.StatusCondition.StatusName == StatusEnum.Published
                && m.PostType == PostTypeEnum.Paid)
                .ToList().Shuffle<Post>(new Random(1)).ToList();
            List<Post> posts = postsTemp
             .OrderBy(h => r.Next()).Take(9).ToList();

            return View(posts);
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult GetRandomPost(List<long> idsPresent)
        {
            Random r = new Random();
            List<Post> postsTemp = db.Posts.Where(m => m.StatusCondition.StatusName == StatusEnum.Published
                && m.PostType == PostTypeEnum.Paid)
                .ToList().Shuffle<Post>(new Random(1)).ToList();

            Post post = postsTemp
                .Where(m => !idsPresent.Contains(m.Id))
             .OrderBy(h => r.Next()).Take(1).FirstOrDefault();

            return PartialView("_Index", post);
        }

        [AllowAnonymous]
        public ActionResult AboutUs()
        {
            return View(db.PageContents.Where(m => m.PageType == "AboutUs").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult AboutCity()
        {
            return View(db.PageContents.Where(m => m.PageType == "AboutCity").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult SoftwareDevelopment()
        {
            return View(db.PageContents.Where(m => m.PageType == "SoftwareDevelopment").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult BookBusTicket()
        {
            return View(db.PageContents.Where(m => m.PageType == "BookBusTicket").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult BookHotel()
        {
            return View(db.PageContents.Where(m => m.PageType == "BookHotel").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult BookMovieTicket()
        {
            return View(db.PageContents.Where(m => m.PageType == "BookMovieTicket").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult ShareYourMemories()
        {
            return View();
        }

        public ActionResult ShareYourMemoriesSingle(long ? id)
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult ShareYourMemories(ModelProperty mp, FormCollection formCollection)
        {
            if (ModelState.IsValid)
            {
                HttpFileCollectionBase files = Request.Files;
                List<string> filePaths = null;
                if (files != null && files.Count > 0)
                {
                    filePaths = new List<string>();
                    string UploadRootPath = ConfigurationManager.AppSettings["UploadRootPath"];
                    foreach (string item in files)
                    {
                        HttpPostedFileBase httpPostedFileBase = Request.Files[item];
                        if (httpPostedFileBase != null && httpPostedFileBase.ContentLength > 0)
                        {
                            string folderPath = UploadRootPath + "ShareYourMemory";

                            string fileName = folderPath + "/"
                                + Path.GetFileNameWithoutExtension(httpPostedFileBase.FileName)
                                + "_" + Path.GetRandomFileName().Replace(".", "")
                                + "_" + DateTime.Now.Ticks.ToString().Replace(".", "")
                                + Path.GetExtension(httpPostedFileBase.FileName);
                            if (!Directory.Exists(Server.MapPath(folderPath)))
                                Directory.CreateDirectory(Server.MapPath(folderPath));
                            httpPostedFileBase.SaveAs(Server.MapPath(fileName));
                            filePaths.Add(fileName);
                        }
                    }
                }

                UserRegistration userRegistration = mp.ObjUserRegistration;
                UserRegistration userRegistrationUi = mp.ObjUserRegistration;
                Memory memory = mp.ObjMemory;
                List<MemoryPicture> memoryPicture = new List<MemoryPicture>();
                memoryPicture.AddRange(filePaths.Select(m => new MemoryPicture { ImageUrl = m, MemoryId = 0 }));


                using (UsersContext dbUserContext = new UsersContext())
                {
                    userRegistration.CreatedOn = DateTime.Now;
                    userRegistration.IsVisitor = true;
                    userRegistration.Status = 1;
                    userRegistration.CreatedBy = 1;
                    userRegistration.UserName = userRegistration.MobileNo;

                    Logon user = dbUserContext.Logons.FirstOrDefault(u => u.UserName.ToLower() == userRegistration.UserName.ToLower());
                    if (user == null)
                    {
                        dbUserContext.Logons.Add(new Logon { UserName = userRegistration.UserName });
                        dbUserContext.SaveChanges();

                        db.UserRegistrations.Add(userRegistration);
                        db.SaveChanges();

                        WebSecurity.CreateUserAndAccount(userRegistration.MobileNo, GetRandomPassword());
                    }
                    else
                    {
                        userRegistration = db.UserRegistrations.FirstOrDefault(u => u.UserName.ToLower() == userRegistration.UserName.ToLower());
                    }
                }

                memory.UserId = userRegistration.Id;
                memory.EmailId = userRegistrationUi.EmailId;
                memory.FirstName = userRegistrationUi.FirstName;
                memory.LastName = userRegistrationUi.LastName;
                memory.MobileNo = userRegistrationUi.MobileNo;
                memory.ProfilePic = userRegistration.ProfilePic;
                memory.CreatedBy = userRegistration.Id;
                memory.CreatedOn = DateTime.Now;

                db.Memories.Add(memory);
                db.SaveChanges();

                foreach (MemoryPicture item in memoryPicture)
                {
                    item.MemoryId = memory.Id;
                    db.MemoryPictures.Add(item);
                }
                db.SaveChanges();
            }
            return View();
        }

        private string GetRandomPassword()
        {
            return System.IO.Path.GetRandomFileName().Replace(".","");
        }
        public ActionResult ShareYourMemoryEdit(long? id)
        {
            ModelProperty mp = new ModelProperty();
            if (id > 0)
            {
                mp.ObjMemory = db.Memories.Include("MemoryPictures").FirstOrDefault(m => m.Id == id);
                mp.ObjUserRegistration = db.UserRegistrations.Find(mp.ObjMemory.UserId);
                return View(mp);
            }

            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult ShareYourMemoryEdit(ModelProperty mp, FormCollection collection)
        {
            if (ModelState.IsValid)
            {
                HttpFileCollectionBase files = Request.Files;
                List<string> filePaths = null;
                if (files != null && files.Count > 0)
                {
                    filePaths = new List<string>();
                    string UploadRootPath = ConfigurationManager.AppSettings["UploadRootPath"];
                    foreach (string item in files)
                    {
                        HttpPostedFileBase httpPostedFileBase = Request.Files[item];
                        if (httpPostedFileBase != null && httpPostedFileBase.ContentLength > 0)
                        {
                            string folderPath = UploadRootPath + "ShareYourMemory";

                            string fileName = folderPath + "/"
                                + Path.GetFileNameWithoutExtension(httpPostedFileBase.FileName)
                                + "_" + Path.GetRandomFileName().Replace(".", "")
                                + "_" + DateTime.Now.Ticks.ToString().Replace(".", "")
                                + Path.GetExtension(httpPostedFileBase.FileName);
                            if (!Directory.Exists(Server.MapPath(folderPath)))
                                Directory.CreateDirectory(Server.MapPath(folderPath));
                            httpPostedFileBase.SaveAs(Server.MapPath(fileName));
                            filePaths.Add(fileName);
                        }
                    }
                }

                UserRegistration userRegistration = mp.ObjUserRegistration;
                UserRegistration userRegistrationUi = mp.ObjUserRegistration;
                Memory memory = mp.ObjMemory;
                List<MemoryPicture> postImages = new List<MemoryPicture>();
                postImages.AddRange(filePaths.Select(m => new MemoryPicture { ImageUrl = m, MemoryId = 0 }));


                using (UsersContext dbUserContext = new UsersContext())
                {
                    userRegistrationUi.UserName = userRegistrationUi.MobileNo;
                    if (userRegistration.Id > 0)
                        userRegistration = db.UserRegistrations.Find(userRegistration.Id);

                    //userRegistration.CreatedOn = DateTime.Now;
                    userRegistration.FirstName = userRegistrationUi.FirstName;
                    userRegistration.LastName = userRegistrationUi.LastName;
                    userRegistration.Address = userRegistrationUi.Address;
                    userRegistration.PinCode = userRegistrationUi.PinCode;
                    userRegistration.IsVisitor = true;
                    userRegistration.Status = 1;
                    userRegistration.UserName = userRegistrationUi.MobileNo;
                    //userRegistration.CreatedBy = 1;
                    userRegistration.UserName = userRegistrationUi.MobileNo;
                    userRegistration.ProfilePic = userRegistrationUi.ProfilePic;

                    Logon user = dbUserContext.Logons.FirstOrDefault(u => u.UserName.ToLower() == userRegistrationUi.UserName.ToLower());
                    if (user == null)
                    {
                        user = dbUserContext.Logons.FirstOrDefault(m => m.UserName == userRegistration.UserName);
                        user.UserName = userRegistrationUi.UserName;
                        dbUserContext.Entry(user).State = EntityState.Modified;
                        dbUserContext.SaveChanges();

                        db.Entry(userRegistration).State = EntityState.Modified;
                        db.SaveChanges();
                    }
                    else
                    {

                        db.Entry(userRegistration).State = EntityState.Modified;
                        db.SaveChanges();
                    }
                }


                if (mp.ObjMemory.Id > 0)
                    memory = db.Memories.Find(mp.ObjMemory.Id);
                //memory.UserId = userRegistration.Id;
                memory.EmailId = userRegistrationUi.EmailId;
                memory.FirstName = userRegistrationUi.FirstName;
                memory.LastName = userRegistrationUi.LastName;
                memory.MobileNo = userRegistrationUi.MobileNo;
                memory.ProfilePic = userRegistration.ProfilePic;
                memory.Description = mp.ObjMemory.Description;
                memory.Title = mp.ObjMemory.Title;

                //memory.CreatedBy = userRegistration.Id;
                //memory.CreatedOn = DateTime.Now;


                db.Entry(memory).State = EntityState.Modified;
                db.SaveChanges();

                foreach (MemoryPicture item in postImages)
                {
                    item.MemoryId = memory.Id;
                    db.MemoryPictures.Add(item);
                }
                db.SaveChanges();

                if (memory.Id > 0)
                {
                    List<long> fileIds = new List<long>();
                    foreach (MemoryPicture item in postImages)
                    {
                        fileIds.Add(item.Id);
                    }
                    if (collection["hdnUploadPhotos1"] != null && !String.IsNullOrEmpty(collection["hdnUploadPhotos1"]))
                        fileIds.Add(Convert.ToInt64(collection["hdnUploadPhotos1"]));
                    if (collection["hdnUploadPhotos2"] != null && !String.IsNullOrEmpty(collection["hdnUploadPhotos2"]))
                        fileIds.Add(Convert.ToInt64(collection["hdnUploadPhotos2"]));
                    if (collection["hdnUploadPhotos3"] != null && !String.IsNullOrEmpty(collection["hdnUploadPhotos3"]))
                        fileIds.Add(Convert.ToInt64(collection["hdnUploadPhotos3"]));
                    if (collection["hdnUploadPhotos4"] != null && !String.IsNullOrEmpty(collection["hdnUploadPhotos4"]))
                        fileIds.Add(Convert.ToInt64(collection["hdnUploadPhotos4"]));
                    if (collection["hdnUploadPhotos5"] != null && !String.IsNullOrEmpty(collection["hdnUploadPhotos5"]))
                        fileIds.Add(Convert.ToInt64(collection["hdnUploadPhotos5"]));
                    if (collection["hdnUploadPhotos6"] != null && !String.IsNullOrEmpty(collection["hdnUploadPhotos6"]))
                        fileIds.Add(Convert.ToInt64(collection["hdnUploadPhotos6"]));

                    List<MemoryPicture> removePostImage = db.MemoryPictures.Where(m => m != null && m.MemoryId == memory.Id && !fileIds.Contains(m.Id)).Select(m => m).ToList();
                    if (removePostImage != null && removePostImage.Count > 0)
                        foreach (MemoryPicture item in removePostImage)
                        {
                            db.MemoryPictures.Remove(item);
                            db.SaveChanges();
                            if (!String.IsNullOrEmpty(item.ImageUrl) && System.IO.File.Exists(Server.MapPath(item.ImageUrl)))
                                System.IO.File.Delete(Server.MapPath(item.ImageUrl));
                        }
                    return RedirectToAction("ShareYourMemoriesSingle", new { id = memory.Id, title=memory.Title });
                }
            }
            return View(mp);
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult DeleteShareYourMemory(long id)
        {
            if (id > 0)
            {
                Memory memory = db.Memories.Find(id);
                if (memory != null)
                {
                    db.Memories.Remove(memory);
                    db.SaveChanges();
                    return RedirectToAction("ShareYourMemories");
                }

            }
            return RedirectToAction("ShareYourMemories");
        }

        [AllowAnonymous]
        public ActionResult SearchYourNeeds(string type)
        {
            if (String.IsNullOrEmpty(type))
                return HttpNotFound();
            ModelProperty mp = new ModelProperty();
            SearchYourNeedLink searchYourNeedLink = db.SearchYourNeedLinks.FirstOrDefault(m => m.LinkType == type);
            mp.ObjSearchYourNeedLink = searchYourNeedLink;
            mp.ObjSearchYourNeed = new SearchYourNeed();
            return View(mp);
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult SearchYourNeeds(ModelProperty mp, string type)
        {
            if (ModelState.IsValid)
            {
                UserRegistration userRegistration = mp.ObjUserRegistration;
                UserRegistration userRegistrationUi = mp.ObjUserRegistration;
                SearchYourNeedLink searchYourNeedLink = mp.ObjSearchYourNeedLink;

                if (searchYourNeedLink != null && searchYourNeedLink.Id > 0)
                {
                    //string type = Request.QueryString["type"];
                    byte[] fileData = null;
                    using (var binaryReader = new BinaryReader(Request.Files["fileUploadProfilePic"].InputStream))
                    {
                        fileData = binaryReader.ReadBytes(Request.Files["fileUploadProfilePic"].ContentLength);
                    }
                    SearchYourNeed searchYourNeed = new SearchYourNeed();
                    using (UsersContext dbUserContext = new UsersContext())
                    {
                        userRegistration.CreatedOn = DateTime.Now;
                        userRegistration.IsVisitor = true;
                        userRegistration.Status = 1;
                        userRegistration.CreatedBy = 1;
                        userRegistration.UserName = userRegistration.MobileNo;
                        userRegistration.ProfilePic = fileData;

                        Logon user = dbUserContext.Logons.FirstOrDefault(u => u.UserName.ToLower() == userRegistration.UserName.ToLower());
                        if (user == null)
                        {
                            dbUserContext.Logons.Add(new Logon { UserName = userRegistration.UserName });
                            dbUserContext.SaveChanges();

                            db.UserRegistrations.Add(userRegistration);
                            db.SaveChanges();

                            userRegistration.CreatedBy = (Session["LoggedInUserId"] != null) ? (long)Session["LoggedInUserId"] : userRegistration.Id;
                            db.SaveChanges();

                            WebSecurity.CreateUserAndAccount(userRegistration.MobileNo, GetRandomPassword());
                        }
                        else
                        {
                            userRegistration = db.UserRegistrations.FirstOrDefault(u => u.UserName.ToLower() == userRegistration.UserName.ToLower());
                        }
                    }

                    searchYourNeed.UserId = userRegistration.Id;
                    searchYourNeed.LinkId = searchYourNeedLink.Id;
                    searchYourNeed.FirstName = userRegistrationUi.FirstName;
                    searchYourNeed.LastName = userRegistrationUi.LastName;
                    searchYourNeed.MobileNo = userRegistrationUi.MobileNo;
                    searchYourNeed.Address = userRegistrationUi.Address;
                    searchYourNeed.PinCode = userRegistrationUi.PinCode;
                    searchYourNeed.ProfilePic = fileData;
                    searchYourNeed.Status = true;
                    searchYourNeed.CreatedBy = userRegistration.CreatedBy;
                    searchYourNeed.CreatedOn = DateTime.Now;

                    db.SearchYourNeeds.Add(searchYourNeed);
                    db.SaveChanges();

                    return PartialView("~/Views/Home/_SearchYourNeedList.cshtml");
                }   
                else
                {
                    return PartialView("~/Views/Home/_SearchYourNeedList.cshtml");
                }
            }
            return PartialView("~/Views/Home/_SearchYourNeedList.cshtml");
        }

        [AllowAnonymous]
        public ActionResult SearchYourNeedEdit(long id)
        {
            ModelProperty mp = new ModelProperty();
            SearchYourNeed searchYourNeed = db.SearchYourNeeds.Find(id);
            mp.ObjSearchYourNeed = searchYourNeed;
            mp.ObjUserRegistration = db.UserRegistrations.Find(searchYourNeed.UserId);
            return View(mp);
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult SearchYourNeedEdit(ModelProperty mp, string type)
        {
            if (ModelState.IsValid)
            {
                UserRegistration userRegistration = mp.ObjUserRegistration;
                UserRegistration userRegistrationUi = mp.ObjUserRegistration;
                SearchYourNeedLink searchYourNeedLink = mp.ObjSearchYourNeedLink;

                //if (searchYourNeedLink != null && searchYourNeedLink.Id > 0)
                //{
                //string type = Request.QueryString["type"];
                    byte[] fileData = null;
                    using (var binaryReader = new BinaryReader(Request.Files["fileUploadProfilePic"].InputStream))
                    {
                        fileData = binaryReader.ReadBytes(Request.Files["fileUploadProfilePic"].ContentLength);
                    }
                    SearchYourNeed searchYourNeed = new SearchYourNeed();
                    using (UsersContext dbUserContext = new UsersContext())
                    {
                        userRegistrationUi.UserName = userRegistrationUi.MobileNo;
                        if (userRegistration.Id > 0)
                            userRegistration = db.UserRegistrations.Find(userRegistration.Id);

                        userRegistration.FirstName = userRegistrationUi.FirstName;
                        userRegistration.LastName = userRegistrationUi.LastName;
                        userRegistration.Address = userRegistrationUi.Address;
                        userRegistration.PinCode = userRegistrationUi.PinCode;
                        userRegistration.IsVisitor = true;
                        userRegistration.Status = 1;
                        userRegistration.UserName = userRegistration.MobileNo;
                        userRegistration.ProfilePic = fileData;
                        
                        //userRegistration.CreatedOn = DateTime.Now;

                        Logon user = dbUserContext.Logons.FirstOrDefault(u => u.UserName.ToLower() == userRegistrationUi.UserName.ToLower());
                        if (user == null)
                        {
                            user = dbUserContext.Logons.FirstOrDefault(m => m.UserName == userRegistration.UserName);
                            user.UserName = userRegistrationUi.UserName;
                            dbUserContext.Entry(user).State = EntityState.Modified;
                            dbUserContext.SaveChanges();

                            db.Entry(userRegistration).State = EntityState.Modified;
                            db.SaveChanges();

                            //userRegistration.CreatedBy = (Session["LoggedInUserId"] != null) ? (long)Session["LoggedInUserId"] : userRegistration.Id;
                            //db.SaveChanges();
                        }
                        else
                        {
                            db.Entry(userRegistration).State = EntityState.Modified;
                            db.SaveChanges();
                        }
                    }

                    if (mp.ObjSearchYourNeed.Id > 0)
                        searchYourNeed = db.SearchYourNeeds.Find(mp.ObjSearchYourNeed.Id);

                    //searchYourNeed.UserId = userRegistration.Id;
                    //searchYourNeed.LinkId = searchYourNeedLink.Id;
                    searchYourNeed.FirstName = userRegistrationUi.FirstName;
                    searchYourNeed.LastName = userRegistrationUi.LastName;
                    searchYourNeed.MobileNo = userRegistrationUi.MobileNo;
                    searchYourNeed.Address = userRegistrationUi.Address;
                    searchYourNeed.PinCode = userRegistrationUi.PinCode;
                    searchYourNeed.ProfilePic = fileData;
                    searchYourNeed.Status = true;
                    //searchYourNeed.CreatedBy = userRegistration.CreatedBy;
                    //searchYourNeed.CreatedOn = DateTime.Now;

                    db.Entry(searchYourNeed).State = EntityState.Modified;
                    db.SaveChanges();

                    return RedirectToAction("SearchYourNeeds", new { type = type });
                //}
                //else
                //{
                //    return PartialView("~/Views/Home/_SearchYourNeedList.cshtml");
                //}
            }
            return PartialView("~/Views/Home/_SearchYourNeedList.cshtml");
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult DeleteSearchYourNeed(long id, string type)
        {
            if(id > 0)
            {
                SearchYourNeed searchYourNeed = db.SearchYourNeeds.Find(id);
                if(searchYourNeed != null)
                {
                    db.SearchYourNeeds.Remove(searchYourNeed);
                    db.SaveChanges();
                    return RedirectToAction("SearchYourNeeds", new { type = type });
                }

            }
            return RedirectToAction("SearchYourNeeds", new { type = type });
        }

        [AllowAnonymous]
        public ActionResult PopularSearches()
        {
            return View(db.PageContents.Where(m => m.PageType == "PopularSearches").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult ContactUs()
        {
            ModelProperty mp = new ModelProperty { ObjPageContent = db.PageContents.Where(m => m.PageType == "ContactUs").FirstOrDefault(), ObjEnquiry = new Enquiry { EmailTo = "help@darbhangacity.com" } };
            return View(mp);
        }

        [AllowAnonymous]
        public ActionResult EmailUs()
        {
            ModelProperty mp = new ModelProperty { ObjPageContent = db.PageContents.Where(m => m.PageType == "ContactUs").FirstOrDefault(), ObjEnquiry = new Enquiry { EmailTo = "help@darbhangacity.com" } };
            return View(mp);
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult EmailUs(Enquiry eq)
        {
            if (ModelState.IsValid)
            {
                HttpFileCollectionBase files = Request.Files;
                string filePath = string.Empty;
                if (files != null && files.Count > 0)
                {
                    string UploadRootPath = ConfigurationManager.AppSettings["UploadRootPath"];
                    foreach (string item in files)
                    {
                        HttpPostedFileBase httpPostedFileBase = Request.Files[item];
                        if (httpPostedFileBase != null && httpPostedFileBase.ContentLength > 0)
                        {
                            string folderPath = UploadRootPath + "Enquiry";

                            string fileName = folderPath + "/"
                                + Path.GetFileNameWithoutExtension(httpPostedFileBase.FileName)
                                + "_" + Path.GetRandomFileName().Replace(".", "")
                                + "_" + DateTime.Now.Ticks.ToString().Replace(".", "")
                                + Path.GetExtension(httpPostedFileBase.FileName);
                            if (!Directory.Exists(Server.MapPath(folderPath)))
                                Directory.CreateDirectory(Server.MapPath(folderPath));
                            httpPostedFileBase.SaveAs(Server.MapPath(fileName));
                            filePath = fileName;
                            break;
                        }
                    }
                }

                eq.CreatedOn = DateTime.Now;
                eq.CreatedBy = 1;
                eq.Status = db.StatusConditions.Where(m => m.StatusName == StatusEnum.Created).FirstOrDefault().Id;
                eq.EnquiryDocument = filePath;
                db.Enquiries.Add(eq);
                db.SaveChanges();
                ViewBag.Message = "Thank you for contacting us. We will be happy to help you. Our operation team will contact you within 24hr.";

                ModelProperty mp1 = new ModelProperty { ObjPageContent = db.PageContents.Where(m => m.PageType == "ContactUs").FirstOrDefault(), ObjEnquiry = new Enquiry { EmailTo = "help@darbhangacity.com" } };
                return View(mp1);
            }
            ModelProperty mp = new ModelProperty { ObjPageContent = db.PageContents.Where(m => m.PageType == "ContactUs").FirstOrDefault(), ObjEnquiry = eq };
            return View(mp);
        }

        [AllowAnonymous]
        public ActionResult CancellationReturns()
        {
            return View(db.PageContents.Where(m => m.PageType == "CancellationReturns").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult FAQ()
        {
            return View(db.PageContents.Where(m => m.PageType == "FAQ").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult Payments()
        {
            return View(db.PageContents.Where(m => m.PageType == "Payments").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult FeatureAds()
        {
            return View(db.PageContents.Where(m => m.PageType == "FeatureAds").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult JoinDarbhanngaCity()
        {
            return View(db.PageContents.Where(m => m.PageType == "JoinDarbhanngaCity").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult TermsAndCondition()
        {
            return View(db.PageContents.Where(m => m.PageType == "TermsAndCondition").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult AdvertiseWithUs()
        {
            return View(db.PageContents.Where(m => m.PageType == "AdvertiseWithUs").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult ImportantLinks()
        {
            return View(db.PageContents.Where(m => m.PageType == "ImportantLinks").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult LocationWhereWeAre()
        {
            return View(db.PageContents.Where(m => m.PageType == "LocationWhereWeAre").FirstOrDefault());
        }

        [AllowAnonymous]
        public ActionResult PostFreeAddListing()
        {
            ViewBag.Category = db.Cateogries;
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult PostFreeAddListing(ModelProperty mp, FormCollection collection)
        {
            if (ModelState.IsValid)
            {
                HttpFileCollectionBase files = Request.Files;
                List<string> filePaths = null;
                if (files != null && files.Count > 0)
                {
                    filePaths = new List<string>();
                    string UploadRootPath = ConfigurationManager.AppSettings["UploadRootPath"];
                    foreach (string item in files)
                    {
                        HttpPostedFileBase httpPostedFileBase = Request.Files[item];
                        if (httpPostedFileBase != null && httpPostedFileBase.ContentLength > 0)
                        {
                            string folderPath = UploadRootPath + "FreeAddListing";

                            string fileName = folderPath + "/"
                                + Path.GetFileNameWithoutExtension(httpPostedFileBase.FileName)
                                + "_" + Path.GetRandomFileName().Replace(".", "")
                                + "_" + DateTime.Now.Ticks.ToString().Replace(".", "")
                                + Path.GetExtension(httpPostedFileBase.FileName);
                            if (!Directory.Exists(Server.MapPath(folderPath)))
                                Directory.CreateDirectory(Server.MapPath(folderPath));
                            httpPostedFileBase.SaveAs(Server.MapPath(fileName));
                            filePaths.Add(fileName);
                        }
                    }
                }

                UserRegistration userRegistration = mp.ObjUserRegistration;
                Post post = mp.ObjPost;
                List<PostImage> postImages = new List<PostImage>();
                PostCateogryMapping postCateogryMapping = new PostCateogryMapping { CateogryId = (collection["hdnCategoryItemSelected"] != null ? 
                    Convert.ToInt64(collection["hdnCategoryItemSelected"]) : 0) };
                postImages.AddRange(filePaths.Select(m => new PostImage { ImageUrl = m, PostId = 0 }));


                using (UsersContext dbUserContext = new UsersContext())
                {
                    userRegistration.CreatedOn = DateTime.Now;
                    userRegistration.IsVisitor = true;
                    userRegistration.Status = db.StatusConditions.Where(m=>m.StatusName==StatusEnum.Published).FirstOrDefault().Id;
                    userRegistration.CreatedBy = 1;
                    userRegistration.UserName = userRegistration.MobileNo;

                    Logon user = dbUserContext.Logons.FirstOrDefault(u => u.UserName.ToLower() == userRegistration.UserName.ToLower());
                    if (user == null)
                    {
                        dbUserContext.Logons.Add(new Logon { UserName = userRegistration.UserName });
                        dbUserContext.SaveChanges();

                        db.UserRegistrations.Add(userRegistration);
                        db.SaveChanges();

                        WebSecurity.CreateUserAndAccount(userRegistration.MobileNo, GetRandomPassword());
                    }
                    else
                    {
                        userRegistration = db.UserRegistrations.FirstOrDefault(u => u.UserName.ToLower() == userRegistration.UserName.ToLower());
                    }
                }

                post.PostType = (string)PostTypeEnum.Free;
                post.CreatedBy = userRegistration.Id;
                post.UserId = userRegistration.Id;
                post.CreatedOn = DateTime.Now;
                post.Status = db.StatusConditions.Where(m => m.StatusName == StatusEnum.Published).FirstOrDefault().Id;

                db.Posts.Add(post);
                db.SaveChanges();

                postCateogryMapping.PostId = post.Id;
                postCateogryMapping.CreatedBy = userRegistration.Id;
                postCateogryMapping.CreatedOn = DateTime.Now;
                db.PostCateogryMappings.Add(postCateogryMapping);
                //db.SaveChanges();

                foreach (PostImage item in postImages)
                {
                    item.PostId = post.Id;
                    db.PostImages.Add(item);
                }
                db.SaveChanges();
                return RedirectToAction("SinglePost", "Home", new { postid = post.Id });
            }

            ViewBag.Category = db.Cateogries;
            ViewBag.SelectedCategoryId = (collection["hdnCategoryItemSelected"] != null ?
                Convert.ToInt64(collection["hdnCategoryItemSelected"]) : 0);
            ViewBag.SelectedCategoryValue = (collection["txtCategory"] != null ?
                Convert.ToString(collection["txtCategory"]) : "");
            return View(mp);
        }

        [AllowAnonymous]
        public ActionResult PostFreeEditListing(long? id)
        {
            ModelProperty mp = new ModelProperty();
            if (id != null)
            {
                if (Session["LoggedInUserId"] == null)
                    return new HttpUnauthorizedResult();
                mp.ObjPost = db.Posts.Include("UserRegistration").Include("PostImages").Include("PostCateogryMappings")
                    .Where(m => m.Id == id).FirstOrDefault();
                mp.ObjUserRegistration = (mp.ObjPost != null) ? mp.ObjPost.UserRegistration : mp.ObjUserRegistration;

                ViewBag.Category = db.Cateogries;
                ViewBag.SelectedCategoryId = (mp.ObjPost != null && mp.ObjPost.PostCateogryMappings != null) ? mp.ObjPost.PostCateogryMappings.FirstOrDefault().CateogryId : 0;
                ViewBag.SelectedCategoryValue = (mp.ObjPost != null && mp.ObjPost.PostCateogryMappings != null && mp.ObjPost.PostCateogryMappings.FirstOrDefault().CateogryId > 0) ? db.Cateogries.Find(mp.ObjPost.PostCateogryMappings.FirstOrDefault().CateogryId).CateogryName : "";
                return View(mp);
            }
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult PostFreeEditListing(ModelProperty mp, FormCollection collection)
        {
            if (ModelState.IsValid)
            {
                ViewBag.Category = db.Cateogries;
                HttpFileCollectionBase files = Request.Files;
                List<string> filePaths = null;
                if (files != null && files.Count > 0)
                {
                    filePaths = new List<string>();
                    string UploadRootPath = ConfigurationManager.AppSettings["UploadRootPath"];
                    foreach (string item in files)
                    {
                        HttpPostedFileBase httpPostedFileBase = Request.Files[item];
                        if (httpPostedFileBase != null && httpPostedFileBase.ContentLength > 0)
                        {
                            string folderPath = UploadRootPath + "FreeAddListing";

                            string fileName = folderPath + "/"
                                + Path.GetFileNameWithoutExtension(httpPostedFileBase.FileName)
                                + "_" + Path.GetRandomFileName().Replace(".", "")
                                + "_" + DateTime.Now.Ticks.ToString().Replace(".", "")
                                + Path.GetExtension(httpPostedFileBase.FileName);
                            if (!Directory.Exists(Server.MapPath(folderPath)))
                                Directory.CreateDirectory(Server.MapPath(folderPath));
                            httpPostedFileBase.SaveAs(Server.MapPath(fileName));
                            filePaths.Add(fileName);
                        }
                    }
                }

                UserRegistration userRegistration = mp.ObjUserRegistration;
                Post post = mp.ObjPost;
                List<PostImage> postImages = new List<PostImage>();
                PostCateogryMapping postCateogryMapping = new PostCateogryMapping
                {
                    CateogryId = (collection["hdnCategoryItemSelected"] != null ?
                        Convert.ToInt64(collection["hdnCategoryItemSelected"]) : 0)
                };
                postImages.AddRange(filePaths.Select(m => new PostImage { ImageUrl = m, PostId = 0 }));


                using (UsersContext dbUserContext = new UsersContext())
                {
                    userRegistration.CreatedOn = DateTime.Now;
                    userRegistration.IsVisitor = true;
                    userRegistration.Status = db.StatusConditions.Where(m => m.StatusName == StatusEnum.Published).FirstOrDefault().Id;
                    userRegistration.CreatedBy = 1;
                    userRegistration.UserName = userRegistration.MobileNo;

                    Logon user = dbUserContext.Logons.FirstOrDefault(u => u.UserName.ToLower() == userRegistration.UserName.ToLower());
                    if (user == null)
                    {
                        dbUserContext.Logons.Add(new Logon { UserName = userRegistration.UserName });
                        dbUserContext.SaveChanges();

                        db.UserRegistrations.Add(userRegistration);
                        db.SaveChanges();

                        WebSecurity.CreateUserAndAccount(userRegistration.MobileNo, GetRandomPassword());
                    }
                    else
                    {
                        userRegistration = db.UserRegistrations.FirstOrDefault(u => u.UserName.ToLower() == userRegistration.UserName.ToLower());
                    }
                }

                post.PostType = (string)PostTypeEnum.Free;
                post.CreatedBy = userRegistration.Id;
                post.UserId = userRegistration.Id;
                post.CreatedOn = DateTime.Now;
                post.Status = db.StatusConditions.Where(m => m.StatusName == StatusEnum.Published).FirstOrDefault().Id;

                if (post.Id > 0)
                    db.Entry(post).State = EntityState.Modified;
                else
                    db.Posts.Add(post);
                db.SaveChanges();

                postCateogryMapping.PostId = post.Id;
                postCateogryMapping.CreatedBy = userRegistration.Id;
                postCateogryMapping.CreatedOn = DateTime.Now;
                db.PostCateogryMappings.Add(postCateogryMapping);
                //db.SaveChanges();

                foreach (PostImage item in postImages)
                {
                    item.PostId = post.Id;
                    db.PostImages.Add(item);
                }
                db.SaveChanges();

                if (mp.ObjPost.Id > 0)
                {
                    List<long> fileIds = new List<long>();
                    foreach (PostImage item in postImages)
                    {
                        fileIds.Add(item.Id);
                    }
                    if (collection["hdnUploadPhotos1"] != null && !String.IsNullOrEmpty(collection["hdnUploadPhotos1"]))
                        fileIds.Add(Convert.ToInt64(collection["hdnUploadPhotos1"]));
                    if (collection["hdnUploadPhotos2"] != null && !String.IsNullOrEmpty(collection["hdnUploadPhotos2"]))
                        fileIds.Add(Convert.ToInt64(collection["hdnUploadPhotos2"]));
                    if (collection["hdnUploadPhotos3"] != null && !String.IsNullOrEmpty(collection["hdnUploadPhotos3"]))
                        fileIds.Add(Convert.ToInt64(collection["hdnUploadPhotos3"]));
                    if (collection["hdnUploadPhotos4"] != null && !String.IsNullOrEmpty(collection["hdnUploadPhotos4"]))
                        fileIds.Add(Convert.ToInt64(collection["hdnUploadPhotos4"]));
                    if (collection["hdnUploadPhotos5"] != null && !String.IsNullOrEmpty(collection["hdnUploadPhotos5"]))
                        fileIds.Add(Convert.ToInt64(collection["hdnUploadPhotos5"]));
                    if (collection["hdnUploadPhotos6"] != null && !String.IsNullOrEmpty(collection["hdnUploadPhotos6"]))
                        fileIds.Add(Convert.ToInt64(collection["hdnUploadPhotos6"]));

                    List<PostImage> removePostImage = db.PostImages.Where(m => m != null && m.PostId == post.Id && !fileIds.Contains(m.Id)).Select(m => m).ToList();
                    if (removePostImage != null && removePostImage.Count > 0)
                        foreach (PostImage item in removePostImage)
                        {
                            db.PostImages.Remove(item);
                            db.SaveChanges();
                            if (!String.IsNullOrEmpty(item.ImageUrl) && System.IO.File.Exists(Server.MapPath(item.ImageUrl)))
                                System.IO.File.Delete(Server.MapPath(item.ImageUrl));
                        }
                }
                return RedirectToAction("SinglePost", "Home", new { postid = post.Id });
            }
            return View();
        }

        [Authorize]
        public ActionResult ApplyPvcAdharCard()
        {

            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult ApplyPvcAdharCard(ModelProperty mp)
        {
            if (ModelState.IsValid)
            {
                long loggedInUserId = Convert.ToInt64(Session["loggedInUserId"]);
                if (loggedInUserId > 0)
                {
                    HttpFileCollectionBase files = Request.Files;
                    List<string> filePaths = null;
                    if (files != null && files.Count > 0)
                    {
                        filePaths = new List<string>();
                        string UploadRootPath = ConfigurationManager.AppSettings["UploadRootPath"];
                        foreach (string item in files)
                        {
                            HttpPostedFileBase httpPostedFileBase = Request.Files[item];
                            if (httpPostedFileBase != null && httpPostedFileBase.ContentLength > 0)
                            {
                                string folderPath = UploadRootPath + "PvcCardRequest";

                                string fileName = folderPath + "/"
                                    + Path.GetFileNameWithoutExtension(httpPostedFileBase.FileName)
                                    + "_" + Path.GetRandomFileName().Replace(".", "")
                                    + "_" + DateTime.Now.Ticks.ToString().Replace(".", "")
                                    + Path.GetExtension(httpPostedFileBase.FileName);
                                if (!Directory.Exists(Server.MapPath(folderPath)))
                                    Directory.CreateDirectory(Server.MapPath(folderPath));
                                httpPostedFileBase.SaveAs(Server.MapPath(fileName));
                                filePaths.Add(fileName);
                            }
                        }
                    }

                    //UserRegistration userRegistration = mp.ObjUserRegistration;
                    Pvc pvc = mp.ObjPvc;
                    List<PvcAdharDocument> pvcImages = new List<PvcAdharDocument>();
                    pvcImages.AddRange(filePaths.Select(m => new PvcAdharDocument { DocumentUrl = m, PvcId = 0 }));

                    //userRegistration.CreatedBy = 1;
                    //userRegistration.CreatedOn = DateTime.Now;
                    //userRegistration.UserName = userRegistration.MobileNo;
                    //userRegistration.IsVisitor = true;
                    //userRegistration.Status = 1;

                    //db.UserRegistrations.Add(userRegistration);
                    //db.SaveChanges();



                    pvc.CreatedBy = loggedInUserId;
                    pvc.CreatedOn = DateTime.Now;
                    pvc.UserId = loggedInUserId;

                    db.Pvcs.Add(pvc);
                    db.SaveChanges();

                    foreach (PvcAdharDocument item in pvcImages)
                    {
                        item.PvcId = pvc.Id;
                        db.PvcAdharDocuments.Add(item);
                    }
                    db.SaveChanges();

                    List<Pvc> pvcs = db.Pvcs.Include("UserRegistration").Include("PvcAdharDocuments").Where(m => m.UserId == loggedInUserId).ToList();
                    return PartialView("~/Views/Home/_PvcForUser.cshtml");
                }
            }
            return PartialView();
        }

        [AllowAnonymous]
        public ActionResult CateogryWisePost(long? id)
        {
            List<Post> posts = db.Posts.Include("PostImages").Include("UserRegistration").Include("StatusCondition")
                .Join(db.PostCateogryMappings.Include("Cateogry"), m => m.Id, n => n.PostId, (m, n) => new { m, n })
                .Where(m => m.n.CateogryId == id).Select(m => m.m).ToList();
            return View(posts);
        }

        [AllowAnonymous]
        public ActionResult SinglePost(long? id)
        {
            Post post = db.Posts.Include("PostImages").Include("UserRegistration").Include("StatusCondition")
                .GroupJoin(db.PostCateogryMappings.Include("Cateogry"), m => m.Id, n => n.PostId, (m, n) => new { m, n })
                .Where(m => m.m.Id == id).Select(m => m.m).FirstOrDefault();

            if (post != null)
                ViewBag.Category = db.PostCateogryMappings.Include("Cateogry").Where(m => m.PostId == post.Id).ToList();
            return View(post);
        }

        [AllowAnonymous]
        public ActionResult SearchSuggestion(string searchParameter)
        {
            List<Search> searchs = db.Searches.Where(m => m.Title.Contains(searchParameter) || m.SearchContent.Contains(searchParameter)).ToList();
            return PartialView("_SearchResult", searchs);
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult SearchSuggestionResults(FormCollection collection)
        {
            string searchTerm = collection["txtSearch"];
            string categoryTerm = collection["selectSearch"];

            List<Search> searchs = db.Searches.Where(m => m.Title.Contains(searchTerm) || m.SearchContent.Contains(searchTerm)).ToList();
            return View(searchs);
        }

        [AllowAnonymous]
        [HttpGet]
        //[Route("sitemap.xml")]
        public ActionResult SitemapXml()
        {
            SiteMapGenerate siteMapGenerate = new SiteMapGenerate();
            //SitemapGenerator sitemapGenerator = new SitemapGenerator();
            var sitemapNodes = siteMapGenerate.GetSitemapNodes(this.Url);
            string xml = siteMapGenerate.GetSitemapDocument(sitemapNodes);
            //string xml = sitemapGenerator.GetSitemapDocuments(sitemapNodes);
            return this.Content(xml, "text/xml", Encoding.UTF8);
        }

        [AllowAnonymous]
        [HttpGet]
        public ActionResult RobotsText()
        {
            StringBuilder stringBuilder = new StringBuilder();

            stringBuilder.AppendLine("user-agent: *");
            stringBuilder.AppendLine("disallow: /error/");
            stringBuilder.AppendLine("allow: /error/foo");
            stringBuilder.Append("sitemap: ");
            stringBuilder.AppendLine(this.Url.RouteUrl("Sitemap", new { controller = "Home", action = "SitemapXml" }, this.Request.Url.Scheme).TrimEnd('/'));

            return this.Content(stringBuilder.ToString(), "text/plain", Encoding.UTF8);
        }
    }
}
