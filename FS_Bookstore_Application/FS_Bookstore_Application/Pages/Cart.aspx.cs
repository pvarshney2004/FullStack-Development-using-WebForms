using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FS_Bookstore_Application.Pages
{
    public partial class Cart : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["BookStoreDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
            SELECT 
                c.CartId,
                b.Title,
                b.Author,
                b.Price,
                c.Quantity,
                (b.Price * c.Quantity) AS TotalPrice
            FROM Cart c
            INNER JOIN Books b ON c.BookId = b.BookId
            WHERE c.UserId = @UserId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewCart.DataSource = dt;
                GridViewCart.DataBind();
            }
        }
        protected void GridViewCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveItem")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int cartId = Convert.ToInt32(GridViewCart.DataKeys[rowIndex].Value);

                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "DELETE FROM Cart WHERE CartId=@CartId";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@CartId", cartId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadCart();
            }
        }
    }
}