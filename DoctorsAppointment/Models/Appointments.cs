using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DoctorsAppointment.Models
{
    class Appointments
    {
        [Key]
        public int AppointmentId { get; set; }

        public DateTime AppointmentDate { get; set; }

        public string AppointmentTime { get; set; }

      
        [ForeignKey(nameof(DoctorId))]
        public int DoctorId { get; set; }

        [ForeignKey(nameof(PatientId))]
        public int PatientId { get; set; }
    }
}
