using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApplication1
{
    class MovieCasting : BaseClass
    {
        public MovieCasting()
        {

        }
        public void Add()
        {
            Console.WriteLine("Enter a Movie Id!!");
            int movieId = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter a Actor Id!!");
            int actorId = Convert.ToInt32(Console.ReadLine());

            this.ExecuteNonQuery($"insert into MovieCasting (movieId,actorId) values('{movieId}','{actorId}')");

            Console.WriteLine("MovieCasting Details will be successfully added!!");
        }



        public void Get()
        {

            var reader = this.GetReader($"select movieName,actorName from MovieCastingView");

            Console.WriteLine("Enter Movie Name and then Check which Actor or Actress in that Movie");
            string actor = Console.ReadLine();
            while (reader.Read())
            {
                // var movieCasting = new MovieCasting();
                //  movieCasting. = reader.GetInt32(1);
                if (reader[0].ToString() == actor)
                {

                    Console.WriteLine("MovieName:  " + reader[0].ToString() + "\n" + " ActorName:  " + reader[1].ToString());

                    //movieCastings.Add(movieCasting);
                }
                else
                {
                    Console.WriteLine("Invalid !!");
                }
                // return movieCastings;
            }
        }
    }
}
