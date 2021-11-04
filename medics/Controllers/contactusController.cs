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
    public class contactusController : Controller
    {
        private medicalEntities db = new medicalEntities();

        // GET: contactus
        public ActionResult Index()
        {
            return View(db.contactus.ToList());
        }

        // GET: contactus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            contactu contactu = db.contactus.Find(id);
            if (contactu == null)
            {
                return HttpNotFound();
            }
            return View(contactu);
        }

        // GET: contactus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: contactus/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "cid,guestname,email,phone,msg")] contactu contactu)
        {
            if (ModelState.IsValid)
            {
                db.contactus.Add(contactu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(contactu);
        }

        // GET: contactus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            contactu contactu = db.contactus.Find(id);
            if (contactu == null)
            {
                return HttpNotFound();
            }
            return View(contactu);
        }

        // POST: contactus/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "cid,guestname,email,phone,msg")] contactu contactu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(contactu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(contactu);
        }

        // GET: contactus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            contactu contactu = db.contactus.Find(id);
            if (contactu == null)
            {
                return HttpNotFound();
            }
            return View(contactu);
        }

        // POST: contactus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            contactu contactu = db.contactus.Find(id);
            db.contactus.Remove(contactu);
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
