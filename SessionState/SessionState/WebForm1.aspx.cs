using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SessionState
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            //Session.Add("user", UserTextBox.Text);
            Session["user"] = UserTextBox.Text;
            UserTextBox.Text = string.Empty;
            Response.Redirect("WebForm2.aspx");
        }
    }
}