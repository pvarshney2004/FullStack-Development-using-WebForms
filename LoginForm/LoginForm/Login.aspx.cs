using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace LoginForm
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs2"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cs);
            string query = "select * from SignUp where username = @user and password = @pass";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@user", UserTextBox.Text);
            cmd.Parameters.AddWithValue("@pass", PassTextBox.Text);
            conn.Open();
            SqlDataReader data = cmd.ExecuteReader();
            if (data.HasRows)
            {
                Session["user"] = UserTextBox.Text;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login Successfull')</script>");
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login Failed')</script>");
            }
            conn.Close();
        }

        
    }
}