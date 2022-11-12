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
    public class CPostController : Controller
    {
        private PORTALEntitiy db = new PORTALEntitiy();

        //
        // GET: /CPost/

        public ActionResult Index()
        {
            var posts = db.Posts.Include(p => p.StatusCondition).Include(p => p.UserRegistration);
            return View(posts.ToList());
        }

        //
        // GET: /CPost/Details/5

        public ActionResult Details(long id = 0)
        {
            Post post = db.Posts.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }

        //
        // GET: /CPost/Create

        public ActionResult Create()
        {
            ViewBag.Status = new SelectList(db.StatusConditions, "Id", "StatusName");
            ViewBag.UserId = new SelectList(db.UserRegistrations, "Id", "FirstName");
            ViewBag.PostType = new SelectList(new List<string> { PostTypeEnum.Free, PostTypeEnum.Paid });
            return View();
        }

        //
        // POST: /CPost/Create

        [HttpPost]
        public ActionResult Create(Post post)
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
                            string folderPath = UploadRootPath + "PaidAddListing";

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

                List<PostImage> postImages = new List<PostImage>();
                PostCateogryMapping postCateogryMapping = new PostCateogryMapping();
                postImages.AddRange(filePaths.Select(m => new PostImage { ImageUrl = m, PostId = 0 }));


                //post.PostType = (string)PostTypeEnum.Free;
                //post.Status = 5;

                post.CreatedOn = DateTime.Now;
                post.CreatedBy = Convert.ToInt64(Session["LoggedInUserId"]);
                post.UserId = Convert.ToInt64(Session["LoggedInUserId"]);

                db.Posts.Add(post);
                db.SaveChanges();

                postCateogryMapping.PostId = post.Id;
                postCateogryMapping.CreatedBy = post.UserId;
                postCateogryMapping.CreatedOn = DateTime.Now;
                db.PostCateogryMappings.Add(postCateogryMapping);
                //db.SaveChanges();

                foreach (PostImage item in postImages)
                {
                    item.PostId = post.Id;
                    db.PostImages.Add(item);
                }
                db.SaveChanges();

                return RedirectToAction("Index");
            }

            ViewBag.Status = new SelectList(db.StatusConditions, "Id", "StatusName", post.Status);
            ViewBag.UserId = new SelectList(db.UserRegistrations, "Id", "FirstName", post.UserId);
            ViewBag.PostType = new SelectList(new List<string> { PostTypeEnum.Free, PostTypeEnum.Paid });
            return View(post);
        }

        //
        // GET: /CPost/Edit/5

        public ActionResult Edit(long id = 0)
        {
            Post post = db.Posts.Include("PostImages").Where(m => m.Id == id).FirstOrDefault();
            if (post == null)
            {
                return HttpNotFound();
            }
            ViewBag.Status = new SelectList(db.StatusConditions, "Id", "StatusName", post.Status);
            ViewBag.UserId = new SelectList(db.UserRegistrations, "Id", "FirstName", post.UserId);
            ViewBag.PostType = new SelectList(new List<string> { PostTypeEnum.Free, PostTypeEnum.Paid }, post.PostType);
            return View(post);
        }

        //
        // POST: /CPost/Edit/5

        [HttpPost]
        public ActionResult Edit(Post post, FormCollection collection)
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
                            string folderPath = UploadRootPath + "PaidAddListing";

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





                List<PostImage> postImages = new List<PostImage>();
                PostCateogryMapping postCateogryMapping = new PostCateogryMapping();
                if (filePaths != null)
                    postImages.AddRange(filePaths.Select(m => new PostImage { ImageUrl = m, PostId = post.Id }));



                post.UpdatedOn = DateTime.Now;
                post.UpdateBy = Convert.ToInt64(Session["LoggedInUserId"]);
                post.UserId = Convert.ToInt64(Session["LoggedInUserId"]);

                db.Entry(post).State = EntityState.Modified;
                db.SaveChanges();

                //postCateogryMapping.PostId = post.Id;
                //postCateogryMapping.CreatedBy = post.UserId;
                //postCateogryMapping.CreatedOn = DateTime.Now;
                //db.PostCateogryMappings.Add(postCateogryMapping);
                ////db.SaveChanges();

                foreach (PostImage item in postImages)
                {
                    item.PostId = post.Id;
                    db.PostImages.Add(item);
                }
                db.SaveChanges();


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
                return RedirectToAction("Index");
            }
            ViewBag.Status = new SelectList(db.StatusConditions, "Id", "StatusName", post.Status);
            ViewBag.UserId = new SelectList(db.UserRegistrations, "Id", "FirstName", post.UserId);
            ViewBag.PostType = new SelectList(new List<string> { PostTypeEnum.Free, PostTypeEnum.Paid }, post.PostType);
            return View(post);
        }

        //
        // GET: /CPost/Delete/5

        public ActionResult Delete(long id = 0)
        {
            Post post = db.Posts.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }

        //
        // POST: /CPost/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            Post post = db.Posts.Find(id);
            db.Posts.Remove(post);
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