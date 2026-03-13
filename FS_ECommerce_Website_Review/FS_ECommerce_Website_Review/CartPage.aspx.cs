using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FS_ECommerce_Website_Review
{
    public partial class CartPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ECommerce_DB"].ConnectionString;
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
                con.Open();
                string query = @"
            SELECT 
                c.CartId,
                p.ProductName,
                p.Price,
                c.Quantity,
                (p.Price * c.Quantity) AS TotalPrice
            FROM Cart c
            INNER JOIN Products p ON c.ProductId = p.ProductId
            WHERE c.UserId = @UserId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewCart.DataSource = dt;
                GridViewCart.DataBind();

                // calculating total price
                string totalQuery = @"
            SELECT SUM(p.Price * c.Quantity)
            FROM Cart c
            INNER JOIN Products p ON c.ProductId = p.ProductId
            WHERE c.UserId = @UserId";
                SqlCommand totalCmd = new SqlCommand(totalQuery, con);
                totalCmd.Parameters.AddWithValue("@UserId", userId);
                object total = totalCmd.ExecuteScalar();
                lblGrandTotal.Text = "Grand Total: ₹ " + (total != null ? total.ToString() : "0");
            }
        }
        protected void GridViewCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveItem")
            {
                int cartId = Convert.ToInt32(e.CommandArgument);
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM Cart WHERE CartId=@CartId", con);
                    cmd.Parameters.AddWithValue("@CartId", cartId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                LoadCart();
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction();
                SqlCommand totalCmd = new SqlCommand(@"
                SELECT SUM(p.Price * c.Quantity)
                FROM Cart c
                INNER JOIN Products p ON c.ProductId = p.ProductId
                WHERE c.UserId = @UserId", con, transaction);

                totalCmd.Parameters.AddWithValue("@UserId", userId);
                int totalAmount = Convert.ToInt32(totalCmd.ExecuteScalar());

                // insert into Orders
                SqlCommand orderCmd = new SqlCommand(@"
                INSERT INTO Orders (UserId, TotalAmount)
                OUTPUT INSERTED.OrderId
                VALUES (@UserId, @TotalAmount)", con, transaction);

                orderCmd.Parameters.AddWithValue("@UserId", userId);
                orderCmd.Parameters.AddWithValue("@TotalAmount", totalAmount);

                int orderId = (int)orderCmd.ExecuteScalar();

                // inserting into OrderDetails
                SqlCommand detailCmd = new SqlCommand(@"
                INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price)
                SELECT @OrderId, c.ProductId, c.Quantity, p.Price
                FROM Cart c
                INNER JOIN Products p ON c.ProductId = p.ProductId
                WHERE c.UserId = @UserId", con, transaction);

                detailCmd.Parameters.AddWithValue("@OrderId", orderId);
                detailCmd.Parameters.AddWithValue("@UserId", userId);

                detailCmd.ExecuteNonQuery();

                // clearing cart
                SqlCommand clearCart = new SqlCommand("DELETE FROM Cart WHERE UserId=@UserId", con, transaction);
                clearCart.Parameters.AddWithValue("@UserId", userId);
                clearCart.ExecuteNonQuery();

                transaction.Commit();
                Response.Redirect("OrderSuccess.aspx?OrderId=" + orderId);
            }
        }
    }
}