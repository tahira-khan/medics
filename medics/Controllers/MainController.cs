using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using medics.Models;

namespace medics.Controllers
{
    public class MainController : Controller
    {
        medicalEntities db = new medicalEntities();

        // GET: Main
        public ActionResult Index()
        {
            return View();
        } 
        
        public ActionResult gallery()
        {
            return View();
        }

        [HttpPost]
        public ActionResult blog(string search)
        {
            return View(db.blogs.Where(x => x.blogtitle.Contains(search) || x.blogdescription.Contains(search)).ToList());
        }  
        
        public ActionResult alumni()
        {
            return View(db.blogs.Where(x=>x.category.cat_id == 1).ToList());
        }    
        
        public ActionResult psychology()
        {
            return View(db.blogs.Where(x=>x.category.cat_id == 2).ToList());
        }  
        
        public ActionResult sonogram()
        {
            return View(db.blogs.Where(x=>x.category.cat_id == 3).ToList());
        }  
        public ActionResult xray()
        {
            return View(db.blogs.Where(x=>x.category.cat_id == 4).ToList());
        } 
        
        public ActionResult dental()
        {
            return View(db.blogs.Where(x=>x.category.cat_id == 5).ToList());
        } 
        
        public ActionResult about()
        {
            return View();
        }    
        
        public ActionResult team()
        {
            return View();
        }

        public ActionResult blogdetails(int id)
        {
            Session["blogid"] = id;
            blog b1 = db.blogs.Find(id);
            return View(b1);
        }

        public ActionResult blog()
        {
            return View(db.blogs.ToList());
        }

        public ActionResult login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult login(register r1)
        {
            var res = db.registers.Where(x => x.username == r1.username && x.pass == r1.pass).SingleOrDefault();
            if(res!=null)
            {
                Session["user"] = res.username;
                Session["userid"] = res.userid;
                Session["img"] = res.user_img;
                return RedirectToAction("index");
            }
            else
            {
                ViewBag.error = "Invalid Login data";
            }
            return View();
        }

        public ActionResult signup()
        {
           
            return View();
        }
        [HttpPost]
        public ActionResult signup(register r1, HttpPostedFileBase imgupload)
        {

            imgupload.SaveAs(Server.MapPath("~/images/" + imgupload.FileName));

            r1.user_img = imgupload.FileName;
            db.registers.Add(r1);
            db.SaveChanges();
            return RedirectToAction("login");
        }

        [HttpPost]
        public ActionResult profile(register r1, HttpPostedFileBase user_img)
        {
            user_img.SaveAs(Server.MapPath("~/images/" + user_img.FileName));
            r1.user_img = user_img.FileName;
            Session["img"] = user_img.FileName;
            db.Entry(r1).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("profile");
        }
              public ActionResult profile()
        {
            if (Session["user"] != null)
            {
               int id = Convert.ToInt32(Session["userid"]);
                register r1 = db.registers.Find(id);
                return View(r1);
            }
            else
            { return RedirectToAction("login");
                
            }
           
        }



         public ActionResult appointment()
        {
            if (Session["user"]!=null)
            {
return View();
            }
            else
            {
                return RedirectToAction("login");
            }
            
        }

        public ActionResult test()
        {
            return View();
        } 
        
        public ActionResult contactus()
        {
            return View();
        }
        [HttpPost]
        public ActionResult contactus(contactu c)
        {
            db.contactus.Add(c);
            db.SaveChanges();
            ViewBag.msg = "You will be contacted soon...";

            return View();
        }  
        
        public ActionResult services()
        {
            return View();
        } 
        
        public ActionResult seecomments()
        {
            int id = Convert.ToInt32(Session["blogid"]);
            return PartialView("_displaycomments", db.comments.ToList().Where(x => x.blogid == id));
        } 
        
        [HttpPost]
        public ActionResult comments(string form_message, string form_name, string form_email)
        {
            comment c = new comment();
            c.blogid = Convert.ToInt32(Session["blogid"]);
            c.comments = form_message;
            c.cdate = DateTime.Today;
            c.guestname = form_name;
            c.email = form_email;
            db.comments.Add(c);
            db.SaveChanges();
            return RedirectToAction("blogdetails/"+Session["blogid"]);
        }

        public ActionResult logout()
        {
            Session.Abandon();
            Session.RemoveAll();
            return RedirectToAction("login");
        }


    }
}