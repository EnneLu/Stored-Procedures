using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stored_Procedures
{
    public partial class WebFormAddCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void salvar_Click(object sender, EventArgs e)
        {
            Modelo.Cliente aCliente;
            DAL.DAOCliente aDAOCliente;

            // Instancia um Objeto de Livro com as informações fornecidas
            aCliente = new Modelo.Cliente(
                nometext.Text, Convert.ToDateTime(datanascimentotext.Text), cpftext.Text);

            // Instancia objeto da camada de negocio
            aDAOCliente = new DAL.DAOCliente();

            // Chama metodo de insert passando o objeto preenchido
            aDAOCliente.Insert(aCliente);

            // Chama Página de Titulos
            Response.Redirect("~\\WebFormCRUDCliente");

        }
    }
}