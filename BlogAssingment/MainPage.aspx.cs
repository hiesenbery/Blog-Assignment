using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogAssingment
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["user"];
            if (cookie == null || !GetData.ValidateCookie(cookie))
            {
                try
                {
                    Response.Redirect("HomePage.aspx");
                }
                catch (Exception ex)
                {
                    ex.Message.ToString();
                }
            }
        }
    }
}