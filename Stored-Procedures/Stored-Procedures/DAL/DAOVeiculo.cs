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
        public Modelo.Veiculo Select(string id)
        {
            Modelo.Veiculo aUsuario = new Modelo.Veiculo();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * From Veiculo Where id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aUsuario = new Modelo.Veiculo(dr["id"].ToString(),
                                            dr["fabricante"].ToString(), 
                                            dr["modelo"].ToString(),
                                            Convert.ToInt32(dr["ano_fabricante"].ToString()),
                                            dr["placa"].ToString(),
                                            dr["uf"].ToString());
                }
            }
            dr.Close();
            conn.Close();
            return aUsuario;
    }       

        //SELECTALL()//
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Veiculo> SelectAll()
        {
            Modelo.Veiculo aVeiculo;
            List<Modelo.Veiculo> aListVeiculo = new List<Modelo.Veiculo>();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Veiculo";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {

                while (dr.Read()) 
                {
                    aVeiculo = new Modelo.Veiculo(dr["id"].ToString(),
                                            dr["fabricante"].ToString(),
                                            dr["modelo"].ToString(),
                                            Convert.ToInt32(dr["ano_fabricante"].ToString()),
                                            dr["placa"].ToString(),
                                            dr["uf"].ToString());
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
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("INSERT INTO Veiculo(fabricante,modelo,ano_fabricante,placa,uf) VALUES(@fabricante,@modelo,@ano_fabricante,@placa, @uf)", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure();
            cmd.Parameters.AddWithValue("@fabricante", obj.fabricante);
            cmd.Parameters.AddWithValue("@modelo", obj.modelo);
            cmd.Parameters.AddWithValue("@ano_fabricante", obj.ano_fabricante);
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
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("Update Veiculo Set fabricante = @fabricante, modelo = @modelo, ano_fabricante = @ano_fabricante, placa = @placa, uf = @uf Where id = @id", conn);
            cmd.Parameters.AddWithValue("@fabricante", obj.fabricante);
            cmd.Parameters.AddWithValue("@modelo", obj.modelo);
            cmd.Parameters.AddWithValue("@ano_fabricante", obj.ano_fabricante);
            cmd.Parameters.AddWithValue("@placa", obj.placa);
            cmd.Parameters.AddWithValue("@uf", obj.uf);

            cmd.ExecuteNonQuery();
        }
    }
}