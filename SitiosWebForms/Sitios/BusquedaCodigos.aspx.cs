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

        protected void ButtonAgregarVictima_Click(object sender, EventArgs e)
        {
            sc.Open();

            SqlCommand cmdAgregarVictima = sc.CreateCommand();
            cmdAgregarVictima.CommandType = System.Data.CommandType.Text;
            cmdAgregarVictima.CommandText = "insert into Victimas (CodSitio, Nombres, ApellidoPaterno, ApellidoMaterno, Sexo, Edad, Procedencia, Familia, PresuntaAfiliacion) values ('" + Convert.ToString(CodeSearchBox.Text) + "','" + NombresVíctimaInput.Value + "','" + ApellidoPaternoVictimaInput.Value + "','" + ApellidoMaternoVictimaInput.Value + "','" + SexoVictimaInput.Value + "','" + EdadVictimaInput.Value + "','" + ProcedenciaVictimaInput.Value + "','" + FamiliaVictimaInput.Value + "','" + PresuntaAfiliacionVictimaInput.Value + "')";
            cmdAgregarVictima.ExecuteNonQuery();

            sc.Close();
        }
    }
}