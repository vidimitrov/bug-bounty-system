using DebuggingSystem.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DebuggingSystem.Model
{
    public class UserProject
    {
        [Key, Column(Order = 0)]
        public int UserID { get; set; }
        [Key, Column(Order = 1)]
        public int ProjectID { get; set; }

        public virtual UserProfile User { get; set; }
        public virtual Project Project { get; set; }
    }
}
