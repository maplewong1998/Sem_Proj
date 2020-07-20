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
        private static string con = ConfigurationManager.ConnectionStrings["conn_db"].ConnectionString;

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

        private void SignIn()
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
                    DataRow row = dt.Rows[0];

                    if(GenerateSaltedHash(password_input.Text.Trim(), row["salt"].ToString()) == row["hash"].ToString())
                    {
                        Session["username"] = row["member_id"].ToString();
                        Session["fullname"] = row["full_name"].ToString();
                        Session["role"] = row["account_privilege"].ToString();
                        Session["status"] = row["account_status"].ToString();
                        Response.Write("<script>alert('Login successful!');</script>");
                        Response.Redirect("homepage.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid credentials!');</script>");
                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials!');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                throw ex;
            }
        }
    }
}