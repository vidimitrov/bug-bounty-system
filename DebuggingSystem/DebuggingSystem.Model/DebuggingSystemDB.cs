using DebuggingSystem.Model;
using DebuggingSystem.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DebuggingSystem.Models
{
    public class DebuggingSystemDB : DbContext
    {
        public DebuggingSystemDB()
            : base("DefaultConnection")
        {
        }

        public DbSet<UserProfile> UserProfiles { get; set; }
        public DbSet<Project> Projects { get; set; }
        public DbSet<Bug> Bugs { get; set; }
        public DbSet<UserProject> UserProjects { get; set; }    
    }
}
