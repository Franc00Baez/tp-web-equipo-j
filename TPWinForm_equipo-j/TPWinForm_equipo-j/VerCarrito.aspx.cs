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
                //mandamos el string de la funcion ObtenerPrecioTotal a la label de precio total
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
            //obtenemos el id del articulo en el que ocurre el evento
            Button btn = (Button)sender;
            int idArticulo = int.Parse(btn.CommandArgument);
            //obtenemos la lista del carrito desde Session
            List<Carrito> carrito = (List<Carrito>)Session["carrito"];
            //recuperamos el artuculo a eliminar
            Carrito articuloAEliminar = carrito.FirstOrDefault(c => c.Articulo.Id == idArticulo);
            if (articuloAEliminar != null)
            {
                //preguntamos si en el carrito hay mas de un articulo
                if(articuloAEliminar.Cantidad > 1)
                {
                    //quitamos un articulo del carrito, actualizamos la lista de carrito de Session
                    //Actualizamos el carrito contamos la cantidad de articulos en el carrito
                    //y hacemos un reload de la pagina.
                    articuloAEliminar.Cantidad--;
                    Session["carrito"] = carrito;
                    ActualizarCarrito();
                    Session["CartCount"] = carrito.Sum(item => item.Cantidad);
                    Response.Redirect(Request.RawUrl);
                }else
                {
                    //Si es falso removemos el articulo del carrito
                    //Actualizamos el carrito contamos la cantidad de articulos en el carrito
                    //y hacemos un reload de la pagina.
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
            //obtenemos la lista del carrito
            //sumamos los precios de los articulos en total
            //retornamos un string y usamos .Format para darle un formato.
            List<Carrito> carrito = (List<Carrito>)Session["carrito"];

            decimal precioTotal = carrito.Sum(item => item.Articulo.Precio * item.Cantidad);

            return string.Format("Precio Total: {0:C}", precioTotal);
        }


    }
}