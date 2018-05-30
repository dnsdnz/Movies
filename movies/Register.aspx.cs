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

public partial class Register : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
       

    }

    string image_path;
    protected void Button1_Click(object sender, EventArgs e)
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


        string username = TextBox1.Text;
        string password = TextBox2.Text;
        SqlCommand register = new SqlCommand("INSERT INTO users (username,password) VALUES(@username,@password)", con);
        register.Parameters.AddWithValue("@username", username);
        register.Parameters.AddWithValue("@password", password);
        con.Open();
        register.ExecuteNonQuery();
        Response.Redirect("login.aspx");
    }
}