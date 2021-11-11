using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results;
using DataAccess.Abstract;
using Entities.Concrete;
using Entities.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class OrderManager : IOrderService
    {
        IOrderDal _orderDal;

        public OrderManager(IOrderDal orderDal)
        {
            _orderDal = orderDal;
        }
        
        public IResult Add(Order order)
        {
            int id= _orderDal.AddOrder(order);
            return new SuccessResult(Messages.OrderId+" "+ id.ToString());
        }

        public IResult ChangeStatus(OrderStatusDto orderStatusDto)
        {
            _orderDal.ChangeStatus(orderStatusDto);
            return new SuccessResult();
        }

        public IResult Delete(int id)
        {
            _orderDal.DeleteOrder(id);
            return new SuccessResult();
        }

        public IDataResult<List<Order>> fetchCustomersOrders(int customerId)
        {
            return new SuccessDataResult<List<Order>>(_orderDal.GetAll(o=> o.CustomerId==customerId));
        }

        public IDataResult<List<Order>> GetAll()
        {
            return new SuccessDataResult<List<Order>>(_orderDal.GetAll());
        }

        public IDataResult<Order> GetById(int orderId)
        {
            return new SuccessDataResult<Order>(_orderDal.Get(o => o.Id== orderId));
        }

        public IDataResult<List<OrderDetailsDto>> GetOrderDeatils()
        {
            return new SuccessDataResult<List<OrderDetailsDto>>(_orderDal.GetOrderDeatils());
        }

        public IResult Update(Order order)
        {
            _orderDal.Update(order);
            return new SuccessResult();
        }
    }
}
