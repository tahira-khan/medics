using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using medics.Models;

namespace medics.Controllers
{
    public class blogsController : Controller
    {
        private medicalEntities db = new medicalEntities();

        // GET: blogs
        public ActionResult Index()
        {
            var blogs = db.blogs.Include(b => b.category);
            return View(blogs.ToList());
        }

        // GET: blogs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            blog blog = db.blogs.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            return View(blog);
        }

        // GET: blogs/Create
        public ActionResult Create()
        {
            ViewBag.cat_id = new SelectList(db.categories, "cat_id", "category_name");
            return View();
        }

        // POST: blogs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "blogid,blogtitle,blogdescription,blogdate,blogauthor,cat_id")] blog blog, HttpPostedFileBase imgupload)
        {
            if (ModelState.IsValid)
            {
                blog.blogdate = DateTime.Today;
                blog.blogimg = imgupload.FileName;
                imgupload.SaveAs(Server.MapPath("~/images/" + imgupload.FileName));
                db.blogs.Add(blog);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.cat_id = new SelectList(db.categories, "cat_id", "category_name", blog.cat_id);
            return View(blog);
        }

        // GET: blogs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            blog blog = db.blogs.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            ViewBag.cat_id = new SelectList(db.categories, "cat_id", "category_name", blog.cat_id);
            return View(blog);
        }

        // POST: blogs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "blogid,blogtitle,blogdescription,blogdate,blogauthor,cat_id")] blog blog)
        {
            if (ModelState.IsValid)
            {
                db.Entry(blog).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.cat_id = new SelectList(db.categories, "cat_id", "category_name", blog.cat_id);
            return View(blog);
        }

        // GET: blogs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            blog blog = db.blogs.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            return View(blog);
        }

        // POST: blogs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            blog blog = db.blogs.Find(id);
            db.blogs.Remove(blog);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
