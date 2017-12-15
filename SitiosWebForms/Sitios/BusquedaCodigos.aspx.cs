using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitiosWebForms.Sitios
{
    public partial class BusquedaCodigos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CodSitiovalue = SitiosForm.FindControl("CodSitioLabel").ToString();

            TextBox CodigoSitioBox = new TextBox();

            CodigoSitioBox = (TextBox)AgregarVictima.FindControl("CodSitioTextBox");

            CodSitiovalue = Convert.ToString(CodSitiovalue);  
        }
    }
}