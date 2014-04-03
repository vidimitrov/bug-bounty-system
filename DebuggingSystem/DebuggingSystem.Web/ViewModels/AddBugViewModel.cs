using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DebuggingSystem.Web.ViewModels
{
    public class AddBugViewModel
    {
        public string ProjectName { get; set; }
        public string Description { get; set; }
        public string Priority { get; set; }
    }
}