using System;
using System.Collections.Generic;
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

        }

        protected void salvar_Click(object sender, EventArgs e)
        {
            Modelo.Veiculo aVeiculo;
            DAL.DAOVeiculo aDAOVeiculo;

            // Instancia um Objeto de Livro com as informações fornecidas
            aVeiculo = new Modelo.Veiculo(1, fabricante.Text, modelo.Text, Convert.ToInt32(ano_fabricante.Text), placa.Text, uf.Text);

            // Instancia objeto da camada de negocio
            aDAOVeiculo = new DAL.DAOVeiculo();

            // Chama metodo de insert passando o objeto preenchido
            aDAOVeiculo.Insert(aVeiculo);

            // Chama Página de Titulos
            Response.Redirect("~\\WebFormCRUDVeiculo.aspx");

        }
    }
}