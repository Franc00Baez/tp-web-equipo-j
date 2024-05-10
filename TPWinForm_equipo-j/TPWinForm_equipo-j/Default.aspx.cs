using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using program;

namespace TPWinForm_equipo_j
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NuevaLista"] == null)
            {
            ArtNegocio negocio = new ArtNegocio();
            Session.Add("NuevaLista", negocio.listar());
            ListaArticulo = negocio.listarSP();
            }
            Rep1.DataSource = Session["NuevaLista"];
            Rep1.DataBind();
        }

        protected void btnDetalles_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;

            Response.Redirect("DetalleArticulo.aspx?id=" + id);
        }

        protected void btnDetalles_Command(object sender, CommandEventArgs e)
        {

        }
    }
}