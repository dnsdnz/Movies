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

public partial class Movie_statistics : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
    string query1,query2,query3;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        else
        {


            query1 = "SELECT COUNT(id) FROM movies";
           
            

            int moviecount = Data(query1);
          

            Label1.Text = moviecount.ToString();
            Label2.Text = "7";
            Label3.Text ="14";

           
        }

    }
    public int Data(string query)
    {
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        int nom= Convert.ToInt32(ds.Tables[0].Rows[0][0]);
        con.Close();

        return nom;
    }


}