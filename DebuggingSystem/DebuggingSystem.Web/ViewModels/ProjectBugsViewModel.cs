using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DebuggingSystem.Models;

namespace DebuggingSystem.Web.ViewModels
{
    public class ProjectBugsViewModel
    {
        public int ProjectId { get; set; }
        public string ProjectName { get; set; }
        public string ProjectDescription { get; set; }
        public string DebuggerName { get; set; }
        public int BugId { get; set; }
        public string BugDescription { get; set; }
        public string Priority { get; set; }
        public DateTime Date { get; set; }
        public string Status { get; set; }
    }
}