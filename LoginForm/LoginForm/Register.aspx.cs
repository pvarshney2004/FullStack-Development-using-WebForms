using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace LoginForm
{
    public partial class Register : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs2"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cs);
            string query = "insert into SignUp values(@fname,@lname,@gender,@email,@address,@username,@password)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@fname", FirstNameTextBox.Text);
            cmd.Parameters.AddWithValue("@lname", LastNameTextBox.Text);
            cmd.Parameters.AddWithValue("@gender", GenderDropDownList.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@email", EmailTextBox.Text);
            cmd.Parameters.AddWithValue("@address", AddressTextBox.Text);
            cmd.Parameters.AddWithValue("@username", UsernameTextBox.Text);
            cmd.Parameters.AddWithValue("@password", PasswordTextBox.Text);
            conn.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                ClientScript.RegisterStartupScript(typeof(Page), "Scripts", "alert('SignUp Successfull.. Username is: "+UsernameTextBox.Text+" and Password is: "+PasswordTextBox.Text+" ');",true);
                ClearControls();

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('SignUp failed')</script>");
            }
            conn.Close();





        }
        void ClearControls()
        {
            FirstNameTextBox.Text = LastNameTextBox.Text = EmailTextBox.Text = AddressTextBox.Text = UsernameTextBox.Text = PasswordTextBox.Text = ConfirmPassTextBox.Text = "";
            GenderDropDownList.ClearSelection();
        }
    }
}