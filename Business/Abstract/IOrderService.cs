using Core.Utilities.Results;
using Entities.Concrete;
using Entities.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Abstract
{
    public interface IOrderService
    {
        IResult Add(Order order);
        IResult Update(Order order);
        IResult Delete(int id);
        IResult ChangeStatus(OrderStatusDto orderStatusDto);

        IDataResult<List<Order>> GetAll();
        IDataResult<Order> GetById(int orderId);

        IDataResult<List<Order>> fetchCustomersOrders(int customerId);
        public IDataResult<List<OrderDetailsDto>> GetOrderDeatils();
    }
}
