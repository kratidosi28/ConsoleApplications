using System;
using Microsoft.Data.SqlClient;

namespace ConsoleApplication1
{
    public abstract class BaseClass
    {
        public BaseClass()
        {
            this.SqlConnection = new SqlConnection("Data Source=DESKTOP-VF2DC0P;Initial Catalog=ConsoleApplication1Db;Integrated Security=True;MultipleActiveResultSets=True;App=EntityFramework");
            this.SqlConnection.Open();
        }

        public SqlDataReader GetReader(string commandText)
        {
            this.SqlCommand = new SqlCommand(commandText, this.SqlConnection);
            return this.SqlCommand.ExecuteReader();
        }

        public void ExecuteNonQuery(string commandText)
        {
            this.SqlCommand = new SqlCommand(commandText, this.SqlConnection);
            // this.SqlCommand.ExecuteNonQuery();
            if (this.SqlCommand.ExecuteNonQuery() == 0)
            {
              Console.WriteLine("You enter Wrong Credentials");
            }
         
           
          
        }

        public void CloseConnection()
        {
            this.SqlConnection.Close();
        }

        protected SqlCommand SqlCommand { get; set; }
        private SqlConnection SqlConnection { get; set; }
    }
}


