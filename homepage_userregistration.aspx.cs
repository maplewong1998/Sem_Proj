using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sem_Proj
{
    public partial class userregistration : System.Web.UI.Page
    {
        private static string con = ConfigurationManager.ConnectionStrings["conn_db"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sign_up_btn_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                if (CheckMemberExists())
                {
                    Response.Write("<script>alert('User Existed!');</script>");
                }
                else
                {
                    SignUp();
                }
            }        
        }

        private bool CheckMemberExists()
        {
            try
            {
                DataTable dt = SqlDataTable("SELECT * FROM member WHERE member_id= @member_id",
                    new Dictionary<string, object>
                    {
                        { "member_id", username_input.Text.Trim() }
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

        private static string GenerateSalt()
        {
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] buff = new byte[64];
            rng.GetBytes(buff);
            return Convert.ToBase64String(buff);
        }

        private static String GenerateSaltedHash(String password, String salt)
        {
            HashAlgorithm algorithm = new SHA256Managed();
            byte[] password_byte = Encoding.ASCII.GetBytes(password);
            byte[] salt_byte = Encoding.ASCII.GetBytes(salt);

            byte[] plainTextWithSaltBytes = new byte[password_byte.Length + salt_byte.Length];

            for (int i = 0; i < password_byte.Length; i++)
            {
                plainTextWithSaltBytes[i] = password_byte[i];
            }
            for (int i = 0; i < salt_byte.Length; i++)
            {
                plainTextWithSaltBytes[password_byte.Length + i] = salt_byte[i];
            }

            return Convert.ToBase64String(algorithm.ComputeHash(plainTextWithSaltBytes));
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

        private void SignUp() 
        {            
            try
            {
                SqlConnection conn_db = new SqlConnection(con);
                if (conn_db.State == ConnectionState.Closed)
                {
                    conn_db.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO member (full_name, dob, contact_no, email, state, city, postcode, full_address, member_id, salt, hash, account_status, account_privilege) " +
                    "VALUES (@full_name, @dob, @contact_no, @email, @state, @city, @postcode, @full_address, @member_id, @salt, @hash, @account_status, @account_privilege)", conn_db);

                cmd.Parameters.AddWithValue("@full_name", name_input.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", birthdate_input.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", phone_input.Text.Trim());
                cmd.Parameters.AddWithValue("@email", email_input.Text.Trim());
                cmd.Parameters.AddWithValue("@state", state_input.Text.Trim());
                cmd.Parameters.AddWithValue("@city", city_input.Text.Trim());
                cmd.Parameters.AddWithValue("@postcode", postnumber_input.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", address_input.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", username_input.Text.Trim());

                string password = password_input_registration.Text.Trim();
                string salt = GenerateSalt();
                string hash = GenerateSaltedHash(password, salt);

                cmd.Parameters.AddWithValue("@salt", salt);
                cmd.Parameters.AddWithValue("@hash", hash);
                cmd.Parameters.AddWithValue("@account_status", "pending");
                cmd.Parameters.AddWithValue("@account_privilege", "member");

                cmd.ExecuteNonQuery();
                conn_db.Close();
                Response.Write("<script>alert('Sign Up Successful!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                throw ex;
            }            
        }
    }
}