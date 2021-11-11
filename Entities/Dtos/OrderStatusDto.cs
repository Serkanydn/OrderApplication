using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Dtos
{
    public class OrderStatusDto
    {
        public int OrderId { get; set; }
        public string Status { get; set; }
        public DateTime UpdateAt { get; set; }
    }
}
