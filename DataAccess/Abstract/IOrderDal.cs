using Core.DataAccess;
using Entities.Concrete;
using Entities.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Abstract
{
    public interface IOrderDal: IEntityRepository<Order>
    {
        public void ChangeStatus(OrderStatusDto orderStatusDto);
        public int AddOrder(Order order);
        public void DeleteOrder(int id);

        List<OrderDetailsDto> GetOrderDeatils();
    }
}
