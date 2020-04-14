using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApplication1
{
    public class Actor:BaseClass
    {
        public Actor()
        {

        }

        public void add()
        {
            Console.WriteLine("Enter an ActorName!!");
            string actorName = Console.ReadLine();
            Console.WriteLine("Enter an ActorGender");
            string actorGender = Console.ReadLine();
            Console.WriteLine("Enter an ActorAge");
            int actorAge = Convert.ToInt32(Console.ReadLine());
            this.ExecuteNonQuery($"insert into Actors(actorName,actorGender,actorAge) values ('{actorName}','{actorGender}','{actorAge}')");
            Console.WriteLine("You will successfully added Actor details!!");
        }

        public void Delete()
        {
            Console.WriteLine("Enter an ActorId you want to delete");
            int actorId = Convert.ToInt32(Console.ReadLine());

            this.ExecuteNonQuery($"Delete from Actors where actorid = " + actorId);
   
            Console.WriteLine("You will successfully deleted Actor details!!");
         
        }
    }
}
