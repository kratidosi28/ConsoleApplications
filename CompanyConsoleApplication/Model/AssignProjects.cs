using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CompanyConsoleApplication.Model
{
    class AssignProjects
    {
        [Key]
        public int AssignProjectId { get; set; }

        public string ProjectRole { get; set; }

        [ForeignKey(nameof(EmployeeId))]
        public int EmployeeId { get; set; }

        [ForeignKey(nameof(ProjectId))]
        public int ProjectId { get; set; }

    }
}
