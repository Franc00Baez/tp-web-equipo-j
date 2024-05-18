using negocio;
using program;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPWinForm_equipo_j
{
    public partial class DetalleArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    List<Articulo> temporal = (List<Articulo>)Session["NuevaLista"];
                    Articulo seleccionado = temporal.Find(x => x.Id == id);

                    if (seleccionado != null)
                    {
                        txtbNombre.Text = seleccionado.Nombre;
                        txtbCodigo.Text = seleccionado.Codigo;
                        txtbDescripcion.Text = seleccionado.Descripcion;
                        txtbCategoria.Text = seleccionado.Categoria.Descripcion;
                        txtbMarca.Text = seleccionado.Marca.Descripcion;
                        txtbPrecio.Text = seleccionado.Precio.ToString();
                        rptImages.DataSource = seleccionado.imagenes;
                        rptImages.DataBind();
                    }
                }
            }

        }
    }
}