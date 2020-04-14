using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ToysManufacturingConsoleApplication.Models
{
    class OrderDetails
    {
        [Key]
        public int OrderId { get; set; }

        public int OrderNumber { get; set; }

        public DateTime OrderDate { get; set; }

        public int OrderQuantity { get; set; }

        public int OrderTotalPrice { get; set; }

        [ForeignKey(nameof(CustomerAddressId))]
        public int CustomerAddressId { get; set; }

        [ForeignKey(nameof(ToyId))]
        public int ToyId { get; set; }
    }
}
