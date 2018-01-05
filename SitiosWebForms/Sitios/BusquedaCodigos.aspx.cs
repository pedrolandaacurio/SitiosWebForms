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
        SqlConnection sc = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Datos.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

            ///Nuevo Intento de obtener el Label del Código
            ///
            string SelectedValueLabel = Convert.ToString(ListaSitiosSelect.SelectedValue);
            
            ///Formulario de Victimas
            
            TextBox CodigoSitioBox1 = new TextBox();
            
            CodigoSitioBox1 = (TextBox)FormView1.FindControl("CodSitioTextBox");
            
            CodigoSitioBox1.Text = SelectedValueLabel;

            ///Formulario de Informantes
            
            TextBox CodigoSitioBox3 = new TextBox();
            
            CodigoSitioBox3 = (TextBox)FormView2.FindControl("CodSitioTextBox");
            
            CodigoSitioBox3.Text = SelectedValueLabel;
            
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            GridView2.DataBind();
        }

        ///protected void Unnamed_Click1(object sender, EventArgs e)
        ///{
        ///    GridView3.DataBind();
        ///}

        ///protected void ButtonAgregarVictima_Click(object sender, EventArgs e)
        ///{
        ///    sc.Open();
        ///
        ///    SqlCommand cmdAgregarVictima = sc.CreateCommand();
        ///    cmdAgregarVictima.CommandType = System.Data.CommandType.Text;
        ///    cmdAgregarVictima.CommandText = "insert into Victimas (CodSitio, Nombres, ApellidoPaterno, ApellidoMaterno, Sexo, Edad, Procedencia, Familia, PresuntaAfiliacion) values ('" + Convert.ToString(CodeSearchBox.Text) + "','" + NombresVíctimaInput.Text + "','" + ApellidoPaternoVictimaInput.Text + "','" + ApellidoMaternoVictimaInput.Text + "','" + SexoVictimaInput.Text + "'," + EdadVictimaInput.Text + ",'" + ProcedenciaVictimaInput.Value + "','" + FamiliaVictimaInput.Value + "','" + PresuntaAfiliacionVictimaInput.Value + "')";
        ///    cmdAgregarVictima.ExecuteNonQuery();
        ///
        ///    sc.Close();
        ///
        ///}
    }
}