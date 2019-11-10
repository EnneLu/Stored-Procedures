using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Stored_Procedures.DAL
{
    public class DAOCliente
    {
        /*
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
             // define SQL do comando
             cmd.CommandText = "SELECT * FROM Cliente";
             // Executa comando, gerando objeto DbDataReader
             SqlDataReader dr = cmd.ExecuteReader();
             // Le titulo do livro do resultado e apresenta no segundo rótulo
             if (dr.HasRows)
             {

                 while (dr.Read()) // Le o proximo registro
                 {
                     // Cria objeto com dados lidos do banco de dados
                     aCliente = new Modelo.Cliente(dr["id"].ToString(), dr["nome"].ToString(), Convert.ToDateTime(dr["data_nascimento"].ToString()), dr["cpf"].ToString());
                     aListCliente.Add(aCliente);
                 }
             }
             // Fecha DataReader
             dr.Close();
             // Fecha Conexão
             conn.Close();

             return aListLaboratorios;
         }

         [DataObjectMethod(DataObjectMethodType.Insert)]
         public void Insert(Modelo.Cliente obj)
         {
             // Cria Conexão com banco de dados
             SqlConnection conn = new SqlConnection(connectionString);
             // Abre conexão com o banco de dados
             conn.Open();
             // Cria comando SQL
             SqlCommand com = conn.CreateCommand();
             // Define comando de exclusão
             SqlCommand cmd = new SqlCommand("INSERT INTO Cliente(nome,data_nascimento,cpf) VALUES(@nome, @data_nascimento, @cpf)", conn);
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

             SqlCommand com = conn.CreateCommand();

             SqlCommand cmd = new SqlCommand("Update Cliente Set nome = @nome, data_nascimento = @data_nascimento, @cpf = cpf Where id = @id", conn);
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

             SqlCommand com = conn.CreateCommand();

             SqlCommand cmd = new SqlCommand("Delete From Cliente Where id = @id", conn);
             cmd.Parameters.AddWithValue("@id", obj.id);
             cmd.ExecuteNonQuery();
         }*/
    }
}