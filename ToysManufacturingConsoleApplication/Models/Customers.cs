using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace ToysManufacturingConsoleApplication.Models
{
    class Customers
    {

        [Key]
        public int CustomerId { get; set; }

        public string CustomerName { get; set; }

        public string CustomerMobileNumber { get; set; }

        public string CustomerEmail { get; set; }

        public string CustomerGender { get; set; }

        public int CustomerAge { get; set; }
    }
}
