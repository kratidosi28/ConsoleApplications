using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CompanyConsoleApplication.Model
{
    class vAssignProjects
    {
        [Key]
        public int AssignProjectId { get; set; }

        public string ProjectRole { get; set; }

        public string ProjectTitle { get; set; }

        public string EmployeeName { get; set; }

        [ForeignKey(nameof(ProjectId))]
        public int ProjectId { get; set; }

      

    }
}
