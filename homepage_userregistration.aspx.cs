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
    public partial class userregistration : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["conn_db"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sign_up_btn_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid == true)
            {
                try
                {
                    SqlConnection conn_db = new SqlConnection(con);
                    if (conn_db.State == ConnectionState.Closed)
                    {
                        conn_db.Open();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO member (full_name, dob, contact_no, email, state, city, postcode, full_address, member_id, password, account_status, account_privilege) " +
                        "VALUES (@full_name, @dob, @contact_no, @email, @state, @city, @postcode, @full_address, @member_id, @password, @account_status, @account_privilege)", conn_db);

                    cmd.Parameters.AddWithValue("@full_name", name_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", birthdate_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", phone_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", email_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@state", state_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@city", city_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@postcode", postnumber_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_address", address_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@member_id", username_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", password_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@account_status", "pending");
                    cmd.Parameters.AddWithValue("@account_privilege", "admin");

                    cmd.ExecuteNonQuery();
                    conn_db.Close();

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}