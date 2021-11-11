using Entities.Concrete;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.ValidationRules.FluentValidation
{
    public class CustomerValidator : AbstractValidator<Customer>
    {
        public CustomerValidator()
        {
            RuleFor(c => c.Name).NotEmpty().WithMessage("Name cannot be empty");
            RuleFor(c => c.Email).NotEmpty().WithMessage("Email cannot be empty");
            RuleFor(c => c.UpdateAt).NotEmpty().WithMessage("Update at cannot be empty");
            RuleFor(c => c.CreateAt).NotEmpty().WithMessage("Create at cannot be empty");
        }
    }
}
