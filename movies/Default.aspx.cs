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
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
    string query;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            else
            {
                con.Open();
                query = "SELECT * FROM movies";
                Take_movies(query);
                con.Close();
            }
        }  
    }

    string image_path;
    void Take_movies(string query)
    {
             SqlDataAdapter da = new SqlDataAdapter(query, con);
             DataSet ds = new DataSet();
             da.Fill(ds);
             Repeater1.DataSource = ds;
             Repeater1.DataBind(); 
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
       
        if(DropDownList1.SelectedItem.Text == "name" )
        {
            string search = "select id,name,director,date,category,image from movies where name like '%" + TextBox1.Text + "%'";
            Take_movies(search);
        }
        if (DropDownList1.SelectedItem.Text == "director")
        {
            string search = "select id,name,director,date,category,image from movies where director like '%" + TextBox1.Text + "%'";
            Take_movies(search);
        }
        if (DropDownList1.SelectedItem.Text == "date")
        {
            string search = "select id,name,director,date,category,image from movies where date like '%" + TextBox1.Text + "%'";
            Take_movies(search);
        }
        if (DropDownList1.SelectedItem.Text == "category")
        {
            string search = "select id,name,director,date,category,image from movies where category like '%" + TextBox1.Text + "%'";
            Take_movies(search);
        }
        if (DropDownList1.SelectedItem.Text == "actor/actress")
        {
            string search = "select id,name,director,date,category,image from movies where actoractress like '%" + TextBox1.Text + "%'";
            Take_movies(search);
        }
        if (DropDownList1.SelectedItem.Text == "content")
        {
            string search = "select id,name,director,date,category,image from movies where content like '%" + TextBox1.Text + "%'";
            Take_movies(search);
        }
    }

    protected void Button3_Click3(object sender, EventArgs e)  //delete button
    {
        con.Open();
        int id = Convert.ToInt32((sender as Button).CommandArgument);
        query = "DELETE FROM movies WHERE id='"+id+"' ";
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        query = "SELECT * FROM movies";
        Take_movies(query);
        con.Close();
    }
}
