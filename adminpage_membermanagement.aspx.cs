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
    public partial class adminpage_membermanagement : System.Web.UI.Page
    {
        private static string con = ConfigurationManager.ConnectionStrings["conn_db"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            member_list.DataBind();
        }

        protected void search_btn_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }

        protected void active_btn_Click(object sender, EventArgs e)
        {
            setMemberActive();
        }

        protected void pending_btn_Click(object sender, EventArgs e)
        {
            setMemberPending();
        }

        protected void suspend_btn_Click(object sender, EventArgs e)
        {
            setMemberSuspended();
        }

        protected void delete_user_btn_Click(object sender, EventArgs e)
        {
            deleteUser();
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

        private void getMemberByID()
        {
            try
            {
                DataTable dt = SqlDataTable("SELECT full_name, dob, contact_no, email, state, city, postcode, full_address, account_status, account_privilege FROM member WHERE member_id= @member_id",
                    new Dictionary<string, object>
                    {
                        { "member_id", memberid_input.Text.Trim() }
                    }
                );

                if (dt.Rows.Count == 1)
                {
                    DataRow row = dt.Rows[0];

                    accounstatus_input.Text = row["account_status"].ToString();
                    name_input.Text = row["full_name"].ToString();
                    birthdate_input.Text = row["dob"].ToString();
                    privilege.Text = row["account_privilege"].ToString();
                    phone_input.Text = row["contact_no"].ToString();
                    email_input.Text = row["email"].ToString();
                    state_input.Text = row["state"].ToString();
                    city_input.Text = row["city"].ToString();
                    postnumber_input.Text = row["postcode"].ToString();
                    address_input.Text = row["full_address"].ToString();

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

        private void setMemberActive()
        {
            try
            {
                DataTable dt = SqlDataTable("UPDATE member SET account_status = @account_status WHERE member_id = @member_id AND account_privilege = @account_privilege",
                    new Dictionary<string, object>
                    {
                        { "account_status", "active" },
                        { "member_id", memberid_input.Text.Trim() },
                        { "account_privilege", "member" }
                    }
                );

                getMemberByID();
                member_list.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                throw ex;
            }
        }

        private void setMemberPending()
        {
            try
            {
                DataTable dt = SqlDataTable("UPDATE member SET account_status = @account_status WHERE member_id = @member_id AND account_privilege = @account_privilege",
                    new Dictionary<string, object>
                    {
                        { "account_status", "pending" },
                        { "member_id", memberid_input.Text.Trim() },
                        { "account_privilege", "member" }
                    }
                );

                getMemberByID();
                member_list.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                throw ex;
            }
        }

        private void setMemberSuspended()
        {
            try
            {
                DataTable dt = SqlDataTable("UPDATE member SET account_status = @account_status WHERE member_id = @member_id AND account_privilege = @account_privilege",
                    new Dictionary<string, object>
                    {
                        { "account_status", "suspended" },
                        { "member_id", memberid_input.Text.Trim() },
                        { "account_privilege", "member" }
                    }
                );

                getMemberByID();
                member_list.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                throw ex;
            }
        }

        private void deleteUser()
        {
            try
            {
                DataTable dt = SqlDataTable("DELETE FROM member WHERE member_id = @member_id AND account_privilege = @account_privilege",
                    new Dictionary<string, object>
                    {
                        { "member_id", memberid_input.Text.Trim() },
                        { "account_privilege", "member" }
                    }
                );

                Response.Redirect("adminpage_membermanagement.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                throw ex;
            }
        }
    }
}