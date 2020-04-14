using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApplication1
{
    class Movie: BaseClass
    {

        public Movie()
        {

        }
       

        public void Add()
        {
            Console.WriteLine("Enter a Movie Name!!");
            string movieName = Console.ReadLine();
            Console.WriteLine("Enter a Movie Release Year!!");
            string movieReleaseYear = Console.ReadLine();
            Console.WriteLine("Enter a Movie Language!!");
            string movieLanguage = Console.ReadLine();
            Console.WriteLine("Enter a CategoryId");
            string categoryId = Console.ReadLine();

            this.ExecuteNonQuery($"insert into Movies (movieName,movieReleaseYear,movieLanguage,categoryId) values('{movieName}','{movieReleaseYear}','{movieLanguage}','{categoryId}')");
          
            Console.WriteLine("Movie Details will be successfully added!!");
        }

        public void Delete()
        {
            Console.WriteLine("Enter a MovieId which you want to delete!!");
            int id = Convert.ToInt32(Console.ReadLine());
            this.ExecuteNonQuery($"Delete from Movies where movieId =" + id);
            Console.WriteLine("Movie will be successfully deleted!!");

        }

    }
}
