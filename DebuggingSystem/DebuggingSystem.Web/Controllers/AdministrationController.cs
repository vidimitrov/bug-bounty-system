using DebuggingSystem.Models;
using DebuggingSystem.Web.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using DebuggingSystem.Web.ViewModels;
using WebMatrix.WebData;

namespace DebuggingSystem.Web.Controllers
{
    public class AdministrationController : Controller
    {
        DebuggingSystemDB db = new DebuggingSystemDB();

        [Authorize(Roles = "Administrator")]
        public ActionResult Index()
        {
            var debuggers = db.UserProfiles.Select(up => new DebuggerViewModel
            {
               UserId = up.UserId,
               UserName = up.UserName
            }).ToList();

            var projects = db.Projects.Select(p => new ProjectViewModel 
            {
                ProjectId = p.ProjectId,
                Name = p.Name,
                Description = p.Description
            }).ToList();

            var model = new ProjectsDebuggersViewModel
            {
                Debuggers = debuggers,
                Projects = projects
            };
            
            return View(model);
        }

        //Manage users

        [Authorize(Roles = "Administrator")]
        public ActionResult AddUser()
        {
            return View();
        }

        [Authorize(Roles = "Administrator")]
        [InitializeSimpleMembership]
        public ActionResult DoAddUser(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    WebSecurity.CreateUserAndAccount(model.UserName, model.Password, new
                    {
                        FullName = model.FullName,
                        Email = model.Email,
                        PhoneNumber = model.PhoneNumber
                    });
                    Roles.AddUserToRole(model.UserName, "Debugger");
                    return RedirectToAction("Index", "Administration");
                }
                catch (MembershipCreateUserException e)
                {
                    ModelState.AddModelError("", 
                        DebuggingSystem.Web.Controllers.AccountController.ErrorCodeToString(e.StatusCode));
                }
            }

            return RedirectToAction("DoAddUser","Administration", model);
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult EditUser(FormCollection form)
        {
            int value = int.Parse(form["debuggerDropDownList"]);

            var debugger = db.UserProfiles.Where(x => x.UserId == value)
                .Select(x => new EditUserViewModel { 
                    FullName = x.FullName,
                    PhoneNumber = x.PhoneNumber,
                    Email = x.Email,
                    UserName = x.UserName,
                    UserId = value
                }).SingleOrDefault();

            return View(debugger);
        }


        [Authorize(Roles = "Administrator")]
        public ActionResult DoEditUser(EditUserViewModel edittedDebugger)
        {
            var debugger = db.UserProfiles.Where(x => x.UserId == edittedDebugger.UserId).SingleOrDefault();

            if (debugger.FullName != edittedDebugger.FullName)
            {
                debugger.FullName = edittedDebugger.FullName;
            }

            if (debugger.Email != edittedDebugger.Email)
            {
                debugger.Email = edittedDebugger.Email;
            }

            if (debugger.PhoneNumber != edittedDebugger.PhoneNumber)
            {
                debugger.PhoneNumber = edittedDebugger.PhoneNumber;
            }

            db.SaveChanges();

            return Redirect("/Administration/Index");
        }

        [Authorize(Roles = "Administrator")]
        [InitializeSimpleMembership]
        public ActionResult DeleteUser(int Id)
        {
            var debugger = db.UserProfiles.Where(x => x.UserId == Id).SingleOrDefault();

            var userRole = Roles.GetRolesForUser(debugger.UserName);
            
            Roles.RemoveUserFromRole(debugger.UserName, userRole[0]);

            Membership.DeleteUser(debugger.UserName);

            db.SaveChanges();

            return Redirect("/Administration/Index");
        }


        [Authorize(Roles = "Administrator")]
        public ActionResult ChangeRoles()
        {
            return View();
        }

        [Authorize(Roles = "Administrator")]
        [InitializeSimpleMembership]
        public ActionResult DoChangeRoles(string username, string role)
        {

            //if (!WebSecurity.Initialized)
            //{
            //    WebSecurity.InitializeDatabaseConnection(
            //    "DefaultConnection",
            //    "UserProfile",
            //    "UserId",
            //    "UserName", autoCreateTables: true);
            //}

            foreach (var debugger in db.UserProfiles)
            {
                if (debugger.UserName == username)
                {
                    var lastUserRole = Roles.GetRolesForUser(username);

                    Roles.RemoveUserFromRole(username, lastUserRole[0]);
                    Roles.AddUserToRole(username, role);
                }
            }
            return Redirect("/Administration/Index");
        }

        //Manage projects

        [Authorize(Roles = "Administrator")]
        public ActionResult CreateProject()
        {
            return View();
        }

        [HttpPost]
        [InitializeSimpleMembership]
        [Authorize(Roles = "Administrator")]
        public ActionResult DoCreateProject(Project project)
        {
            var newProject = new Project
            {
                Name = project.Name,
                Description = project.Description
            };

            db.Projects.Add(newProject);
            db.SaveChanges();

            return Redirect("/Administration/Index");
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult EditProject(FormCollection form)
        {
            int value = int.Parse(form["editProjectDropDownList"]);

            var project = db.Projects.Where(x => x.ProjectId == value).Select(x => new EditProjectViewModel
            {
                Description = x.Description,
                ProjectId = x.ProjectId,
                Name = x.Name
            }).SingleOrDefault();

            return View(project);
        }

        [Authorize(Roles = "Administrator")]
        [InitializeSimpleMembership]
        public ActionResult DoEditProject(EditProjectViewModel edittedProject)
        {
            var project = db.Projects.Where(x => x.ProjectId == edittedProject.ProjectId).SingleOrDefault();

            if (project.Name != edittedProject.Name)
            {
                project.Name = edittedProject.Name;
            }

            if (project.Description != edittedProject.Description)
            {
                project.Description = edittedProject.Description;
            }

            db.SaveChanges();

            return Redirect("/Administration/Index");
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult DeleteProject(int Id)
        {
            var project = db.Projects.Where(x => x.ProjectId == Id).SingleOrDefault();

            var bugs = db.Bugs.Where(x => x.Project.ProjectId == Id);

            foreach (var bug in bugs)
            {
                db.Bugs.Remove(bug);
            }

            db.Projects.Remove(project);

            db.SaveChanges();

            return Redirect("/Administration/Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}
