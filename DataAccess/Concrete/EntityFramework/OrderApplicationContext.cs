using Entities.Concrete;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete.EntityFramework
{
    public class OrderApplicationContext:DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //Database connection 
            optionsBuilder.UseSqlServer(@"Server=DESKTOP-4S5C89R;Database=OrderApplication;Trusted_Connection=True");
        }

        public DbSet<Customer> Customers { get; set; }
        public DbSet<Order> Orders{ get; set; }
        public DbSet<Address> Addresses{ get; set; }
        public DbSet<Product> Products{ get; set; }
    }
}
