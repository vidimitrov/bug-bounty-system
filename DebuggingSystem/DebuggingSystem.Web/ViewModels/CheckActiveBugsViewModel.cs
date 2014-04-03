using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DebuggingSystem.Web.ViewModels
{
    public class CheckActiveBugsViewModel
    {
        public string Description { get; set; }
        public string Priority { get; set; }
        public DateTime Date { get; set; }
        public string DebuggerName { get; set; }
        public string ProjectName { get; set; }
        public string Status { get; set; }
    }
}