using Business.Concrete;
using Core.Utilities.Results;
using DataAccess.Concrete.EntityFramework;
using Entities.Concrete;
using System;
using Xunit;

namespace UnitTesting
{
    public class CustomerTest
    {
        
        CustomerManager customerManager = new CustomerManager(new EfCustomerDal());
        [Fact]

        public void TestCustomerAdd()
        {
           
            Customer customer = new Customer
            {
                Name="",
                Email="Aydýn",  
                CreateAt=DateTime.Now,
                UpdateAt=DateTime.Now,
                
            };

            IResult result= customerManager.Add(customer);
            Assert.True(result.Success);
        }


    }
}
