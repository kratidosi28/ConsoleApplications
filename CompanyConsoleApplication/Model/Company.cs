using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CompanyConsoleApplication.Model
{
    class Company
    {
        [Key]
        public int CompanyId { get; set; }

        public string CompanyName { get; set; }

        public string CompanyLocation { get; set; }

        [ForeignKey(nameof(CompanyCategoryId))]
        public int CompanyCategoryId { get; set; }
    }
}
