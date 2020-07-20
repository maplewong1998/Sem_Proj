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
        private static string global_filepath;

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

        protected void findbook_btn_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                getBookById();
            }
        }

        protected void updatebtn_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                updateBookById();
            }
        }

        protected void deletebtn_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                deleteBookById();
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
                    selectedItem = selectedItem + List.Items[i] + ",";
                }
                selectedItem = selectedItem.Remove(selectedItem.Length - 2);
            }
            return selectedItem;
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
            string filename = Path.GetFileName(image_uploader.PostedFile.FileName);
            image_uploader.SaveAs(Server.MapPath("resources/books/" + filename));
            string filepath = "~/resources/books/" + filename;
            try
            {
                SqlConnection conn_db = new SqlConnection(con);
                if (conn_db.State == ConnectionState.Closed)
                {
                    conn_db.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book (book_id, book_name, genre, author_name, publisher_name, publish_date, language, edition, book_cost, no_of_pages, book_description, actual_stock, issued_books, book_img) " +
                    "VALUES (@book_id, @book_name, @genre, @author_name, @publisher_name, @publisher_date, @language, @edition, @book_cost, @no_of_pages, @book_description, @actual_stock, @issued_books, @book_img)", conn_db);

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
                cmd.Parameters.AddWithValue("@issued_books", 0);
                cmd.Parameters.AddWithValue("@book_img", filepath);


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

        private void getBookById()
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
                    DataRow row = dt.Rows[0];

                    bookname_input.Text = row["book_name"].ToString();
                    language_dropdown.Text = row["language"].ToString();
                    authorname_input.Text = row["author_name"].ToString();
                    publishername_input.Text = row["publisher_name"].ToString();
                    publishdate_input.Text = row["publish_date"].ToString();
                    edition_input.Text = row["edition"].ToString();
                    cost_input.Text = row["book_cost"].ToString();
                    pages_input.Text = row["no_of_pages"].ToString();
                    actualstock_input.Text = row["actual_stock"].ToString();
                    issuedbook_show.Text = row["issued_books"].ToString();
                    description_input.Text = row["book_description"].ToString();
                    int currentstock_val = int.Parse(row["actual_stock"].ToString()) - int.Parse(row["issued_books"].ToString());
                    currentstock_show.Text = currentstock_val.ToString();

                    genre_dropdown.ClearSelection();
                    string[] genre = row["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < genre_dropdown.Items.Count; j++)
                        {
                            if (genre_dropdown.Items[j].ToString() == genre[i])
                            {
                                genre_dropdown.Items[j].Selected = true;
                            }
                        }
                    }

                    global_filepath = row["book_img"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('User doesn't exist.');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                throw ex;
            }
        }

        private void updateBookById()
        {
            try
            {
                string SelectedGenre = GetSelectedValue(genre_dropdown);
                string filepath = "";
                string filename = Path.GetFileName(image_uploader.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = global_filepath;
                }
                else{
                    image_uploader.SaveAs(Server.MapPath("resource/books/" + filename));
                    filepath = "~/resource/books/" + filename;
                }

                DataTable dt = SqlDataTable("UPDATE book SET book_name = @book_name, genre = @genre, author_name = @author_name, publisher_name = @publisher_name, publish_date = @publish_date, language = @language, edition = @edition, book_cost = @book_cost, no_of_pages = @no_of_pages, book_description = @book_description, actual_stock = @actual_stock, book_img = @book_img WHERE book_id= @book_id",
                    new Dictionary<string, object>
                    {
                        { "book_name", bookname_input.Text.Trim() },
                        { "genre", SelectedGenre },
                        { "author_name", authorname_input.Text.Trim() },
                        { "publisher_name", publishername_input.Text.Trim() },
                        { "publish_date", publishdate_input.Text.Trim() },
                        { "language", language_dropdown.SelectedItem.Value },
                        { "edition", edition_input.Text.Trim() },
                        { "book_cost", cost_input.Text.Trim() },
                        { "no_of_pages", pages_input.Text.Trim() },
                        { "book_description", description_input.Text.Trim() },
                        { "actual_stock", actualstock_input.Text.Trim() },
                        { "book_img", filepath },
                        { "book_id", isbn_input.Text.Trim() }
                    }
                );

                book_list.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                throw ex;
            }
        }

        private void deleteBookById()
        {
            try
            {
                DataTable dt = SqlDataTable("DELETE FROM book WHERE book_id = @book_id",
                    new Dictionary<string, object>
                    {
                        { "book_id", isbn_input.Text.Trim() }
                    }
                );

                Response.Redirect("adminpage_bookinventory.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                throw ex;
            }
        }
    }
}