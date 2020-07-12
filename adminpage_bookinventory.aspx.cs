using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sem_Proj
{
    public partial class adminpage_bookinventory : System.Web.UI.Page
    {
        private static string con = ConfigurationManager.ConnectionStrings["conn_db"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            book_list.DataBind();
        }

        protected void addbtn_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                if (CheckBookExists())
                {
                    Response.Write("<script>alert('Book Existed!');</script>");
                }
                else
                {
                    AddNewBook();
                }
            }
        }

        private bool CheckBookExists()
        {
            try
            {
                DataTable dt = SqlDataTable("SELECT * FROM book WHERE book_id= @book_id",
                    new Dictionary<string, object>
                    {
                        { "book_id", isbn_input.Text.Trim() }
                    }
                );

                if (dt.Rows.Count == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                throw ex;
            }
        }

        private static string GetSelectedValue(ListBox List)
        {
            string selectedItem = "";
            if (List.Items.Count > 0)
            {
                foreach (int i in List.GetSelectedIndices())
                {
                    selectedItem = selectedItem + List.Items[i] + ", ";
                }
                selectedItem = selectedItem.Remove(selectedItem.Length - 2);
            }
            return selectedItem;
        }

        private string UploadImage(FileUpload uploadedimg)
        {
            string filepath = "";
            string filename = Path.GetFileName(uploadedimg.PostedFile.FileName);
            uploadedimg.SaveAs(Server.MapPath("resources/books/" + filename));
            return filepath = "~/resources/books/" + filename;
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

        private void AddNewBook()
        {
            string SelectedGenre = GetSelectedValue(genre_dropdown);
            string UploadedImg = UploadImage(image_uploader);
            try
            {
                SqlConnection conn_db = new SqlConnection(con);
                if (conn_db.State == ConnectionState.Closed)
                {
                    conn_db.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book (book_id, book_name, genre, author_name, publisher_name, publish_date, language, edition, book_cost, no_of_pages, book_description, actual_stock, current_stock, book_img) " +
                    "VALUES (@book_id, @book_name, @genre, @author_name, @publisher_name, @publisher_date, @language, @edition, @book_cost, @no_of_pages, @book_description, @actual_stock, @current_stock, @book_img)", conn_db);

                cmd.Parameters.AddWithValue("@book_id", isbn_input.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", bookname_input.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", SelectedGenre);
                cmd.Parameters.AddWithValue("@author_name", authorname_input.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", publishername_input.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_date", publishdate_input.Text.Trim());
                cmd.Parameters.AddWithValue("@language", language_dropdown.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", edition_input.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", cost_input.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", pages_input.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", description_input.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", actualstock_input.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", actualstock_input.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img", UploadedImg);


                cmd.ExecuteNonQuery();
                conn_db.Close();
                Response.Write("<script>alert('Book added successfully!');</script>");
                book_list.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}