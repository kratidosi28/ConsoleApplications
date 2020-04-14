using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace ToysManufacturingConsoleApplication.Models
{
    class Companies
    {

        [Key]
        public int CompanyId { get; set; }

        public string CompanyName { get; set; }

        public string CompanyEmailId { get; set; }

        public string CompanyLocation { get; set; }
    }
}
