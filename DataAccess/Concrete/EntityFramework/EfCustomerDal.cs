using Core.DataAccess.EntityFramework;
using DataAccess.Abstract;
using Entities.Concrete;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfCustomerDal : EfEntityRepositoryBase<Customer, OrderApplicationContext>, ICustomerDal
    {
        public int AddCustomer(Customer customer)
        {
            using (var context = new OrderApplicationContext())
            {
                var addedEntity = context.Entry(customer);
                addedEntity.State = EntityState.Added;
                context.SaveChanges();
                return customer.Id;
            }
        }

        public void DeleteCustomer(int id)
        {
            {
                using (var context = new OrderApplicationContext())
                {
                    Customer customer = new Customer() { Id = id };
                    context.Customers.Attach(customer);
                    context.Customers.Remove(customer);
                    context.SaveChanges();
                }
            }
        }

    }
}
