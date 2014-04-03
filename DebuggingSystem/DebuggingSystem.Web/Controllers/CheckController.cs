using DebuggingSystem.Models;
using DebuggingSystem.Web.ViewModels;
using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DebuggingSystem.Web.Controllers
{
    public class CheckController : Controller
    {
        DebuggingSystemDB db = new DebuggingSystemDB();

        //Check the debuggers

        [Authorize]
        public ActionResult CheckDebuggers()
        {
            var debuggers = db.UserProfiles.Select(x => new CheckDebuggerViewModel
            {
                FullName = x.FullName,
                Email = x.Email,
                PhoneNumber = x.PhoneNumber,
                CountOfProjects = x.UserProjects.Count(),
                CountOfBugs = db.Bugs.Where(b => b.Debugger.UserId == x.UserId).Count(),
                LastActivity = x.LastActivity,
                LastAction = x.LastAction
            });

            return View(debuggers);
        }

        public ActionResult Debuggers_Read([DataSourceRequest] DataSourceRequest request)
        {
            var debuggers = db.UserProfiles
                .Select(x => new CheckDebuggerViewModel
                {
                    FullName = x.FullName,
                    Email = x.Email,
                    PhoneNumber = x.PhoneNumber,
                    CountOfProjects = x.UserProjects.Count(),
                    CountOfBugs = db.Bugs.Where(b => b.Debugger.UserId == x.UserId).Count(),
                    LastActivity = x.LastActivity,
                    LastAction = x.LastAction
                });

            DataSourceResult result = debuggers.ToDataSourceResult(request);

            return Json(result);
        }

        //Check projects for active bugs

        [Authorize]
        public ActionResult CheckProjectBugs()
        {
            var activeBugs = db.Bugs.Select(x => new CheckActiveBugsViewModel
            {
                Description = x.Description,
                Priority = x.Priority,
                Date = x.FindDate,
                DebuggerName = x.Debugger.FullName,
                ProjectName = x.Project.Name,
                Status = x.Status
            });

            return View();
        }

        public ActionResult ActiveBugs_Read([DataSourceRequest] DataSourceRequest request)
        {
            var activeBugs = db.Bugs
                .Select(x => new CheckActiveBugsViewModel
                {
                    Description = x.Description,
                    Priority = x.Priority,
                    Date = x.FindDate,
                    DebuggerName = x.Debugger.FullName,
                    ProjectName = x.Project.Name,
                    Status = x.Status
                }).Where(x => x.Status != "Closed");

            DataSourceResult result = activeBugs.ToDataSourceResult(request);

            return Json(result);
        }
    }
}
