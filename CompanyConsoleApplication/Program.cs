using System;
using System.Linq;
using CompanyConsoleApplication.Context;
using CompanyConsoleApplication.Model;

namespace CompanyConsoleApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to this Application!!");
            Console.WriteLine("Are you Manager or TeamMember!!");
            Console.WriteLine("1. Manager!!");
            Console.WriteLine("2. TeamMember!!");
            int choice = Convert.ToInt32(Console.ReadLine());
            switch (choice)
            {
                case 1:
                    Console.WriteLine("1. Want to Check How many Employees in which Department");
                    Console.WriteLine("2. Want to Check which Employee work in which Project");
                    Console.WriteLine("3. Which Employee take vacation and for how many days?");
                    int choose = Convert.ToInt32(Console.ReadLine());
                    switch (choose)
                    {
                        case 1:
                            GetEmployee();
                            break;

                        case 2:
                            ViewAssignProjects();
                            break;

                        case 3:
                            checkVacationList();
                            break;
                    }
                    break;

                case 2:
                    Console.WriteLine("Choose Which Operation do you want to perform!!");
                    Console.WriteLine("1. Add Employee Details!!");
                    Console.WriteLine("2. Update Employee Details!!");
                    Console.WriteLine("3. Delete Employee Details!!");
                    Console.WriteLine("4. Add Branch Details!!");
                    Console.WriteLine("5. Update Branch Details!!");
                    Console.WriteLine("6. Delete Branch Details!!");
                    Console.WriteLine("7. Add Project Info!!");
                    Console.WriteLine("8. Update Project Info!!");
                    Console.WriteLine("9. Delete Project Info!!");
                    int select = Convert.ToInt32(Console.ReadLine());
                    switch (select)
                    {
                        case 1:
                            AddEmployeeDetails();
                            break;

                        case 2:
                            UpdateEmployeeDetails();
                            break;

                        case 3:
                            DeleteEmployeeDetails();
                            break;

                        case 4:
                            AddBranchDetails();
                            break;

                        case 5:
                            UpdateBranchDetails();
                            break;

                        case 6:
                            DeleteBranchDetails();
                            break;

                        case 7:
                            AddProjectInfo();
                            break;

                        case 8:
                            UpdateProjectInfo();
                            break;

                        case 9:
                            DeleteProjectInfo();
                            break;
                    }

                    break;

            }
           
        }

        public static void GetEmployee()
        {
            using (var db = new MasterContext())
            {
                Console.WriteLine("Enter Department Name!!");
                string departmentName = Console.ReadLine();
                var check = db.CompanyDepartments.Single(t => t.DepartmentName == departmentName);

                var departmentId = check.DepartmentId;
                var employees = db.Employee;
                foreach (var employee in employees)
                {
                    if (employee.DepartmentId == departmentId)
                    {
                        Console.WriteLine(employee);
                    }
                    else
                    {
                        Console.WriteLine("you enter wrong Department Name!!");
                    }
                }
            }
        }


        public static void ViewAssignProjects()
        {
            using (var db = new MasterContext())
            {
                Console.WriteLine("Enter Project Title!!");
                string projectTitle = Console.ReadLine();
                var check = db.ProjectList.Single(t => t.ProjectTitle == projectTitle);

                var projectId = check.ProjectId;
                var assignProjects = db.vAssignProjects;
                foreach (var assignProject in assignProjects)
                {
                    if (assignProject.ProjectId == projectId)
                    {
                        Console.WriteLine(assignProject);
                    }
                    else
                    {
                        Console.WriteLine("you enter wrong Project Name!!");
                    }
                }
            }
        }

        public static void checkVacationList()
        {
            using (var db = new MasterContext())
            {

                var checkVacationList = db.vEmpOnVacations;
                foreach (var checkVacation in checkVacationList)
                {
                    Console.WriteLine(checkVacation);
                }
            }
        }
        public static void AddEmployeeDetails()
        {
            using (var db = new MasterContext())
            {
                var employee = new Employee();
                {
                    Console.WriteLine("Enter Employee Name");
                    employee.EmployeeName = Console.ReadLine();
                    Console.WriteLine("Enter Employee Address");
                    employee.EmployeeAddress = Console.ReadLine();
                    Console.WriteLine("Enter Employee Age");
                    employee.EmployeeAge = Convert.ToInt32(Console.ReadLine());
                    Console.WriteLine("Enter Employee Designation");
                    employee.EmployeeDesignation = Console.ReadLine();
                    Console.WriteLine("Enter Employee Salary");
                    employee.EmployeeSalary = Convert.ToInt32(Console.ReadLine());
                    Console.WriteLine("Enter Employee Department");
                    string empDepartment = Console.ReadLine();



                    var get = db.CompanyDepartments.First(t => t.DepartmentName == empDepartment);
                    if (get != null)
                    {
                        employee.DepartmentId = get.DepartmentId;
                    }

                    var check = db.Employee.Where(t => t.EmployeeName == employee.EmployeeName);
                    if(check != null)
                    {
                        Console.WriteLine("Employee Information is Existing!!");
                    }
                    else
                    {
                        db.Employee.Add(employee);
                        db.SaveChanges();
                        Console.WriteLine("Employee Information is added!!");
                    }

                }
            }
        }

        public static void DeleteEmployeeDetails()
        {

            using (var db = new MasterContext())
            {

                var employee = new Employee();
                {


                    Console.WriteLine("Enter Employee Id");
                    employee.EmployeeId = Convert.ToInt32(Console.ReadLine());
                    var check = db.Employee.Where(t => t.EmployeeId == employee.EmployeeId);
                    if (check != null)
                    {
                        db.Employee.Remove(employee);
                        db.SaveChanges();
                        Console.WriteLine("Employee Details is successfully Deleted!!");
                    }
                    else
                    {
                        Console.WriteLine("No Employee is Existing of this Id!!");
                    }

                }

            }
        }


        public static void UpdateEmployeeDetails()
        {


            using (var db = new MasterContext())
            {
                Employee employee = new Employee();
                Console.WriteLine("Enter the Employee Name which you want to update");
                employee.EmployeeName = Console.ReadLine();

                Employee e = db.Employee.Single(t => t.EmployeeName == employee.EmployeeName);
                if (e != null)
                {
                    Console.WriteLine("Enter the Employee Name which you want");
                    e.EmployeeName = Console.ReadLine();
                    db.SaveChanges();
                    Console.WriteLine("Employee Name is Modified");
                }
                else
                {
                    Console.WriteLine("You enter Wrong Employee Name which you want to update");
                }



            }
        }

        public static void AddBranchDetails()
        {
            using (var db = new MasterContext())
            {
                var department = new CompanyDepartments();
                {

                    Console.WriteLine("Enter Company Name");
                    string companyName = Console.ReadLine();

                    Console.WriteLine("Enter Company Location");
                    string companyLocation = Console.ReadLine();


                    var get = db.Company.First(t => t.CompanyName == companyName && t.CompanyLocation == companyLocation);
                    if (get != null)
                    {
                        department.CompanyId = get.CompanyId;
                    }

                    Console.WriteLine("Enter Department Name");
                    department.DepartmentName = Console.ReadLine();
                 
                    var check = db.CompanyDepartments.Where(t => t.DepartmentName == department.DepartmentName);
                    if (check != null)
                    {
                        Console.WriteLine("This Department is Existing!!");
                    }
                    else
                    {
                        db.CompanyDepartments.Add(department);
                        db.SaveChanges();
                        Console.WriteLine("Department Information is Successfully added!!");
                    }

                }
            }
        }

        public static void DeleteBranchDetails()
        {

            using (var db = new MasterContext())
            {

                var department = new CompanyDepartments();
                {


                    Console.WriteLine("Enter Department Id");
                    department.DepartmentId = Convert.ToInt32(Console.ReadLine());
                    var check = db.CompanyDepartments.Where(t => t.DepartmentId == department.DepartmentId);
                    if (check != null)
                    {
                        db.CompanyDepartments.Remove(department);
                        db.SaveChanges();
                        Console.WriteLine("Department Details is successfully Deleted!!");
                    }
                    else
                    {
                        Console.WriteLine("No Department is Existing of this Id!!");
                    }

                }

            }
        }


        public static void UpdateBranchDetails()
        {


            using (var db = new MasterContext())
            {
                CompanyDepartments department = new CompanyDepartments();
                Console.WriteLine("Enter the Department Name which you want to update");
                department.DepartmentName = Console.ReadLine();

                CompanyDepartments c = db.CompanyDepartments.Single(t => t.DepartmentName == department.DepartmentName);
                if (c != null)
                {
                    Console.WriteLine("Enter the Department Name which you want");
                    c.DepartmentName = Console.ReadLine();
                    db.SaveChanges();
                    Console.WriteLine("Department Name is Modified");
                }
                else
                {
                    Console.WriteLine("You enter Wrong Department Name which you want to update");
                }



            }
        }


        public static void AddProjectInfo()
        {
            using (var db = new MasterContext())
            {
                var project = new ProjectList();
                {

                    Console.WriteLine("Enter Project Title");
                    project.ProjectTitle = Console.ReadLine();

                    Console.WriteLine("Enter Project Definition");
                    project.ProjectDefinition = Console.ReadLine();

                  
                    var check = db.ProjectList.Where(t => t.ProjectTitle == project.ProjectTitle);
                    if (check != null)
                    {
                        Console.WriteLine("This Project Info is Existing!!");
                    }
                    else
                    {
                        db.ProjectList.Add(project);
                        db.SaveChanges();
                        Console.WriteLine("Project Information is Successfully added!!");
                    }

                }
            }
        }

        public static void DeleteProjectInfo()
        {

            using (var db = new MasterContext())
            {

                var project = new ProjectList();
                {


                    Console.WriteLine("Enter Project Id");
                    project.ProjectId= Convert.ToInt32(Console.ReadLine());
                    var check = db.ProjectList.Where(t => t.ProjectId == project.ProjectId);
                    if (check != null)
                    {
                        db.ProjectList.Remove(project);
                        db.SaveChanges();
                        Console.WriteLine("Project Details is successfully Deleted!!");
                    }
                    else
                    {
                        Console.WriteLine("No Project is Existing of this Id!!");
                    }

                }

            }
        }


        public static void UpdateProjectInfo()
        {


            using (var db = new MasterContext())
            {
                ProjectList project = new ProjectList();
                Console.WriteLine("Enter the Project Title which you want to update");
                project.ProjectTitle = Console.ReadLine();

                ProjectList p = db.ProjectList.Single(t => t.ProjectTitle == project.ProjectTitle);
                if (p != null)
                {
                    Console.WriteLine("Enter the Project Title which you want");
                    p.ProjectTitle = Console.ReadLine();
                    db.SaveChanges();
                    Console.WriteLine("Project Title is Modified");
                }
                else
                {
                    Console.WriteLine("You enter Wrong Project Title which you want to update");
                }



            }
        }

    }
}

   
