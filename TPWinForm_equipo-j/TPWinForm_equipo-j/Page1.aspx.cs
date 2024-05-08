using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace TPWinForm_equipo_j
{
    public partial class Page1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           ArtNegocio negocio = new ArtNegocio();
            dgvArticulos.DataSource = negocio.listarSP();
            dgvArticulos.DataBind();
        }
    }
}