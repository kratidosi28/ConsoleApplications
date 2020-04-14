using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DoctorsAppointment.Models
{
    class DoctorsSubscription
    {
        [Key]
        public int DoctorSubscriptionId { get; set; }

        [ForeignKey(nameof(AppointmentId))]
        public int AppointmentId { get; set; }

        [ForeignKey(nameof(MedicineId))]
        public int MedicineId { get; set; }
    }
}
