using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CompanyConsoleApplication.Model
{
    class CompanyDepartments
    {
        [Key]
        public int DepartmentId { get; set; }

        public string DepartmentName { get; set; }

        [ForeignKey(nameof(CompanyId))]
        public int CompanyId { get; set; }
    }
}
