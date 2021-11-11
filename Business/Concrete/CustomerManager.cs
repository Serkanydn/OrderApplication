using Business.Abstract;
using Business.Constants;
using Business.ValidationRules.FluentValidation;
using Core.CrossCuttingConcerns.Validation.ValidationTool;
using Core.Utilities.Results;
using DataAccess.Abstract;
using Entities.Concrete;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class CustomerManager : ICustomerService
    {
        ICustomerDal _customerDal;

        public CustomerManager(ICustomerDal customerDal)
        {
            _customerDal = customerDal;
        }
        public IResult Add(Customer customer)
        {
 
            ValidationTool.Validate(new CustomerValidator(), customer);
      
            int id= _customerDal.AddCustomer(customer);
            return new SuccessResult(Messages.CustomerId+" " +id.ToString());
        }

        public IResult Delete(int id)
        {
            _customerDal.DeleteCustomer(id);
            return new SuccessResult();
        }

        public IDataResult<List<Customer>> GetAll()
        {
            return new SuccessDataResult<List<Customer>>(_customerDal.GetAll());
        }

        public IDataResult<Customer> GetById(int customerId)
        {
            return new SuccessDataResult<Customer>(_customerDal.Get(c=>c.Id==customerId));
        }

        public IResult Update(Customer customer)
        {
            ValidationTool.Validate(new CustomerValidator(), customer);

            _customerDal.Update(customer);
            return new SuccessResult();
        }
    }
}
