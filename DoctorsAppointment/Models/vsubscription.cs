using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DoctorsAppointment.Models
{
    class vsubscription
    {

        [Key]
        public int DoctorSubscriptionId { get; set; }

        public string DoctorName { get; set; }

        public string MedicineName { get; set; }

        public string PatientName { get; set; }

        [ForeignKey(nameof(AppointmentId))]
        public int AppointmentId { get; set; }
    
}
}
