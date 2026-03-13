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
    public partial class ChangePassword : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ECommerce_DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            string currentPassword = txtCurrentPassword.Text;
            string newPassword = txtNewPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;
            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "New passwords do not match!";
                return;
            }
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                // checking current password
                SqlCommand checkCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Users WHERE UserId=@UserId AND Password=@Password", con);

                checkCmd.Parameters.AddWithValue("@UserId", userId);
                checkCmd.Parameters.AddWithValue("@Password", currentPassword);

                int count = (int)checkCmd.ExecuteScalar();

                if (count == 0)
                {
                    lblMessage.Text = "Current password is incorrect!";
                    return;
                }

                // updating new password
                SqlCommand updateCmd = new SqlCommand(
                    "UPDATE Users SET Password=@NewPassword WHERE UserId=@UserId", con);

                updateCmd.Parameters.AddWithValue("@NewPassword", newPassword);
                updateCmd.Parameters.AddWithValue("@UserId", userId);

                updateCmd.ExecuteNonQuery();
                lblMessage.Text = "Password changed successfully!";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }

}