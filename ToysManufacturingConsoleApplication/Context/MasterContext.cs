using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using ToysManufacturingConsoleApplication.Models;

namespace ToysManufacturingConsoleApplication.Context
{
    class MasterContext: DbContext
    {


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-VF2DC0P;initial catalog=ConsoleApplication3Db;Integrated Security=True;MultipleActiveResultSets=True;App=EntityFramework");
        }

        public DbSet<ToysCategory> ToysCategory { get; set; }
        public DbSet<Toys> Toys { get; set; }
        public DbSet<Companies> Companies { get; set; }
        public DbSet<Plants> Plants { get; set; }

        public DbSet<Customers> Customers { get; set; }

        public DbSet<CustomerAddresses> CustomerAddresses { get; set; }

        public DbSet<OrderDetails> OrderDetails { get; set; }

        public DbSet<vToys> vtoys { get; set; }

      

    }
}
