using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace DoctorsAppointment.Models
{
    class vDoctors
    {

        [Key]
        public int DoctorId { get; set; }
        public string DoctorName { get; set; }

        public int Experience { get; set; }

        public int MobileNumber { get; set; }

        public string Email { get; set; }

        public int ConsultancyFees { get; set; }

        public string Address { get; set; }

        public string SpecialistIn { get; set; }
    }
}
