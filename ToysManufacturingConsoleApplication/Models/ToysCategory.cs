using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace ToysManufacturingConsoleApplication.Models
{
    class ToysCategory
    {
        [Key]
        public int ToysCategoryId { get; set; }

        public string ToysCategoryName { get; set; }
    }
}
