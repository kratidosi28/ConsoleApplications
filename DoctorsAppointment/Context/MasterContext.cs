using System;
using System.Collections.Generic;
using System.Text;
using DoctorsAppointment.Models;
using Microsoft.EntityFrameworkCore;

namespace DoctorsAppointment.Context
{
    class MasterContext: DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-VF2DC0P;initial catalog=ConsoleApplication2Db;Integrated Security=True;MultipleActiveResultSets=True;App=EntityFramework");
        }

        public DbSet<Doctor> doctors { get; set; }
        public DbSet<Patient> patients { get; set; }
        public DbSet<Appointments> appointments { get; set; }
        public DbSet<Specialist> specialists { get; set; }

        public DbSet<Medicines> medicines { get; set; }

        public DbSet<DoctorsSubscription> subscriptions { get; set; }

        public DbSet<vDoctors> vdoctors { get; set; }

        public DbSet<vsubscription> vsubscriptions { get; set; }
      
    }
}
