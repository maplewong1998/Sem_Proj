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
    public partial class userlogin : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["conn_db"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid == true)
            {
                SignIn();
            }
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

        private void SignIn()
        {
            try
            {
                SqlConnection conn_db = new SqlConnection(con);
                if (conn_db.State == ConnectionState.Closed)
                {
                    conn_db.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member WHERE member_id = '" + username_input.Text.Trim() + "'", conn_db);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        if(GenerateSaltedHash(password_input.Text.Trim(), dr.GetValue(9).ToString()) == dr.GetValue(10).ToString())
                        {
                            Response.Write("<script>alert('Login successful!');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid password!');</script>");
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid username!');</script>");
                }
                dr.Close();
                conn_db.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                throw ex;
            }
        }
    }
}