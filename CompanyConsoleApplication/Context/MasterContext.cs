using System;
using System.Collections.Generic;
using System.Text;
using CompanyConsoleApplication.Model;
using Microsoft.EntityFrameworkCore;

namespace CompanyConsoleApplication.Context
{
    class MasterContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-VF2DC0P;initial catalog=Company;Integrated Security=True;MultipleActiveResultSets=True;App=EntityFramework");
        }

        public DbSet<Employee> Employee { get; set; }
        public DbSet<ProjectList> ProjectList { get; set; }
        public DbSet<Company> Company { get; set; }
        public DbSet<CompanyCategory> CompanyCategory { get; set; }

        public DbSet<CompanyDepartments> CompanyDepartments { get; set; }

        public DbSet<EmployeeVacation> EmployeeVacation { get; set; }

        public DbSet<AssignProjects> AssignProjects { get; set; }

        public DbSet<vAssignProjects> vAssignProjects { get; set; }

        public DbSet<vEmpOnVacations> vEmpOnVacations { get; set; }

    }
}
