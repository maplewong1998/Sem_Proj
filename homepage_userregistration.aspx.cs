using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace Sem_Proj
{
    public partial class userregistration : System.Web.UI.Page
    {
        string conn_db = ConfigurationManager.ConnectionStrings["conn_db"].ConnectionString;

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
                    SqlConnection con = new SqlConnection(conn_db);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO member (full_name, dob, contact_no, email, state, city, postcode, full_address, member_id, salt, hash, account_status, account_privilege) " +
                        "VALUES (@full_name, @dob, @contact_no, @email, @state, @city, @postcode, @full_address, @member_id, @salt, @hash, @account_status, @account_privilege)", con);



                    cmd.Parameters.AddWithValue("@full_name", name_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", birthdate_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", phone_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", email_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@state", state_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@city", city_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@postcode", postnumber_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_address", address_input.Text.Trim());
                    cmd.Parameters.AddWithValue("@member_id", username_input.Text.Trim());

                    String password = password_input.Text.Trim();
                    String salt = GenerateSalt();
                    String hash = GenerateSaltedHash(password, salt);

                    cmd.Parameters.AddWithValue("@salt", salt);
                    cmd.Parameters.AddWithValue("@hash", hash);
                    cmd.Parameters.AddWithValue("@account_status", "active");
                    cmd.Parameters.AddWithValue("@account_privilege", "admin");

                    con.Close();

                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    throw ex;
                }
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

            byte[] plainTextWithSaltBytes =
              new byte[password_byte.Length + salt_byte.Length];

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
    }
}