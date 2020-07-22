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
            memberid_input_v.Validate();
            if (memberid_input_v.IsValid)
            {
                getMemberByID();
            }
        }

        protected void active_btn_Click(object sender, EventArgs e)
        {
            memberid_input_v.Validate();
            if (memberid_input_v.IsValid)
            {
                if (getMemberByID() == true)
                {
                    setMemberStatus("active");
                }
            }
        }

        protected void pending_btn_Click(object sender, EventArgs e)
        {
            memberid_input_v.Validate();
            if (memberid_input_v.IsValid)
            {
                if (getMemberByID() == true)
                {
                    setMemberStatus("pending");
                }
            }
        }

        protected void suspend_btn_Click(object sender, EventArgs e)
        {
            memberid_input_v.Validate();
            if (memberid_input_v.IsValid)
            {
                if (getMemberByID() == true)
                {
                    setMemberStatus("suspended");
                }
            } 
        }

        protected void delete_user_btn_Click(object sender, EventArgs e)
        {
            memberid_input_v.Validate();
            if (memberid_input_v.IsValid)
            {
                if (getMemberByID() == true)
                {
                    deleteUser();
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

        private bool getMemberByID()
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

        private void setMemberStatus(string status)
        {
            try
            {
                DataTable dt = SqlDataTable("UPDATE member SET account_status = @account_status WHERE member_id = @member_id AND account_privilege = @account_privilege",
                    new Dictionary<string, object>
                    {
                        { "account_status", status },
                        { "member_id", memberid_input.Text.Trim() },
                        { "account_privilege", "member" }
                    }
                );

                getMemberByID();
                member_list.DataBind();

            }
            catch (Exception ex)
            {
                
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
                
                throw ex;
            }
        }
    }
}