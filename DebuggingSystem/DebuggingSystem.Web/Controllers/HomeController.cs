using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DebuggingSystem.Models;
using System.Web.Security;
using WebMatrix.WebData;
using DebuggingSystem.Web.Filters;
using DebuggingSystem.Web.ViewModels;

namespace DebuggingSystem.Web.Controllers
{

    [InitializeSimpleMembership]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}
