using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DoctorsAppointment.Models
{
   public class Doctor
    {

        [Key]
        public int DoctorId { get; set; }
        public string DoctorName { get; set; }

        public string Experience { get; set; }
        public int MobileNumber { get; set; }
        public string Email { get; set; }

        public int ConsultancyFees { get; set; }

        public string Address { get; set; }
        

        [ForeignKey(nameof(SpecialistId))]
        public int SpecialistId { get; set; }
    }
}
