using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DebuggingSystem.Web.ViewModels
{
    public class CheckDebuggerViewModel
    {
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public int CountOfProjects { get; set; }
        public int CountOfBugs { get; set; }
        public DateTime LastActivity { get; set; }
        public string LastAction { get; set; }
    }
}