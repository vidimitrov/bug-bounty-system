using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DebuggingSystem.Web.ViewModels
{
    public class EditUserViewModel
    {
        public int UserId { get; set; }
        public string FullName { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
    }
}