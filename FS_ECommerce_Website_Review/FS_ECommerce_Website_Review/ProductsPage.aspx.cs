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
    public partial class ProductsPage : System.Web.UI.Page
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
                LoadProducts();
            }
        }
        void LoadProducts()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "SELECT * FROM Products";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridViewProducts.DataSource = dt;
            GridViewProducts.DataBind();
        }
        protected void GridViewProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int productId = Convert.ToInt32(GridViewProducts.DataKeys[rowIndex].Value);
                int userId = Convert.ToInt32(Session["UserId"]);

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // checking if product already exists in cart
                    string checkQuery = "SELECT Quantity FROM Cart WHERE UserId=@UserId AND ProductId=@ProductId";
                    SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                    checkCmd.Parameters.AddWithValue("@UserId", userId);
                    checkCmd.Parameters.AddWithValue("@ProductId", productId);

                    object result = checkCmd.ExecuteScalar();
                    if (result != null)
                    {
                        // Update Quantity
                        string updateQuery = "UPDATE Cart SET Quantity = Quantity + 1 WHERE UserId=@UserId AND ProductId=@ProductId";
                        SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                        updateCmd.Parameters.AddWithValue("@UserId", userId);
                        updateCmd.Parameters.AddWithValue("@ProductId", productId);
                        updateCmd.ExecuteNonQuery();
                    }
                    else
                    {
                        // Insert New
                        string insertQuery = "INSERT INTO Cart (UserId, ProductId, Quantity) VALUES (@UserId, @ProductId, 1)";
                        SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                        insertCmd.Parameters.AddWithValue("@UserId", userId);
                        insertCmd.Parameters.AddWithValue("@ProductId", productId);
                        insertCmd.ExecuteNonQuery();
                    }
                }
                Response.Write("<script>alert('Product Added To Cart!')</script>");
            }
        }
    }
}