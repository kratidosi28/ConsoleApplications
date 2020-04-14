using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CompanyConsoleApplication.Model
{
    class Employee
    {
        [Key]
        public int EmployeeId { get; set; }

        public string EmployeeName { get; set; }

        public int EmployeeAge { get; set; }

        public int EmployeeSalary { get; set; }

        public string EmployeeAddress { get; set; }

        public string EmployeeDesignation { get; set; }

        [ForeignKey(nameof(DepartmentId))]
        public int DepartmentId { get; set; }
    }
}
