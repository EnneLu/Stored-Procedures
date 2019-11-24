using System;
using System.Collections.Generic;
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

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            DAL.DAOVeiculo aDAOVeiculo = new DAL.DAOVeiculo();
            Modelo.Veiculo aVeiculo = aDAOVeiculo.Select(Convert.ToInt32(Session["idcliente"]));
            aVeiculo.modelo = modelotext.Text;
            aVeiculo.fabricante = fabricante.Text;
            aVeiculo.ano_fabricante = Convert.ToInt32(ano_fabricante.Text);
            aVeiculo.placa = placa.Text;
            aVeiculo.uf = uf.Text;
            aDAOVeiculo.Update(aVeiculo);
            Response.Redirect("~//WebFormCRUDCliente.aspx");
        }
    }
}