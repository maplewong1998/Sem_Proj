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
    public partial class userprofile : System.Web.UI.Page
    {
        private static string con = ConfigurationManager.ConnectionStrings["conn_db"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetUserProfile();
            borrow_history.DataBind();
        }

        protected void update_profile_btn_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                UpdateProfile();
            }
        }

        private bool GetUserProfile()
        {
            try
            {
                DataTable dt = SqlDataTable("SELECT full_name, dob, contact_no, email, state, city, postcode, full_address, account_status, account_privilege FROM member WHERE member_id= @member_id",
                    new Dictionary<string, object>
                    {
                        { "member_id", Session["username"] }
                    }
                );

                if (dt.Rows.Count == 1)
                {
                    DataRow row = dt.Rows[0];

                    username_input.Text = Session["username"].ToString();
                    name_input.Text = row["full_name"].ToString();
                    birthdate_input.Text = row["dob"].ToString();
                    phone_input.Text = row["contact_no"].ToString();
                    email_input.Text = row["email"].ToString();
                    state_input.Text = row["state"].ToString();
                    city_input.Text = row["city"].ToString();
                    postnumber_input.Text = row["postcode"].ToString();
                    address_input.Text = row["full_address"].ToString();

                    account_status.Text = row["account_status"].ToString();

                    if (row["account_status"].ToString().Equals("active"))
                    {
                        account_status.Attributes["class"] = "badge badge-pill badge-success";
                    }
                    else if (row["account_status"].ToString().Equals("pending"))
                    {
                        account_status.Attributes["class"] = "badge badge-pill badge-warning";
                    }
                    else if (row["account_status"].ToString().Equals("suspended"))
                    {
                        account_status.Attributes["class"] = "badge badge-pill badge-danger";
                    }
                    else
                    {
                        account_status.Attributes["class"] = "badge badge-pill badge-info";
                    }

                    return true;

                }
                else
                {
                    Response.Write("<script>alert('User doesn't exist.');</script>");
                    return false;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void UpdateProfile()
        {

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

        protected void BorrowHistory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                string status = e.Row.Cells[4].Text;
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    if (status.Equals("active"))
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleGreen;
                    }
                    else if (status.Equals("returned"))
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleGoldenrod;
                    }
                    else if (status.Equals("due"))
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}