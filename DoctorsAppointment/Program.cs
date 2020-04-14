using System;
using System.Collections.Generic;
using System.Linq;
using DoctorsAppointment.Context;
using DoctorsAppointment.Models;

namespace DoctorsAppointment
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Are You User or Admin??");
            Console.WriteLine("1. User");
            Console.WriteLine("2. Admin");
            int choice = Convert.ToInt32(Console.ReadLine());
            switch (choice)
            {
                case 1:
                    Console.WriteLine("Welcome to Healthcare!!");
                    Console.WriteLine("1. Check Available Doctors with their Information");
                    Console.WriteLine("2. Book an Appointment");
                    Console.WriteLine("3. Check your Doctor Subscription");
                    int selected = Convert.ToInt32(Console.ReadLine());
                    switch (selected)
                    {
                        case 1:
                            Console.WriteLine("List of the Available Doctors are given below!!");
                            ListOfDoctors();
                            break;


                        case 2:
                            Console.WriteLine("Enter Patient Details!!");
                            AddPatientDetails();
                            Console.WriteLine("Enter the Appointment Details");
                            BookAppointment();
                            break;


                        case 3:
                            checkDoctorSubscription();
                            break;
                    }
                  
                    break;

                case 2:
                    Console.WriteLine("1. Add an Doctors Details");
                    Console.WriteLine("2. Delete an Doctors Details");
              
                  

                    Console.WriteLine("3. Add an Medicines");
                    Console.WriteLine("4. Delete an Medicines");

                    Console.WriteLine("5. Add an Specialist");
                    Console.WriteLine("6. Delete an Specialist");
                    Console.WriteLine("7. Update an Medicine");

                    int select = Convert.ToInt32(Console.ReadLine());

                    switch (select)
                    {
                        case 1:
                            AddDoctor();
                            break;

                        case 2:
                            DeleteDoctor();
                            break;

                        case 3:
                            UpdateDoctorDetails();
                            break;

                        case 4:
                            AddMedicine();
                          
                            break;

                        case 5:
                            DeleteMedicine();
                           
                            break;

                        case 6:
                            UpdateMedicine();
                         
                            break;

                        case 7:
                            AddSpecialist();
                           
                            break;


                        case 8:
                            DeleteSpecialist();
                            break;

                        case 9:
                            UpdateSpecialist();
                            break;
                    }


                    break;
            }

        }


        public static void ListOfDoctors()
        {
            using (var db = new MasterContext())
            {

                var Doctors = db.vdoctors;
                foreach (var doctor in Doctors)
                {
                    Console.WriteLine(doctor);
                }
            }
        }

        public static void AddPatientDetails()
        {
            using (var db = new MasterContext())
            {
                var patient = new Patient();
                {
                    Console.WriteLine("Enter Patient Name");
                    patient.PatientName = Console.ReadLine();
                    Console.WriteLine("Enter Patient Age");
                    patient.PatientAge = Convert.ToInt32(Console.ReadLine());
                    Console.WriteLine("Enter Patient Gender");
                    patient.PatientGender = Console.ReadLine();
                    Console.WriteLine("Enter the Disease From which Patient Suffering");
                    patient.PatientDisease = Console.ReadLine();
                   
                  
                    
                        db.patients.Add(patient);
                        db.SaveChanges();
                        Console.WriteLine("Patient Details is  Successfully added!!");
                    }


                }

            }
               
        
        public static void BookAppointment()
        {
            using (var db = new MasterContext())
            {
                var appointment = new Appointments();
                {
                    Console.WriteLine("Enter Appointment Date");
                    appointment.AppointmentDate = Convert.ToDateTime(Console.ReadLine());
                    Console.WriteLine("Enter Appointment Time");
                    appointment.AppointmentTime =Console.ReadLine();
                   



                    db.appointments.Add(appointment);
                    db.SaveChanges();
                    Console.WriteLine("Your Appointment is successfully Booked!!");
                }


            }

        }

        public static void checkDoctorSubscription()
        {
            using (var db = new MasterContext())
            {
                var subscription = new DoctorsSubscription();
                {
                    Console.WriteLine("Enter your Appointment Id");
                    subscription.AppointmentId =Convert.ToInt32(Console.ReadLine());
                    var check = db.subscriptions.Single(t => t.AppointmentId == subscription.AppointmentId);
                    if(check != null)
                    {
                        var s = db.vsubscriptions;
                        foreach (var doctorsubscription in s)
                        {
                            Console.WriteLine(doctorsubscription);
                        }
                    }
                    else
                    {
                        Console.WriteLine("you enter wrong Appointment Id");
                    }

                }
            }
        }
        

        public static void AddDoctor()
        {
            using (var db = new MasterContext())
            {
                var doctor = new Doctor();
                {
                    Console.WriteLine("Enter Doctor Name");
                    doctor.DoctorName = Console.ReadLine();
                Console.WriteLine("Enter Doctor Experience");
                    doctor.Experience = Console.ReadLine();
                Console.WriteLine("Enter DoctorMobileNumber");
                    doctor.MobileNumber = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter Doctor Email");
                    doctor.Email = Console.ReadLine();
                Console.WriteLine("Enter SpecialistId");
                    doctor.SpecialistId = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter Doctor ConsultancyFees");
                doctor.ConsultancyFees = Convert.ToInt32(Console.ReadLine());


                Console.WriteLine("Enter Doctor Address");
                    doctor.Address = Console.ReadLine();

                    var check = db.doctors.Where(t => t.DoctorName == doctor.DoctorName && t.SpecialistId == doctor.SpecialistId);
                    if(check != null)
                    {
                        Console.WriteLine("Doctor is Exist");
                    }
                    else
                    {
                        db.doctors.Add(doctor);
                        db.SaveChanges();
                        Console.WriteLine("Doctor details is added!!");
                    }

            }
            }
        }

        public static void DeleteDoctor()
        {

            using (var db = new MasterContext())
            {

                var doctor = new Doctor();
                {


                    Console.WriteLine("Enter Doctor Id");
                    doctor.DoctorId = Convert.ToInt32(Console.ReadLine());
                    var check = db.doctors.Where(t => t.DoctorId == doctor.DoctorId);
                    if (check != null)
                    {
                        db.doctors.Remove(doctor);
                        db.SaveChanges();
                        Console.WriteLine("Doctors Details is successfully Deleted!!");
                    }
                    else
                    {
                        Console.WriteLine("No Doctor is Existing of this Id!!");
                    }

                }

            }
        }


        public static void UpdateDoctorDetails()
        {
           

                using (var db = new MasterContext())
                {
                Doctor doctor = new Doctor();
                    Console.WriteLine("Enter the Doctor Name which you want to update");
                   doctor.DoctorName = Console.ReadLine();

                    Doctor d = db.doctors.Single(t => t.DoctorName == doctor.DoctorName);
                    if (d != null)
                    {
                        Console.WriteLine("Enter the Doctor Name which you want");
                        d.DoctorName = Console.ReadLine();
                        db.SaveChanges();
                        Console.WriteLine("Doctor Name is Modified");
                    }
                    else
                    {
                        Console.WriteLine("You enter Wrong Doctor Name which you want to update");
                    }



                }
            }
        
        public static void AddMedicine()
        {

            using (var db = new MasterContext())
            {

                var medicine = new Medicines();
                {
                    Console.WriteLine("Enter MedicineName");
                    medicine.MedicineName = Console.ReadLine();
                    var check = db.medicines.Where(t => t.MedicineName == medicine.MedicineName);
                    if (check != null)
                    {

                        Console.WriteLine("Medicine is Existing");
                    }
                    else
                    {
                        db.medicines.Add(medicine);
                        db.SaveChanges();
                        Console.WriteLine("Medicine is added Successfully!!");
                    }
                }

            }
        }

        public static void UpdateMedicine()
        {

            using (var db = new MasterContext())
            {
                Medicines medicine = new Medicines();
                Console.WriteLine("Enter the Medicine Name which you want to update");
                medicine.MedicineName = Console.ReadLine();
          
                    Medicines m = db.medicines.Single(t => t.MedicineName == medicine.MedicineName);
                if (m != null)
                {
                    Console.WriteLine("Enter the Medicine Name which you want");
                    m.MedicineName = Console.ReadLine();
                    db.SaveChanges();
                    Console.WriteLine("Medicine Name is Modified");
                }
                else
                {
                    Console.WriteLine("You enter Wrong Medicine Name");
                }
              


            }
        }


                public static void DeleteMedicine()
        {
            using (var db = new MasterContext())
            {

                var medicine = new Medicines();
                {


                    Console.WriteLine("Enter Medicine Name");
                    medicine.MedicineName = Console.ReadLine();
                    var check = db.medicines.Where(t => t.MedicineName == medicine.MedicineName);
                    if (check != null)
                    {
                        db.medicines.Remove(medicine);
                        db.SaveChanges();
                        Console.WriteLine("Medicine is successfully Deleted!!");
                    }
                    else
                    {
                        Console.WriteLine("No Medicine is Existing of this Id!!");
                    }

                }

            }
        }



        public static void AddSpecialist()
        {

            using (var db = new MasterContext())
            {

                var specialist = new Specialist();
                {
                    Console.WriteLine("Enter SpecialistIn");
                    specialist.SpecialistIn = Console.ReadLine();
                    var check = db.specialists.Where(t => t.SpecialistIn == specialist.SpecialistIn);
                    if (check != null)
                    {

                        Console.WriteLine(" This Specialist is Existing!!");
                    }
                    else
                    {
                        db.specialists.Add(specialist);
                        db.SaveChanges();
                        Console.WriteLine("New Specialist is added Successfully!!");
                    }
                }

            }
        }




        public static void DeleteSpecialist()
        {
            using (var db = new MasterContext())
            {

                var specialist = new Specialist();
                {


                    Console.WriteLine("Enter Medicine Name");
                    specialist.SpecialistIn = Console.ReadLine();
                    var check = db.specialists.Where(t => t.SpecialistIn == specialist.SpecialistIn);
                    if (check != null)
                    {
                        db.specialists.Remove(specialist);
                        db.SaveChanges();
                        Console.WriteLine("Specialist Category is successfully Deleted!!");
                    }
                    else
                    {
                        Console.WriteLine("No Spcialist is Existing Before of this category!!");
                    }

                }

            }
        }

        public static void UpdateSpecialist()
        {

            using (var db = new MasterContext())
            {
                Specialist specialist = new Specialist();
                Console.WriteLine("Enter the Specialist Category which you want to update");
                specialist.SpecialistIn = Console.ReadLine();

                Specialist s = db.specialists.Single(t => t.SpecialistIn == specialist.SpecialistIn);
                if (s != null)
                {
                    Console.WriteLine("Enter the Specialist Category that you want");

                    s.SpecialistIn = Console.ReadLine();
                    db.SaveChanges();
                    Console.WriteLine("SpecialistIn is Modified");
                }
                else
                {
                    Console.WriteLine("You enter Wrong SpecialistIn which you want to update");
                }



            }
        }

        public static  void SavedDatabaseOperations()
        {
            using (var db = new MasterContext())
            {

                var medicine = new List<Medicines>
                {
                    new Medicines{ MedicineName = "IT"},new Medicines{MedicineName= "HR" },new Medicines{MedicineName = "Marketing" }
                };

                db.medicines.AddRange(medicine);

               

                db.SaveChanges();
            }
        }
    }
}
