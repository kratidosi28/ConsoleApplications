using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace DoctorsAppointment.Models
{
    class Medicines
    {
        [Key]
        public int MedicineId { get; set; }

        public string MedicineName { get; set; }
        
    }
}
