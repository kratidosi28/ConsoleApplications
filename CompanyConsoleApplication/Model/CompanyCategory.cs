using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CompanyConsoleApplication.Model
{
    class CompanyCategory
    {
        [Key]
        public int CompanyCategoryId { get; set; }

        public string CompanyCategoryName { get; set; }
    }
}
