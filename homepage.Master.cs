using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sem_Proj
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals("") || Session["role"].Equals(null))
                {
                    sign_up_menu.Visible = true;
                    sign_in_menu.Visible = true;
                    sign_out_menu.Visible = false;
                    hello_menu_admin.Visible = false;
                    hello_menu_member.Visible = false;
                }
                else if (Session["role"].Equals("member"))
                {
                    hello_menu_member.Items[0].Text = "Hello, member " + Session["username"].ToString();
                    sign_up_menu.Visible = false;
                    sign_in_menu.Visible = false;
                    sign_out_menu.Visible = true;
                    hello_menu_admin.Visible = false;
                    hello_menu_member.Visible = true;
                }
                else if (Session["role"].Equals("admin"))
                {
                    hello_menu_admin.Items[0].Text = "Hello, admin " + Session["username"].ToString();
                    sign_up_menu.Visible = false;
                    sign_in_menu.Visible = false;
                    sign_out_menu.Visible = true;
                    hello_menu_admin.Visible = true;
                    hello_menu_member.Visible = false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void sign_up_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage_userregistration.aspx");
        }

        protected void sign_in_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage_userlogin.aspx");
        }

        protected void sign_out_menu_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("homepage.aspx");
        }
    }
}