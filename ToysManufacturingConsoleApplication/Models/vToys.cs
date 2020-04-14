using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace ToysManufacturingConsoleApplication.Models
{
    class vToys
    {

        [Key]
        public int ToysCategoryId { get; set; }

        public int PlantId { get; set; }
        public string ToyName { get; set; }

        public int ToyPrice { get; set; }

        public string ToyDescription { get; set; }

        public string ToyBrand { get; set; }


        public string ToysCategoryName { get; set; }
        public string PlantName { get; set; }
    }
}
