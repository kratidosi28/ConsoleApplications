using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ToysManufacturingConsoleApplication.Models
{
    class CustomerAddresses
    {
        [Key]
        public int CustomerAddressId { get; set; }

        public string CustomerAddress { get; set; }


        [ForeignKey(nameof(CustomerId))]
        public int CustomerId { get; set; }

    }
}
