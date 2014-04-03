using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DebuggingSystem.Models
{
    public class Bug
    {
        [Key]
        public int BugId { get; set; }
        public UserProfile Debugger { get; set; }
        public  Project Project { get; set; }
        [Display(Name = "Description")]
        public string Description { get; set; }
        [Display(Name = "Priority")]
        public string Priority { get; set; }
        [Display(Name = "Status")]
        public string Status { get; set; }
        public DateTime FindDate { get; set; }
    }
}
