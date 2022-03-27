using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KonnectUs.Controllers
{
    public class DoctorController : Controller
    {
        // GET: Doctor
        //public ActionResult Index()
        public ActionResult ListDoctors()
        {
            return View();
        }
    }
}