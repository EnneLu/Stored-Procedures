using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stored_Procedures
{
    public partial class WebFormEditVeiculo1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // Apresenta mensagem de erro
            if ((Session["MsgErrofabricante"] != null) && (Session["MsgErrofabricante"].ToString() != ""))
            {
                MsgErrofabricante.Text = Session["MsgErrofabricante"].ToString();
                Session["MsgErrofabricante"] = null;
            }
            if ((Session["MsgErromodelo"] != null) && (Session["MsgErromodelo"].ToString() != ""))
            {
                MsgErromodelo.Text = Session["MsgErromodelo"].ToString();
                Session["MsgErromodelo"] = null;
            }
            if ((Session["MsgErroano"] != null) && (Session["MsgErroano"].ToString() != ""))
            {
                MsgErroano.Text = Session["MsgErroano"].ToString();
                Session["MsgErroano"] = null;
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
            if ((Session["MsgErroano"] != null) && (Session["MsgErroano"].ToString() != ""))
            {
                MsgErrouf.Text = Session["MsgErroano"].ToString();
                Session["MsgErroano"] = null;
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            DAL.DAOVeiculo aDAOVeiculo = new DAL.DAOVeiculo();
            Modelo.Veiculo aVeiculo = aDAOVeiculo.Select(Convert.ToInt32(Session["idveiculo"]));
            aVeiculo.modelo = modelotext.Text;
            aVeiculo.fabricante = fabricantetext.Text;
            aVeiculo.ano_fabricacao = ano_fabricacaotext.Text;
            aVeiculo.placa = placatext.Text;
            aVeiculo.uf = uftext.Text;

            bool ok = true;
            try
            {
                // Chama metodo de insert passando o objeto preenchido
                aDAOVeiculo.Update(aVeiculo);
            }
            catch (SqlException error)
            {
                ok = false;

                if ((error.Message.Contains("O nome do fabricante não pode ser vazio"))) Session["MsgErrofabricante"] = "O nome do fabricante não pode ser vazio";

                if (error.Message.Contains("O nome do modelo não pode ser vazio")) Session["MsgErromodelo"] = "O nome do modelo não pode ser vazio";


                if ((error.Message.Contains("O ano de fabricação não pode ser vazio"))) Session["MsgErroano"] = "O ano de fabricação não pode ser vazio";


                if (error.Message.Contains("O ano de fabricação invalido")) Session["MsgErroano"] = "O ano de fabricação deve ser no formato yyyy";

                if (error.Message.Contains("Data invalida")) Session["MsgErroano"] = "Data inválida";


                if (error.Message.Contains("A placa não pode ser vazia")) Session["MsgErroplaca"] = "A placa não pode ser vazia";

                if (error.Message.Contains("Placa digitada está no formato invalido")) Session["MsgErroplaca"] = "A placa deve ser no formato AB123CD ou ABC1234";

                if (error.Message.Contains("UF invalida")) Session["MsgErrouf"] = "UF deve ser no formato AA";

                if (error.Message.Contains("A uf não pode ser vazia")) Session["MsgErrouf"] = "A UF não pode ser vazia";
            }

            if (ok) Response.Redirect("~//WebFormCRUDVeiculo.aspx");
            Response.Redirect("~//WebFormEditVeiculo.aspx");

           
        }
    }
}