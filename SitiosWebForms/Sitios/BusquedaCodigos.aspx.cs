using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitiosWebForms.Sitios
{
    public partial class BusquedaCodigos : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Datos.mdf;Initial Catalog=Datos;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

            ///Nuevo Intento de obtener el Label del Código
            ///

            ///Formulario de Victimas
            ///
            ///TextBox CodigoSitioBox1 = new TextBox();
            ///
            ///CodigoSitioBox1 = (TextBox)AgregarVictima.FindControl("CodSitioTextBox");
            ///
            ///CodigoSitioBox1.Text = Convert.ToString(CodeSearchBox.Text);

            ///Formulario de Testigos
            ///
            ///TextBox CodigoSitioBox2 = new TextBox();
            ///
            ///CodigoSitioBox2 = (TextBox)AgregarTestigo.FindControl("CodSitioTextBox");
            ///
            ///CodigoSitioBox2.Text = Convert.ToString(CodeSearchBox.Text);

            ///Formulario de Informantes
            ///
            ///TextBox CodigoSitioBox3 = new TextBox();
            ///
            ///CodigoSitioBox3 = (TextBox)AgregarInformante.FindControl("CodSitioTextBox");
            ///
            ///CodigoSitioBox3.Text = Convert.ToString(CodeSearchBox.Text);
            ///

        }
    }
}