using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using program;
using dominio;
using negocio;
using System.Data.SqlClient;

namespace TPWinForm_equipo_j
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["NuevaLista"] == null)
                {
                    ArtNegocio negocio = new ArtNegocio();
                    Session.Add("NuevaLista", negocio.listar());
                    ListaArticulo = negocio.listar();
                }
                Rep1.DataSource = Session["NuevaLista"];
                Rep1.DataBind();
            }
        }

        protected void btnDetalles_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;

            Response.Redirect("DetalleArticulo.aspx?id=" + id);
        }

        protected void btncarrito_Click(object sender, EventArgs e)
        {

            try
            {
                Button btn = (Button)sender;
                int idArticulo = int.Parse(btn.CommandArgument);

                if (Session["carrito"] != null)
                {
                    List<Carrito> carrito = (List<Carrito>)Session["carrito"];

                    ArtNegocio negocio = new ArtNegocio();
                    Articulo articulo = negocio.ObtenerArticuloPorID(idArticulo);

                    if (articulo != null)
                    {
                        carrito.Add(new Carrito(articulo, 1));
                        Session["carrito"] = carrito;
                        int cartCount = carrito.Count;
                        Session["CartCount"] = cartCount;
                    }
                }
                Response.Redirect("VerCarrito.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = "Ocurrió un error al agregar el artículo al carrito: " + ex.Message;
            }
        }

        protected void Rep1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btn = (Button)e.Item.FindControl("btncarrito");
                if (btn != null)
                {
                    Articulo articulo = (Articulo)e.Item.DataItem;
                    btn.CommandArgument = articulo.Id.ToString();
                }
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            try
            {
                string campo = ddlCampo.SelectedValue;
                string criterio = ddlCriterio.SelectedValue;
                string filtro = txtFiltro.Text;

                ArtNegocio negocio = new ArtNegocio();
                List<Articulo> listaFiltrada = negocio.Filtrar(campo, criterio, filtro);

                Rep1.DataSource = listaFiltrada;
                Rep1.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = "Ocurrió un error al aplicar el filtro: " + ex.Message;
            }
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            string campoSeleccionado = ddlCampo.SelectedValue;

            ddlCriterio.Items.Clear();
            switch (campoSeleccionado)
            {
                case "Nombre":
                case "Marca":
                case "Categoria":
                    ddlCriterio.Items.Add(new ListItem("Comienza por", "Comienza por"));
                    ddlCriterio.Items.Add(new ListItem("Termina con", "Termina con"));
                    ddlCriterio.Items.Add(new ListItem("Igual a", "Igual a"));
                    break;
                case "Precio":
                    ddlCriterio.Items.Add(new ListItem("Mayor que", "Mayor que"));
                    ddlCriterio.Items.Add(new ListItem("Menor que", "Menor que"));
                    ddlCriterio.Items.Add(new ListItem("Igual a", "Igual a"));
                    break;
            }
        }
    }
}