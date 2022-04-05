using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KonnectUs.Controllers
{
    public class AccountController : Controller
    {
        // GET: Signup
        public ActionResult Signup()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
    }
}