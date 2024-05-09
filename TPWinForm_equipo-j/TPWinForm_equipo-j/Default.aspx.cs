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
            ArtNegocio negocio = new ArtNegocio();
            ListaArticulo = negocio.listarSP();
            Rep1.DataSource = ListaArticulo;
            Rep1.DataBind();
        }
    }
}