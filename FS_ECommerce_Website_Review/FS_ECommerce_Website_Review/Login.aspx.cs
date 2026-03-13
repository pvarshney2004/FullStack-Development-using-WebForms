using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FS_ECommerce_Website_Review
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ECommerce_DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cs);
            string query = "SELECT * FROM Users WHERE Email = @Email AND Password = @Password";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["UserId"] = dr["UserId"].ToString();
                Session["FullName"] = dr["FullName"].ToString();
                Response.Redirect("Default.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login Failed')</script>");
            }
            conn.Close();
        }
    }
}