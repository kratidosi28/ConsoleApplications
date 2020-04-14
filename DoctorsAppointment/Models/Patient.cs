using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace DoctorsAppointment.Models
{
    class Patient
    {
        [Key]
        public int PatientId { get; set; }

        public string PatientName { get; set; }

        public int PatientAge { get; set; }

        public string PatientGender { get; set; }

        public string PatientDisease { get; set; }
    }
}
