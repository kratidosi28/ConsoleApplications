using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ToysManufacturingConsoleApplication.Models
{
    class Plants
    {
        [Key]
        public int PlantId { get; set; }

        public string PlantName { get; set; }

        public string PlantLocation { get; set; }

        [ForeignKey(nameof(CompanyId))]
        public int CompanyId { get; set; }

    }


}