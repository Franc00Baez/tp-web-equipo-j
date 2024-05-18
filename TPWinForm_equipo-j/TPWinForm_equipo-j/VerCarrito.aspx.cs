using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;
using static System.Collections.Specialized.BitVector32;

namespace TPWinForm_equipo_j
{
    public partial class VerCarrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ActualizarCarrito();
                lblPrecioTotal.Text = ObtenerPrecioTotal();
            }
        }

        private void ActualizarCarrito()
        {
            if (Session["carrito"] == null)
            {
                Session["carrito"] = new List<Carrito>();
            }

            dgvCarrito.DataSource = (List<Carrito>)Session["carrito"];
            dgvCarrito.DataBind();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int idArticulo = int.Parse(btn.CommandArgument);

            List<Carrito> carrito = (List<Carrito>)Session["carrito"];

            Carrito articuloAEliminar = carrito.FirstOrDefault(c => c.Articulo.Id == idArticulo);
            if (articuloAEliminar != null)
            {
                if(articuloAEliminar.Cantidad > 1)
                {
                    articuloAEliminar.Cantidad--;
                    Session["carrito"] = carrito;
                    ActualizarCarrito();
                    Session["CartCount"] = carrito.Sum(item => item.Cantidad);
                    Response.Redirect(Request.RawUrl);
                }else
                {
                    carrito.Remove(articuloAEliminar);
                    Session["carrito"] = carrito;
                    ActualizarCarrito();
                    Session["CartCount"] = carrito.Sum(item => item.Cantidad);
                    Response.Redirect(Request.RawUrl);

                }
            }
        }
        protected string ObtenerPrecioTotal()
        {
            List<Carrito> carrito = (List<Carrito>)Session["carrito"];

            decimal precioTotal = carrito.Sum(item => item.Articulo.Precio * item.Cantidad);

            return string.Format("Precio Total: {0:C}", precioTotal);
        }


    }
}