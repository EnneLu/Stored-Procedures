using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stored_Procedures
{
    public partial class WebFormViewCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //Verifica se o comando é "Editar"
            if (e.CommandName.ToString() == "DELETAR")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                Session["idcliente"] = id;
                DAL.DAOCliente aDAOCliente = new DAL.DAOCliente();
                Modelo.Cliente aCliente = aDAOCliente.Select(Convert.ToInt32(Session["idcliente"]));
                aDAOCliente.Delete(aCliente);
                Response.Redirect("~//WebFormCRUDCliente.aspx");
            }
        }
    }
}