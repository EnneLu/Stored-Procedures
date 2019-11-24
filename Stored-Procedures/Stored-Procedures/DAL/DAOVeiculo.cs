using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Stored_Procedures.DAL
{
    public class DAOVeiculo
    {
        string connectionString = "";

        public DAOVeiculo()
        {
            connectionString = ConfigurationManager.ConnectionStrings["Stored_ProceduresConnectionString"].ConnectionString;
        }

        //SELECIONAR//
        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Veiculo Select(int id)
        {
            // Variavel para armazenar um veiculo
            Modelo.Veiculo aVeiculo = new Modelo.Veiculo();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define uso do stored procedure
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            // define SQL do comando
            cmd.CommandText = "Veiculo_select_all";
            // Executa comando, gerando objeto DbDataReader
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aVeiculo = new Modelo.Veiculo(Convert.ToInt32(dr["id"].ToString()),
                                            dr["fabricante"].ToString(), 
                                            dr["modelo"].ToString(),
                                            Convert.ToInt32(dr["ano_fabricacao"].ToString()),
                                            dr["placa"].ToString(),
                                            dr["uf"].ToString());
                }
            }
            dr.Close();
            conn.Close();
            return aVeiculo;
        }       

        //SELECTALL()//
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Veiculo> SelectAll()
        {
            // Variavel para armazenar um cliente
            Modelo.Veiculo aVeiculo;
            // Cria Lista Vazia
            List<Modelo.Veiculo> aListVeiculo = new List<Modelo.Veiculo>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define uso do stored procedure
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            // define SQL do comando
            cmd.CommandText = "Veiculo_select_all";
            // Executa comando, gerando objeto DbDataReader
            cmd.Parameters.AddWithValue("@id", 0);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aVeiculo = new Modelo.Veiculo(Convert.ToInt32(dr["id"].ToString()), dr["fabricante"].ToString(), dr["modelo"].ToString(),Convert.ToInt32(dr["ano_fabricacao"].ToString()),dr["placa"].ToString(),dr["uf"].ToString());
                    aListVeiculo.Add(aVeiculo);
                }
            }
            dr.Close();
            conn.Close();

            return aListVeiculo;
        }

        //INSERIR//
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Veiculo obj)
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
            cmd.CommandText = "Veiculo_insert";

            cmd.Parameters.AddWithValue("@fabricante", obj.fabricante);
            cmd.Parameters.AddWithValue("@modelo", obj.modelo);
            cmd.Parameters.AddWithValue("@ano_fabricacao", obj.ano_fabricacao);
            cmd.Parameters.AddWithValue("@placa", obj.placa);
            cmd.Parameters.AddWithValue("@uf", obj.uf);

            cmd.ExecuteNonQuery();
        }

        //EDITAR TODOS//
         [DataObjectMethod(DataObjectMethodType.Update)]
         public void Update(Modelo.Veiculo obj)
         {
             SqlConnection conn = new SqlConnection(connectionString);

             conn.Open();

             SqlCommand cmd = conn.CreateCommand();
            // define uso do stored procedure
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            // Define comando de update
            cmd.CommandText = "Veiculo_update";
                                cmd.Parameters.AddWithValue("@id", obj.id);
                                cmd.Parameters.AddWithValue("@fabricante", obj.fabricante);
                                cmd.Parameters.AddWithValue("@modelo", obj.modelo);
                                cmd.Parameters.AddWithValue("@ano_fabricacao", obj.ano_fabricacao);
                                cmd.Parameters.AddWithValue("@placa", obj.placa);
                                cmd.Parameters.AddWithValue("@uf", obj.uf);
             cmd.ExecuteNonQuery();
         }

         [DataObjectMethod(DataObjectMethodType.Delete)]
         public void Delete(Modelo.Veiculo obj)
         {
             SqlConnection conn = new SqlConnection(connectionString);

             conn.Open();

             SqlCommand cmd = conn.CreateCommand();
            // define uso do stored procedure
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            // Define comando de delete
            cmd.CommandText = "Veiculo_delete";
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.ExecuteNonQuery();
         }         
    }
}