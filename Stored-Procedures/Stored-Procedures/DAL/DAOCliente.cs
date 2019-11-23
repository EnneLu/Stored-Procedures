using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Stored_Procedures.DAL
{
    public class DAOCliente
    {
    
         string connectionString = "";

         public DAOCliente()
         {
             connectionString = ConfigurationManager.ConnectionStrings["Stored_ProceduresConnectionString"].ConnectionString;
         }

         [DataObjectMethod(DataObjectMethodType.Select)]
         public List<Modelo.Cliente> SelectAll()
         {
             // Variavel para armazenar um cliente
             Modelo.Cliente aCliente;
             // Cria Lista Vazia
             List<Modelo.Cliente> aListCliente = new List<Modelo.Cliente>();
             // Cria Conexão com banco de dados
             SqlConnection conn = new SqlConnection(connectionString);
             // Abre conexão com o banco de dados
             conn.Open();
             // Cria comando SQL
             SqlCommand cmd = conn.CreateCommand();
            // define uso do stored procedure
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            // define SQL do comando
            cmd.CommandText = "Cliente_select_all";
            // Executa comando, gerando objeto DbDataReader
            cmd.Parameters.AddWithValue("@id", 0);

            SqlDataReader dr = cmd.ExecuteReader();
             // Le titulo do livro do resultado e apresenta no segundo rótulo
             if (dr.HasRows)
             {

                 while (dr.Read()) // Le o proximo registro
                 {
                     // Cria objeto com dados lidos do banco de dados
                     aCliente = new Modelo.Cliente(Convert.ToInt32(dr["id"].ToString()), dr["nome"].ToString(), Convert.ToDateTime(dr["data_nascimento"].ToString()), dr["cpf"].ToString());
                     aListCliente.Add(aCliente);
                 }
             }
             // Fecha DataReader
             dr.Close();
             // Fecha Conexão
             conn.Close();

             return aListCliente;
         }


        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Cliente Select(int id)
        {
            // Variavel para armazenar um cliente
            Modelo.Cliente aCliente = new Modelo.Cliente();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define uso do stored procedure
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            // define SQL do comando
            cmd.CommandText = "Cliente_select_all";
            // Executa comando, gerando objeto DbDataReader
            cmd.Parameters.AddWithValue("@id",id);

            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aCliente = new Modelo.Cliente(Convert.ToInt32(dr["id"].ToString()), dr["nome"].ToString(), Convert.ToDateTime(dr["data_nascimento"].ToString()), dr["cpf"].ToString());
                }
            }   
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aCliente;
        }




        [DataObjectMethod(DataObjectMethodType.Insert)]
         public void Insert(Modelo.Cliente obj)
         {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define uso do stored procedure
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            // Define comando de insert
            cmd.CommandText = "Cliente_insert";

             cmd.Parameters.AddWithValue("@nome", obj.nome);
             cmd.Parameters.AddWithValue("@data_nascimento", obj.data_nascimento);
             cmd.Parameters.AddWithValue("@cpf", obj.cpf);


             // Executa Comando            
             cmd.ExecuteNonQuery();
         }

         [DataObjectMethod(DataObjectMethodType.Update)]
         public void Update(Modelo.Cliente obj)
         {
             SqlConnection conn = new SqlConnection(connectionString);

             conn.Open();

             SqlCommand cmd = conn.CreateCommand();
            // define uso do stored procedure
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            // Define comando de update
            cmd.CommandText = "Cliente_update";
                cmd.Parameters.AddWithValue("@id", obj.id);
                cmd.Parameters.AddWithValue("@nome", obj.nome);
                cmd.Parameters.AddWithValue("@data_nascimento", obj.data_nascimento);
                cmd.Parameters.AddWithValue("@cpf", obj.cpf);


             cmd.ExecuteNonQuery();
         }


         [DataObjectMethod(DataObjectMethodType.Delete)]
         public void Delete(Modelo.Cliente obj)
         {
             SqlConnection conn = new SqlConnection(connectionString);

             conn.Open();

             SqlCommand cmd = conn.CreateCommand();
            // define uso do stored procedure
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            // Define comando de update
            cmd.CommandText = "Cliente_delete";
             cmd.Parameters.AddWithValue("@id", obj.id);
             cmd.ExecuteNonQuery();
         }
    }
}