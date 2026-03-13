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
    public partial class OrdersPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ECommerce_DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }
        void LoadOrders()
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT OrderId, OrderDate, TotalAmount, Status
            FROM Orders
            WHERE UserId = @UserId
            ORDER BY OrderDate DESC", con);
                cmd.Parameters.AddWithValue("@UserId", userId);
                GridViewOrders.DataSource = cmd.ExecuteReader();
                GridViewOrders.DataBind();
            }
        }
    }
}