using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

public partial class Login : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "" || TextBox2.Text == "")
        {

            Label2.Text = "alanlar boş bırakılmaz.";

        }
        else {
            string username = TextBox1.Text;
            string password = TextBox2.Text;

            SqlCommand login = new SqlCommand("SELECT * FROM users WHERE username=@username AND password=@password", con);
            login.Parameters.AddWithValue("@username", username);
            login.Parameters.AddWithValue("@password", password);
            con.Open();
            SqlDataReader read = login.ExecuteReader();

            if (read.Read())
            {
                Session["userid"] = read["id"];
                Session["username"] = read["username"].ToString();
                Response.Redirect("Default.aspx");
            }
            else

            read.Close();
            con.Close();
            read.Dispose();
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }

}