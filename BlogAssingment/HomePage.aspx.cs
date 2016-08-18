using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogAssingment
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["user"];
            if (cookie == null)
            {
                return;
            }

            string[] objValues = cookie.Value.Replace(" ", "").Replace("{", "").Replace("}", "").Replace("\"", "").Split(':', ','); // { "username" : "username", "password" : "password" }
            
            string username = objValues[1];
            string password = objValues[3];

            if(GetData.SignIn(username, password))
            {
                try
                {
                    Response.Redirect("MainPage.aspx");
                } 
                catch(Exception ex)
                {
                    ex.Message.ToString();
                }
            }
            else
            {

            }
        }
    }
}