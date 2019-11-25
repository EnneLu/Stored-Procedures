using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stored_Procedures
{
    public partial class WebFormEditCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Apresenta mensagem de erro
            if ((Session["MsgErronome"] != null) && (Session["MsgErronome"].ToString() != ""))
            {
                MsgErronome.Text = Session["MsgErronome"].ToString();
                Session["MsgErronome"] = null;
            }
            if ((Session["MsgErrodata"] != null) && (Session["MsgErrodata"].ToString() != ""))
            {
                MsgErrodata.Text = Session["MsgErrodata"].ToString();
                Session["MsgErrodata"] = null;
            }
            if ((Session["MsgErrocpf"] != null) && (Session["MsgErrocpf"].ToString() != ""))
            {
                MsgErrocpf.Text = Session["MsgErrocpf"].ToString();
                Session["MsgErrocpf"] = null;
            }

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            DAL.DAOCliente aDAOCliente  = new DAL.DAOCliente();
            Modelo.Cliente aCliente = aDAOCliente.Select(Convert.ToInt32(Session["idcliente"]));
            aCliente.nome = nometext.Text;
            aCliente.data_nascimento = Convert.ToDateTime(datanascimentotext.Text);
            aCliente.cpf = cpftext.Text;

            

            bool ok = true;

            //validação dos outros dados
            try
            {
                // Chama metodo de insert passando o objeto preenchido
                aDAOCliente.Update(aCliente);
            }
            catch (SqlException error)
            {
                ok = false;

                if (error.Message.Contains("O nome não pode ser vazio")) Session["MsgErronome"] = "Por favor, O nome não pode ser vazio";

                if (error.Message.Contains("Data invalida")) Session["MsgErrodata"] = "Data inválida";

                if (error.Message.Contains("Cadeia de caracteres não foi reconhecida como DateTime válido.")) Session["MsgErrodata"] = "Data inválida";
                
                if (error.Message.Contains("Cpf incorreto")) Session["MsgErrocpf"] = "Cpf incorreto";

            }

            if (ok) Response.Redirect("~//WebFormCRUDCliente.aspx");
            Response.Redirect("~//WebFormEditCliente.aspx");
        }

        protected void nometext_TextChanged(object sender, EventArgs e)
        {

        }
    }
}