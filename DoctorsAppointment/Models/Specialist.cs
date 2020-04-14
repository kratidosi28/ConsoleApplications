using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace DoctorsAppointment.Models
{
    class Specialist
    {
        [Key]
        public int SpecialistId { get; set; }

        public string SpecialistIn { get; set; }

    }
}
