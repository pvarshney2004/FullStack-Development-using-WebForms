using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;

namespace FS_Bookstore_Application.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["BookStoreDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "INSERT INTO Users (Fullname, Email, Password) VALUES (@fullname,@email,@password)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@fullname", NameTextBox.Text);
            cmd.Parameters.AddWithValue("@email", EmailTextBox.Text);
            cmd.Parameters.AddWithValue("@password", PasswordTextBox.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Page.ClientScript.RegisterStartupScript(typeof(Page), "Scripts", "alert('SignUp Successfull.. Username is: " + NameTextBox.Text + " and Password is: " + PasswordTextBox.Text + " ');", true);
                ClearControls();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('SignUp failed')</script>");
            }
        }

        void ClearControls()
        {
            NameTextBox.Text = EmailTextBox.Text = PasswordTextBox.Text = ConfirmPassTextBox.Text = "";
        }
    }
}