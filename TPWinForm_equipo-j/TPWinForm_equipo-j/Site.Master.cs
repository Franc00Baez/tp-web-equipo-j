using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace TPWinForm_equipo_j
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateCartCount();
            }
        }

        public void UpdateCartCount()
        {
            int cartCount = Session["CartCount"] != null ? (int)Session["CartCount"] : 0;
            CartCountLiteral.Text = cartCount.ToString();
        }

    }
}