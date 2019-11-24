using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stored_Procedures
{
    public partial class WebFormAddVeiculo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Apresenta mensagem de erro
            if ((Session["MsgErrodfabricante"] != null) && (Session["MsgErrodfabricante"].ToString() != ""))
            {
                MsgErrodfabricante.Text = Session["MsgErrodfabricante"].ToString();
                Session["MsgErrodfabricante"] = null;
            }
            if ((Session["MsgErromodelo"] != null) && (Session["MsgErromodelo"].ToString() != ""))
            {
                MsgErromodelo.Text = Session["MsgErromodelo"].ToString();
                Session["MsgErromodelo"] = null;
            }
            if ((Session["MsgErrodano"] != null) && (Session["MsgErrodano"].ToString() != ""))
            {
                MsgErrodano.Text = Session["MsgErrodano"].ToString();
                Session["MsgErrodano"] = null;
            }
            if ((Session["MsgErroplaca"] != null) && (Session["MsgErroplaca"].ToString() != ""))
            {
                MsgErroplaca.Text = Session["MsgErroplaca"].ToString();
                Session["MsgErroplaca"] = null;
            }
            if ((Session["MsgErrouf"] != null) && (Session["MsgErrouf"].ToString() != ""))
            {
                MsgErrouf.Text = Session["MsgErrouf"].ToString();
                Session["MsgErrouf"] = null;
            }
        }

        protected void salvar_Click(object sender, EventArgs e)
        {
            Modelo.Veiculo aVeiculo;
            DAL.DAOVeiculo aDAOVeiculo;

            // Instancia um Objeto de Livro com as informações fornecidas
            aVeiculo = new Modelo.Veiculo(1, fabricante.Text, modelo.Text, Convert.ToInt32(ano_fabricante.Text), placa.Text, uf.Text);


            // Instancia objeto da camada de negocio
            aDAOVeiculo = new DAL.DAOVeiculo();

            bool ok = true;
            

            //validação dos outros dados
            try
            {
                // Chama metodo de insert passando o objeto preenchido
                aDAOVeiculo.Insert(aVeiculo);
            }
            catch (SqlException error)
            {
                ok = false;

                if (error.Message.Contains("Placa digitada está no formato invalido")) Session["MsgErroplaca"] = "Placa no formato invalido";

                if (error.Message.Contains("Data invalida")) Session["MsgErroano"] = "Data inválida";

                if (error.Message.Contains("UF invalida")) Session["MsgErrouf"] = "UF inválida";                

                if ((error.Message.Contains("O ano de fabricação não pode ser vazio")) || (error.Message.Contains("O ano de fabricação invalido"))) Session["MsgErrofabricante"] = "O nome do fabricante não pode ser vazio";

                if (error.Message.Contains("O nome do modelo não pode ser vazio")) Session["MsgErromodelo"] = "O nome do modelo não pode ser vazio";

            }

            if (ok) Response.Redirect("~\\WebFormCRUDVeiculo.aspx");
            else Response.Redirect("~\\WebFormAddVeiculo.aspx");


            // Chama Página de Titulos
            

        }
    }
}