using Core.DataAccess.EntityFramework;
using DataAccess.Abstract;
using Entities.Concrete;
using Entities.Dtos;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfOrderDal : EfEntityRepositoryBase<Order, OrderApplicationContext>, IOrderDal
    {
        public int AddOrder(Order order)
        {
            using (var context = new OrderApplicationContext())
            {
                var addedEntity = context.Entry(order);
                addedEntity.State = EntityState.Added;
                context.SaveChanges();
                return order.Id;
            }
        }

        public void ChangeStatus(OrderStatusDto orderStatusDto)
        {
            using (var context = new OrderApplicationContext())
            {
                Order order = new Order() { Id = orderStatusDto.OrderId, Status = orderStatusDto.Status, UpdateAt = orderStatusDto.UpdateAt };
                context.Orders.Attach(order);
                context.Entry(order).Property(o => o.Status).IsModified = true;
                context.Entry(order).Property(o => o.UpdateAt).IsModified = true;
                context.SaveChanges();
            }
        }

        public void DeleteOrder(int id)
        {
            {
                using (var context = new OrderApplicationContext())
                {
                    Order order = new Order() { Id = id };
                    context.Orders.Attach(order);
                    context.Orders.Remove(order);
                    context.SaveChanges();
                }
            }
        }

        public List<OrderDetailsDto> GetOrderDeatils()
        {
            using (var context = new OrderApplicationContext())
            {
                var results = from o in context.Orders
                              join c in context.Customers
                              on o.CustomerId equals c.Id
                              join ad in context.Addresses
                              on o.CustomerId equals ad.CustomerId
                              join p in context.Products
                              on o.ProductId equals p.Id
                              select new OrderDetailsDto
                              {
                                  OrderId=o.Id,
                                  CustomerEmail=c.Email,
                                  CustomerName=c.Name,
                                  ProductName=p.Name,
                                  ProductImageUrl=p.ImageUrl,
                                  CreateAt=o.CreateAt,
                                  Quantity=o.Quantity,
                                  Price=o.Price,
                                  Status=o.Status,
                                  AddressLine=ad.AddressLine,
                                  City=ad.City,
                                  CityCode=ad.CityCode,
                                  Country=ad.Country
                              };
                return results.ToList();
            }
        }
    }
}
