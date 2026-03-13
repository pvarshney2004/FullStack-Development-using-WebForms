using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FS_ECommerce_Website_Review
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["FullName"] != null)
            {
                Label1.Text = Session["FullName"].ToString();
            }
        }

        protected void LogoutButton_Click1(object sender, EventArgs e)
        {
            if(Session["FullName"] != null)
            {
                Session.Clear();
                Response.Redirect("Login.aspx");
            }
        }
    }
}