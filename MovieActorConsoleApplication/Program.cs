using System;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to MovieApplication");
            Console.WriteLine("What you are!!");
            Console.WriteLine("1. Admin");
            Console.WriteLine("2. User");
            int choice = Convert.ToInt32(Console.ReadLine());
            Movie movie = new Movie();
            Actor actor = new Actor();
            MovieCasting movieCasting = new MovieCasting();
            switch (choice)
            {
                case 1:
                    Console.WriteLine("Which action you want to perform?");
                    Console.WriteLine("1. Add a movieDetails");
                    Console.WriteLine("2. Delete a movie");
                    Console.WriteLine("3. Add an actorDetails");
                    Console.WriteLine("4. Delete an actor");
                    int action = Convert.ToInt32(Console.ReadLine());
                    switch (action)
                    {
                        
                          case 1:
                           
                            movie.Add();
                            break;

                        case 2:
                            movie.Delete();
                            break;
                        case 3:
                            actor.add();
                            break;
                        case 4:
                            actor.Delete();
                            break;
                        default:
                            Console.WriteLine("You enter invalid action!!");
                            break;

                    }
                    break;

                case 2:
                   movieCasting.Get();
                    break;

                default:
                    break;

            }
        }
    }
}
