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

public partial class Add_movie : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
    string query;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        else
        {
            con.Open();
        }
    }
    string image_path;
    protected void Button1_Click1(object sender, EventArgs e)
    {

        DateTime time = DateTime.Now;

        string yukleme = Request.PhysicalApplicationPath + "movieimages\\";
        if (FileUpload1.HasFile)
        {
            string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
            if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png") ;
            {
                string fileName = time.ToString("yyyyMMddHHmmss");
                image_path = fileName;
                FileUpload1.SaveAs(yukleme + fileName + extension);
            }
        }


        string name = TextBox1.Text;
        string director = TextBox2.Text;
        int date = Convert.ToInt32(TextBox3.Text);
        string category = DropDownList1.SelectedValue;
        string actor = TextBox4.Text;
        string content = TextBox5.Text;

        query = " INSERT INTO movies (name, director, date, category,actoractress,content,image) VALUES ('"+name+"','"+director+ "','" + date + "','" + category + "','" + actor + "','" + content + "','" + image_path + "')";
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        Label1.Text = "movie added succesfully";

    }
    
}