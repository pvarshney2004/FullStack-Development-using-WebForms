using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FS_ECommerce_Website_Review
{
    public partial class Register : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ECommerce_DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cs);
            string query = "INSERT INTO Users (FullName, Email, Password) VALUES (@FullName, @Email, @Password)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@FullName", UsernameTextBox.Text);
            cmd.Parameters.AddWithValue("@Email", EmailTextBox.Text);
            cmd.Parameters.AddWithValue("@Password", PasswordTextBox.Text);
            conn.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),"SuccessMessage", "<script>alert('SignUp Successfull.. ')</script>");
                ClearControls();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Failed", "<script>alert('SignUp Failed.. ')</script>");
            }
        }

        void ClearControls()
        {
            UsernameTextBox.Text = EmailTextBox.Text = PasswordTextBox.Text = "";
        }
    }
}