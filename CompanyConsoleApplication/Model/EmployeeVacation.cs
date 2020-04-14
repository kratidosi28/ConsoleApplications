using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CompanyConsoleApplication.Model
{
    class EmployeeVacation
    {
        [Key]
        public int EmployeeVacationId { get; set; }

        public int VacationDays { get; set; }

        [ForeignKey(nameof(EmployeeId))]
        public int EmployeeId { get; set; }
    }
}
