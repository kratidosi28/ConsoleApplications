using System;
using System.Linq;
using ToysManufacturingConsoleApplication.Context;
using ToysManufacturingConsoleApplication.Models;

namespace ToysManufacturingConsoleApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Are You Customer or Admin??");
            Console.WriteLine("1. Customer");
            Console.WriteLine("2. Admin");
            int choice = Convert.ToInt32(Console.ReadLine());
            switch (choice)
            {
                case 1:
                    Console.WriteLine("Welcome to PlayToy App!!");
            
                   

                    Console.WriteLine("What you want?");
                    Console.WriteLine("1. See the List Of Available Toys!!");

                    Console.WriteLine("2. Want to Order Placed?");

                    int select = Convert.ToInt32(Console.ReadLine());

                    switch (select)
                    {
                        case 1:
                           ListOfToys();
                            
                            break;

                        case 2:


                            PlaceOrder();
                            break;
                    }


                    break;
                case 2:
                    Console.WriteLine("Which operation do you want to perform!!");
                    Console.WriteLine("1. Add Company Details!!");
                    Console.WriteLine("2. Delete Company Details!!");
                    Console.WriteLine("3. Update Company Details!!");
                    Console.WriteLine("4. Add Plants Details!!");
                    Console.WriteLine("5. Delete Plants Details!!");
                    Console.WriteLine("6. Update Plants Details!!");
                    Console.WriteLine("7. Add ToysCategory Details!!");
                    Console.WriteLine("8. Delete ToysCategory Details!!");
                    Console.WriteLine("9. Update ToysCategory Details!!");
                    Console.WriteLine("10. Add Toys Details!!");
                    Console.WriteLine("11. Delete Toys Details!!");
                    Console.WriteLine("12. Update Toys  Details!!");

                    int choose = Convert.ToInt32(Console.ReadLine());
                    switch (choose)
                    {
                        case 1:
                            AddCompanyDetails();
                            break;

                        case 2:
                            DeleteCompanyDetails();
                            break;

                        case 3:
                            UpdateCompanyDetails();
                            break;


                        case 4:
                            AddPlantsDetails();
                            break;


                        case 5:
                            DeletePlantsDetails();
                            break;


                        case 6:
                            UpdatePlantsDetails();
                            break;

                       case 7:
                            AddToysDetails();
                            break;

                        case 8:
                            DeleteToysDetails();
                            break;

                        case 9:
                            UpdateToysDetails();
                            break;
                    }


                    break;


            }
        }

        public static void PlaceOrder()
        {
            using (var db = new MasterContext())
            {
                var customer = new Customers();
                {
                    Console.WriteLine("To place Order First Register YourSelf!!");
                    int CustomerId = 0;
                    Console.WriteLine("Enter Customer Name!!");
                    customer.CustomerName = Console.ReadLine();
                    Console.WriteLine("Enter Customer Age!!");
                    customer.CustomerAge = Convert.ToInt32(Console.ReadLine());
                    Console.WriteLine("Enter Customer Gender!!");
                    customer.CustomerGender = Console.ReadLine();
                    Console.WriteLine("Enter Customer MobileNumber!!");
                    customer.CustomerMobileNumber = Console.ReadLine();
                    Console.WriteLine("Enter Customer Email!!");
                    customer.CustomerEmail = Console.ReadLine();


                    db.Customers.Add(customer);
                    db.SaveChanges();
                    CustomerId = customer.CustomerId;
                    Console.WriteLine("You are successfully Registered!!");

                    var address = new CustomerAddresses();
                    {

                        int CustomerAddressId = 0;
                        Console.WriteLine("First Enter your Address in which you want that order!!");

                        Console.WriteLine("Enter your Address");
                        address.CustomerAddress = Console.ReadLine();
                        address.CustomerId = CustomerId;

                        db.CustomerAddresses.Add(address);
                        db.SaveChanges();
                        CustomerAddressId = address.CustomerAddressId;
                        Console.WriteLine("Your Address is successfully added!!");




                        var order = new OrderDetails();
                        {

                            string toyName;
                            int Price = 0;
                            Console.WriteLine("Enter Toy Name!!");
                            toyName = Console.ReadLine();
                            var check = db.Toys.Single(t => t.ToyName == toyName);
                            if (check != null)
                            {
                                order.ToyId = check.ToyId;
                                Price = check.ToyPrice;

                            }
                            Console.WriteLine("Enter Order Number!!");
                            order.OrderNumber = Convert.ToInt32(Console.ReadLine());
                            Console.WriteLine("Enter Order Date!!");
                            order.OrderDate = DateTime.Now;
                            Console.WriteLine("Enter Order Quantity!!");
                            order.OrderQuantity = Convert.ToInt32(Console.ReadLine());

                            order.OrderTotalPrice = order.OrderQuantity * Price;

                            order.CustomerAddressId = CustomerAddressId;



                            db.OrderDetails.Add(order);
                            db.SaveChanges();
                            Console.WriteLine("Your Order is Successfully Ordered!!");
                        }

                    }


                }

            }

        }

        public static void ListOfToys()
        {
            using (var db = new MasterContext())
            {

                var toys = db.vtoys.ToList();

                foreach (var item in toys)
                {
                    Console.WriteLine($"ToyName: {item.ToyName} ToyPrice: {item.ToyPrice} ToyDescription: {item.ToyDescription} ToyBrand: {item.ToyBrand}  ToyCategoryName: {item.ToysCategoryName} PlantName: {item.PlantName}");
                }

            }
        }

        public static void AddCompanyDetails()
        {

            using (var db = new MasterContext())
            {

                var company = new Companies();
                {
                    Console.WriteLine("Enter CompanyName!!");
                    company.CompanyName = Console.ReadLine();
                    Console.WriteLine("Enter CompanyLocation!!");
                    company.CompanyLocation = Console.ReadLine();
                    Console.WriteLine("Enter CompanyEmailId!!");
                    company.CompanyEmailId = Console.ReadLine();
                    var check = db.Companies.Where(t => t.CompanyName == company.CompanyName);
                    if (check != null)
                    {

                        Console.WriteLine("Company Name is Existing");
                    }
                    else
                    {
                        db.Companies.Add(company);
                        db.SaveChanges();
                        Console.WriteLine("Company Information is added Successfully!!");
                    }
                }

            }
        }

        public static void UpdateCompanyDetails()
        {

            using (var db = new MasterContext())
            {
                Companies company = new Companies();
                Console.WriteLine("Enter the Company Name which you want to update");
                company.CompanyName = Console.ReadLine();

                Companies c = db.Companies.Single(t => t.CompanyName == company.CompanyName);
                if (c != null)
                {
                    Console.WriteLine("Enter the Company Name which you want");
                    c.CompanyName = Console.ReadLine();
                    db.SaveChanges();
                    Console.WriteLine("Company Name is Modified");
                }
                else
                {
                    Console.WriteLine("You enter Wrong Company Name");
                }



            }
        }


        public static void DeleteCompanyDetails()
        {
            using (var db = new MasterContext())
            {

                var company = new Companies();
                {


                    Console.WriteLine("Enter Company Name");
                    company.CompanyName = Console.ReadLine();
                    var check = db.Companies.Where(t => t.CompanyName == company.CompanyName);
                    if (check != null)
                    {
                        db.Companies.Remove(company);
                        db.SaveChanges();
                        Console.WriteLine("Company Information is successfully Deleted!!");
                    }
                    else
                    {
                        Console.WriteLine("No this Company is Existing of this Id!!");
                    }

                }

            }
        }

        public static void AddPlantsDetails()
        {

            using (var db = new MasterContext())
            {

                var plant = new Plants();
                {
                    Console.WriteLine("Enter PlantName!!");
                    plant.PlantName = Console.ReadLine();
                    Console.WriteLine("Enter PlantLocation!!");
                    plant.PlantLocation= Console.ReadLine();
                    Console.WriteLine("Enter CompanyId!!");
                    plant.CompanyId =Convert.ToInt32( Console.ReadLine());
                    var check = db.Plants.Where(t => t.PlantName == plant.PlantName);
                    if (check != null)
                    {

                        Console.WriteLine("Plant Name is Existing");
                    }
                    else
                    {
                        db.Plants.Add(plant);
                        db.SaveChanges();
                        Console.WriteLine("Plants Information is added Successfully!!");
                    }
                }

            }
        }

        public static void UpdatePlantsDetails()
        {

            using (var db = new MasterContext())
            {
                Plants plant = new Plants();
                Console.WriteLine("Enter the Plants Name which you want to update");
                plant.PlantName = Console.ReadLine();

                Plants p = db.Plants.Single(t => t.PlantName == plant.PlantName);
                if (p != null)
                {
                    Console.WriteLine("Enter the Plant Name which you want");
                    p.PlantName = Console.ReadLine();
                    db.SaveChanges();
                    Console.WriteLine("Plant Name is Modified");
                }
                else
                {
                    Console.WriteLine("You enter Wrong Plant Name");
                }



            }
        }


        public static void DeletePlantsDetails()
        {
            using (var db = new MasterContext())
            {

                var plant = new Plants();
                {


                    Console.WriteLine("Enter Plant Name");
                    plant.PlantName = Console.ReadLine();
                    var check = db.Plants.Where(t => t.PlantName == plant.PlantName);
                    if (check != null)
                    {
                        db.Plants.Remove(plant);
                        db.SaveChanges();
                        Console.WriteLine("Plant Information is successfully Deleted!!");
                    }
                    else
                    {
                        Console.WriteLine("No this Plants is Existing of this Id!!");
                    }

                }

            }
        }

        public static void AddToysDetails()
        {

            using (var db = new MasterContext())
            {

                var toy = new Toys();
                {
                    Console.WriteLine("Enter ToyName!!");
                    toy.ToyName = Console.ReadLine();
                    Console.WriteLine("Enter ToyDescription!!");
                    toy.ToyDescription = Console.ReadLine();
                    Console.WriteLine("Enter ToyPrice!!");
                    toy.ToyPrice =Convert.ToInt32( Console.ReadLine());
                    Console.WriteLine("Enter ToyBrand!!");
                    toy.ToyBrand = Console.ReadLine();
                    Console.WriteLine("Enter ToysCategoryId!!");
                    toy.ToysCategoryId = Convert.ToInt32(Console.ReadLine());
                    Console.WriteLine("Enter PlantsId!!");
                    toy.PlantId = Convert.ToInt32(Console.ReadLine());
                    var check = db.Toys.Where(t => t.ToyName == toy.ToyName);
                    if (check != null)
                    {

                        Console.WriteLine("Toy Name is Existing");
                    }
                    else
                    {
                        db.Toys.Add(toy);
                        db.SaveChanges();
                        Console.WriteLine("Toys Information is added Successfully!!");
                    }
                }

            }
        }

        public static void UpdateToysDetails()
        {

            using (var db = new MasterContext())
            {
                Toys toy = new Toys();
                Console.WriteLine("Enter the Toy Name which you want to update");
                toy.ToyName = Console.ReadLine();

                Toys t = db.Toys.Single(t => t.ToyName == toy.ToyName);
                if (t != null)
                {
                    Console.WriteLine("Enter the Toy Name which you want");
                    t.ToyName = Console.ReadLine();
                    db.SaveChanges();
                    Console.WriteLine("Toy Name is Modified");
                }
                else
                {
                    Console.WriteLine("You enter Wrong Toy Name");
                }



            }
        }


        public static void DeleteToysDetails()
        {
            using (var db = new MasterContext())
            {

                var toy = new Toys();
                {


                    Console.WriteLine("Enter Toy Name");
                    toy.ToyName = Console.ReadLine();
                    var check = db.Toys.Where(t => t.ToyName == toy.ToyName);

                    if (check != null)
                    {
                        db.Toys.Remove(toy);
                        db.SaveChanges();
                        Console.WriteLine("Toy Information is successfully Deleted!!");
                    }
                    else
                    {
                        Console.WriteLine("No this Plants is Existing of this Id!!");
                    }

                }

            }
        }



    }

}

