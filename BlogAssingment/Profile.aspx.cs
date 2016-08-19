using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogAssingment
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["user"];

            if (!GetData.ValidateCookie(cookie) || cookie == null)
            {
                try
                {
                    Response.Redirect("MainPage.aspx");
                }
                catch (Exception ex)
                {
                    ex.Message.ToString();
                }
            }
        }
    }
}