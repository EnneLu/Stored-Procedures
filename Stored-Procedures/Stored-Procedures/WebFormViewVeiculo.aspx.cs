using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stored_Procedures
{
    public partial class WebFormViewVeiculo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "DELETAR")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                Session["idveiculo"] = id;
                DAL.DAOVeiculo aDAOVeiculo = new DAL.DAOVeiculo();
                Modelo.Veiculo aVeiculo = aDAOVeiculo.Select(Convert.ToInt32(Session["idveiculo"]));
                aDAOVeiculo.Delete(aVeiculo);
                Response.Redirect("~//WebFormCRUDVeiculo.aspx");
            }
        }
    }
}