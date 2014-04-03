using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DebuggingSystem.Web.ViewModels
{
    public class EditBugViewModel
    {
        public int BugId { get; set; }
        public string Description { get; set; }
        public string Priority { get; set; }
        public string Status { get; set; }
    }
}