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
            issued_book_list.DataBind();
        }

        protected void issueid_btn_Click(object sender, EventArgs e)
        {
            issueid_v.Validate();
            if (issueid_v.IsValid)
            {
                getIssue();
            }
        }

        protected void active_btn_Click(object sender, EventArgs e)
        {
            status_v.Validate();
            if (status_v.IsValid)
            {
                if (CheckIssueExists())
                {
                    if (CheckIssueStatus().Equals("due"))
                    {
                        setIssueStatus("active");
                        getIssue();
                        issued_book_list.DataBind();
                    }
                    else if (CheckIssueStatus().Equals("returned"))
                    {
                        setIssueStatus("active");
                        issuedBookP1();
                        getIssue();
                        issued_book_list.DataBind();
                    }
                }
            }
        }
        protected void returned_btn_Click(object sender, EventArgs e)
        {
            status_v.Validate();
            if (status_v.IsValid)
            {
                if (CheckIssueExists())
                {
                    if (CheckIssueStatus().Equals("active") || CheckIssueStatus().Equals("due"))
                    {
                        setIssueStatus("returned");
                        issuedBookM1();
                        getIssue();
                        issued_book_list.DataBind();
                    }
                }
            }
        }
        protected void due_btn_Click(object sender, EventArgs e)
        {
            status_v.Validate();
            if (status_v.IsValid)
            {
                if (CheckIssueExists())
                {
                    if (CheckIssueStatus().Equals("active"))
                    {
                        setIssueStatus("due");
                        getIssue();
                        issued_book_list.DataBind();
                    }
                    else if (CheckIssueStatus().Equals("returned"))
                    {
                        setIssueStatus("due");
                        issuedBookP1();
                        getIssue();
                        issued_book_list.DataBind();
                    }
                }
            }
        }

        protected void Issue_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                newIssue();
                issued_book_list.DataBind();
            }
        }

        private bool CheckIssueExists()
        {
            try
            {
                DataTable dt = SqlDataTable("SELECT * FROM book_issue WHERE issue_id = @issue_id",
                    new Dictionary<string, object>
                    {
                        { "issue_id", issueid_input.Text.Trim() }
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
                throw ex;
            }
        }

        private string CheckIssueStatus()
        {
            try
            {
                DataTable dt = SqlDataTable("SELECT issue_status FROM book_issue WHERE issue_id = @issue_id",
                    new Dictionary<string, object>
                    {
                        { "issue_id", issueid_input.Text.Trim() }
                    }
                );

                DataRow row = dt.Rows[0];
                return row["issue_status"].ToString();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private bool getMemberName()
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
                    return true;
                }
                else
                {
                    Response.Write("<script>alert('Member does not exist.');</script>");
                    return false;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private bool getBookName()
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
                    return true;
                }
                else
                {
                    Response.Write("<script>alert('Book does not exist.');</script>");
                    return false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void getIssue()
        {
            try
            {
                DataTable dt = SqlDataTable("SELECT * FROM book_issue WHERE issue_id = @issue_id",
                    new Dictionary<string, object>
                    {
                        { "issue_id", issueid_input.Text.Trim() }
                    }
                );

                if (dt.Rows.Count == 1)
                {
                    DataRow row = dt.Rows[0];
                    member_id.Text = row["member_id"].ToString();
                    book_id.Text = row["book_id"].ToString();
                    start_date.Text = row["issue_date"].ToString();
                    end_date.Text = row["due_date"].ToString();
                    status.Text = row["issue_status"].ToString();
                    getBookName();
                    getMemberName();
                }
                else
                {
                    Response.Write("<script>alert('Issue does not exist.');</script>");
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

        private void setIssueStatus(String status)
        {
            try
            {
                DataTable dt = SqlDataTable("UPDATE book_issue SET issue_status = @issue_status WHERE issue_id = @issue_id",
                    new Dictionary<string, object>
                    {
                        { "issue_status", status },
                        { "issue_id", issueid_input.Text.Trim() }
                    }
                );
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void newIssue()
        {
            if (getMemberName() && getBookName())
            {
                try
                {
                    SqlConnection conn_db = new SqlConnection(con);
                    if (conn_db.State == ConnectionState.Closed)
                    {
                        conn_db.Open();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO book_issue (issue_id, member_id, book_id, issue_date, due_date, issue_status) " +
                        "VALUES (@issue_id, @member_id, @book_id, @issue_date, @due_date, @issue_status)", conn_db);

                    cmd.Parameters.AddWithValue("@issue_id", issueid_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@member_id", member_id.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_id", book_id.Text.Trim());
                    cmd.Parameters.AddWithValue("@issue_date", start_date.Text.Trim());
                    cmd.Parameters.AddWithValue("@due_date", end_date.Text.Trim());
                    cmd.Parameters.AddWithValue("@issue_status", "active");

                    cmd.ExecuteNonQuery();
                    conn_db.Close();
                    issuedBookP1();
                    Response.Write("<script>alert('Issue Successful!');</script>");
                }
                catch (Exception ex)
                {
                    throw ex;
                }
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