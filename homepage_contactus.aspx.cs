using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sem_Proj
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    CommentBox.Visible = false;
                }
                else if (Session["role"].Equals("member"))
                {
                    CommentBox.Visible = true;
                }
                else if (Session["role"].Equals("admin"))
                {
                    CommentBox.Visible = true;

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}