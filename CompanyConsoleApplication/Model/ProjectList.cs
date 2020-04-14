using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CompanyConsoleApplication.Model
{
    class ProjectList
    {
        [Key]
        public int ProjectId { get; set; }

        public string ProjectTitle { get; set; }

        public string ProjectDefinition { get; set; }
    }
}
