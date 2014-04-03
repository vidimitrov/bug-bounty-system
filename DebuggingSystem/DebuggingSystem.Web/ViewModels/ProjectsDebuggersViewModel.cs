using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DebuggingSystem.Web.ViewModels
{
    public class ProjectsDebuggersViewModel
    {
        public List<ProjectViewModel> Projects { get; set; }
        public List<DebuggerViewModel> Debuggers { get; set; }
    }
}