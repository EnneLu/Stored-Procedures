using System;
using System.Collections.Generic;
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

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            DAL.DAOCliente aDAOCliente  = new DAL.DAOCliente();
            Modelo.Cliente aCliente = aDAOCliente.Select(Convert.ToInt32(Session["idcliente"]));
            aCliente.nome = nometext.Text;
            aCliente.data_nascimento = Convert.ToDateTime(datanascimentotext.Text);
            aCliente.cpf = cpftext.Text;
            aDAOCliente.Update(aCliente);
            Response.Redirect("~//WebFormCRUDCliente.aspx");
        }
    }
}