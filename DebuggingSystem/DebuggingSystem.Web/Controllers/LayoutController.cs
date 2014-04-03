using DebuggingSystem.Models;
using DebuggingSystem.Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DebuggingSystem.Web.Controllers
{
    public class LayoutController : Controller
    {
        public ActionResult Index()
        {
            DebuggingSystemDB db = new DebuggingSystemDB();

            var model = db.Projects.Select(x => new ProjectViewModel
            {
                ProjectId = x.ProjectId,
                Name = x.Name,
                Description = x.Description
            });

            return View(model);
        }

    }
}
