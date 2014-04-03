using System.Data.Linq;
using DebuggingSystem.Model;
using DebuggingSystem.Models;
using DebuggingSystem.Web.Filters;
using DebuggingSystem.Web.ViewModels;
using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMatrix.WebData;

namespace DebuggingSystem.Web.Controllers
{
    public class ProjectsController : Controller
    {
        DebuggingSystemDB db = new DebuggingSystemDB();

        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        [InitializeSimpleMembership]
        public ActionResult ViewProject(FormCollection form)
        {
            int value = int.Parse(form["projectDropDownList"]);

            var project = db.Projects.Where(x => x.ProjectId == value).SingleOrDefault();

            if (db.Bugs.Any())
            {
                var bugsInProject = db.Bugs.Where(x => x.Project.ProjectId == project.ProjectId)
                    .Select(x => new ProjectBugsViewModel
                {
                    ProjectId = value,
                    ProjectName = project.Name,
                    ProjectDescription = project.Description,
                    DebuggerName = x.Debugger.FullName,
                    BugId = x.BugId,
                    BugDescription = x.Description,
                    Date = x.FindDate,
                    Priority = x.Priority,
                    Status = x.Status
                }).Where(x => x.Status != "Deleted");

                return View(bugsInProject);
            }
            else
            {
                return RedirectToAction("AddBug", "Projects", new { projectName = project.Name });
            }
        }

        [InitializeSimpleMembership]
        public ActionResult ProjectBugs_Read([DataSourceRequest] DataSourceRequest request, int projectId)
        {
            var project = db.Projects.Where(x => x.ProjectId == projectId).SingleOrDefault();

            var bugsInProject = db.Bugs.Where(x => x.Project.ProjectId == project.ProjectId)
                .Select(x => new ProjectBugsViewModel
                {
                    ProjectId = projectId,
                    ProjectName = project.Name,
                    ProjectDescription = project.Description,
                    DebuggerName = x.Debugger.FullName,
                    BugId = x.BugId,
                    BugDescription = x.Description,
                    Date = x.FindDate,
                    Priority = x.Priority,
                    Status = x.Status
                }).Where(x => x.Status != "Deleted");

            DataSourceResult result = bugsInProject.ToDataSourceResult(request);

            return Json(result);
        }

        [Authorize]
        [InitializeSimpleMembership]
        public ActionResult AddBug(string projectName)
        {
            ViewBag.ProjectName = projectName;

            return View();
        }

        [Authorize]
        [InitializeSimpleMembership]
        public ActionResult DoAddBug(AddBugViewModel bug)
        {
            var user = db.UserProfiles.FirstOrDefault(x => x.UserId == WebSecurity.CurrentUserId);

            var project = db.Projects.Where(x => x.Name == bug.ProjectName).SingleOrDefault();

            bool pairExist = false;

            foreach (var userProject in db.UserProjects)
            {
                if ((userProject.ProjectID == project.ProjectId) && (userProject.UserID == user.UserId))
                {
                    pairExist = true;
                    break;
                }
            }

            if(!pairExist)
            {
                var newUserProject = new UserProject
                {
                    User = user,
                    Project = project
                };

                db.UserProjects.Add(newUserProject);
            }

            var newBug = db.Bugs.Add(new Bug
            {
                Debugger = user,
                Project = project,
                Description = bug.Description,
                FindDate = DateTime.Now,
                Priority = bug.Priority,
                Status = "New"
            });

            user.LastActivity = DateTime.Now;
            int id = 1;

            if (db.Bugs.Any())
            {
                id = db.Bugs.ToList().LastOrDefault().BugId + 1;
            }

            user.LastAction = "add bug: #" + id + " project: " + newBug.Project.Name;

            db.SaveChanges();

            return Redirect("/Home/Index");
        }

        [Authorize]
        public ActionResult Edit([DataSourceRequest] DataSourceRequest request, ProjectBugsViewModel bugsInProject)
        {
            var bug = db.Bugs.Where(x => x.BugId == bugsInProject.BugId).Select(x => new EditBugViewModel 
            { 
                Description = x.Description,
                Priority = x.Priority,
                Status = x.Status,
                BugId = bugsInProject.BugId
            }).SingleOrDefault();

            return View(bug);
        }

        [Authorize]
        public ActionResult DoEdit(EditBugViewModel edittedBug)
        {
            var bug = db.Bugs.Where(x => x.BugId == edittedBug.BugId).SingleOrDefault();

            if(bug.Description != edittedBug.Description)
            {
                bug.Description = edittedBug.Description;
            }

            if(bug.Status != edittedBug.Status)
            {
                bug.Status = edittedBug.Status;
            }

            if(bug.Priority != edittedBug.Priority)
            {
                bug.Priority = edittedBug.Priority;
            }

            var user = db.UserProfiles.FirstOrDefault(x => x.UserId == WebSecurity.CurrentUserId);

            int id = bug.BugId;

            user.LastActivity = DateTime.Now;
            user.LastAction = "edit bug: #" + id;

            db.SaveChanges();

            return Redirect("/");
        }

        [Authorize]
        [InitializeSimpleMembership]
        public ActionResult Delete([DataSourceRequest] DataSourceRequest request, ProjectBugsViewModel bugsInProject)
        {
            var bug = db.Bugs.Where(x => x.BugId == bugsInProject.BugId).SingleOrDefault();

            bug.Status = "Deleted";

            var user = db.UserProfiles.FirstOrDefault(x => x.UserId == WebSecurity.CurrentUserId);

            int id = bugsInProject.BugId;

            user.LastActivity = DateTime.Now;
            user.LastAction = "delete bug: #" + id;

            db.SaveChanges();

            return Redirect("/");
        }
        
        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}
