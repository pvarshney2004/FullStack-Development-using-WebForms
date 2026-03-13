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
    public partial class Books : System.Web.UI.Page
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
                LoadBooks();
            }
        }
        void LoadBooks()
        {
            // Code to load books from the database and bind to a control (e.g., GridView)
            SqlConnection con = new SqlConnection(cs);
            string query = "SELECT * FROM Books";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();

            da.Fill(dt);
            GridViewBooks.DataSource = dt;
            GridViewBooks.DataBind();
        }
        protected void GridViewBooks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int bookId = Convert.ToInt32(GridViewBooks.DataKeys[rowIndex].Value);
                int userId = Convert.ToInt32(Session["UserId"]);

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Check if book already exists in cart
                    string checkQuery = "SELECT Quantity FROM Cart WHERE UserId=@UserId AND BookId=@BookId";
                    SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                    checkCmd.Parameters.AddWithValue("@UserId", userId);
                    checkCmd.Parameters.AddWithValue("@BookId", bookId);

                    object result = checkCmd.ExecuteScalar();

                    if (result != null)
                    {
                        // Update Quantity
                        string updateQuery = "UPDATE Cart SET Quantity = Quantity + 1 WHERE UserId=@UserId AND BookId=@BookId";
                        SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                        updateCmd.Parameters.AddWithValue("@UserId", userId);
                        updateCmd.Parameters.AddWithValue("@BookId", bookId);
                        updateCmd.ExecuteNonQuery();
                    }
                    else
                    {
                        // Insert New
                        string insertQuery = "INSERT INTO Cart (UserId, BookId, Quantity) VALUES (@UserId, @BookId, 1)";
                        SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                        insertCmd.Parameters.AddWithValue("@UserId", userId);
                        insertCmd.Parameters.AddWithValue("@BookId", bookId);
                        insertCmd.ExecuteNonQuery();
                    }
                }

                Response.Write("<script>alert('Book Added To Cart!')</script>");
            }
        }
    }
}