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

public partial class ProfilePage : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
    string query;
    ArrayList deneme = new ArrayList();
    int userid;

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
                query = "SELECT * FROM users";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                da.Fill(ds);

                TextBox1.Text = ds.Tables[0].Rows[0][1].ToString();
                TextBox2.Text = ds.Tables[0].Rows[0][2].ToString();
                string image = ds.Tables[0].Rows[0][3].ToString();
                Image1.ImageUrl = "~/profileimages/"+image+".jpg";
                con.Close();

            }
        }
    }
    string image_path;
    protected void Button1_Click1(object sender, EventArgs e)
    {
        
        DateTime time = DateTime.Now;

        string yukleme = Request.PhysicalApplicationPath + "profileimages\\";
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

        userid = Convert.ToInt32(Session["userid"]);
        string updated_name = TextBox1.Text;
        string updated_pass = TextBox2.Text;
        con.Open();
        query = "UPDATE users SET username='"+updated_name+"', password='"+updated_pass+"',image='"+image_path+"'  WHERE id="+userid+" ";
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        Session["username"] = null;
        Response.Redirect("login.aspx");

    }

   

    
}