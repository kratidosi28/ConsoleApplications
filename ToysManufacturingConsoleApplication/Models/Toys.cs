using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ToysManufacturingConsoleApplication.Models
{
    class Toys
    {

        [Key]
        public int ToyId { get; set; }

        public string ToyName { get; set; }

        public int ToyPrice { get; set; }

        public string ToyDescription { get; set; }

        public string ToyBrand { get; set; }

        [ForeignKey(nameof(ToysCategoryId))]
        public int ToysCategoryId { get; set; }

        [ForeignKey(nameof(PlantId))]
        public int PlantId { get; set; }
    }
}
