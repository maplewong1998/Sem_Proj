using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sem_Proj
{
    public partial class adminpage_booklending : System.Web.UI.Page
    {
        private static string con = ConfigurationManager.ConnectionStrings["conn_db"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void issueid_btn_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                
            }
        }

        protected void returned_btn_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {

            }
        }
        protected void returneddue_btn_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {

            }
        }
        protected void due_btn_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {

            }
        }

        protected void Issue_Click(object sender, EventArgs e)
        {

        }

        private void getMemberName()
        {
            try
            {
                DataTable dt = SqlDataTable("SELECT full_name FROM member WHERE member_id = @member_id",
                    new Dictionary<string, object>
                    {
                        { "member_id", member_id.Text.Trim() }
                    }
                );

                if (dt.Rows.Count == 1)
                {
                    DataRow row = dt.Rows[0];
                    member_name.Text = row["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Member does not exist.');</script>");
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void getBookName()
        {
            try
            {
                DataTable dt = SqlDataTable("SELECT book_name FROM book WHERE book_id = @book_id",
                    new Dictionary<string, object>
                    {
                        { "book_id", book_id.Text.Trim() }
                    }
                );

                if (dt.Rows.Count == 1)
                {
                    DataRow row = dt.Rows[0];
                    book_name.Text = row["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Book does not exist.');</script>");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void issuedBookP1()
        {
            try
            {
                DataTable dt = SqlDataTable("UPDATE book SET issued_books = issued_books + 1 WHERE book_id = @book_id",
                    new Dictionary<string, object>
                    {
                        { "book_id", book_id.Text.Trim() }
                    }
                );
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void issuedBookM1()
        {
            try
            {
                DataTable dt = SqlDataTable("UPDATE book SET issued_books = issued_books - 1 WHERE book_id = @book_id",
                    new Dictionary<string, object>
                    {
                        { "book_id", book_id.Text.Trim() }
                    }
                );
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static DataTable SqlDataTable(string sql, IDictionary<string, object> values)
        {
            using (SqlConnection conn = new SqlConnection(con))
            using (SqlCommand cmd = conn.CreateCommand())
            {
                conn.Open();
                cmd.CommandText = sql;
                foreach (KeyValuePair<string, object> item in values)
                {
                    cmd.Parameters.AddWithValue("@" + item.Key, item.Value);
                }

                DataTable table = new DataTable();
                using (var reader = cmd.ExecuteReader())
                {
                    table.Load(reader);
                    return table;
                }
            }
        }
    }
}