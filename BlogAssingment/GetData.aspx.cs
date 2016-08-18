using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogAssingment
{
    public partial class GetData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static int InsertUser(string name, string gender, string dob, string country, string city, string zipCode, string phoneNo, string email, string username, string pws1)
        {

            int rowsAffected = 0;
            try
            {
                string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO [User] ([Profile_Name], [Profile_DOB], [Profile_Gender], [Profile_Country], [Profile_ZipCode], [Profile_City], [Profile_Email], [Profile_PhoneNo], [Username], [Password], [Profile_Image]) VALUES (@Profile_Name, @Profile_DOB, @Profile_Gender, @Profile_Country, @Profile_ZipCode, @Profile_City, @Profile_Email, @Profile_PhoneNo, @Username, @Password, @Profile_Image)", con))
                    {

                        cmd.CommandType = CommandType.Text;
                        //cmd.Parameters.Add(new SqlParameter("@ProfileId", SqlDbType.UniqueIdentifier)).Value = Guid.NewGuid();
                        cmd.Parameters.Add(new SqlParameter("@Profile_Name", SqlDbType.NVarChar, 25)).Value = name;
                        cmd.Parameters.Add(new SqlParameter("@Profile_DOB", SqlDbType.Date, 0)).Value = dob;
                        cmd.Parameters.Add(new SqlParameter("@Profile_Gender", SqlDbType.VarChar, 6)).Value = gender;
                        cmd.Parameters.Add(new SqlParameter("@Profile_Country", SqlDbType.VarChar, 50)).Value = country;
                        cmd.Parameters.Add(new SqlParameter("@Profile_ZipCode", SqlDbType.VarChar, 10)).Value = zipCode;
                        cmd.Parameters.Add(new SqlParameter("@Profile_City", SqlDbType.VarChar, 50)).Value = city;
                        cmd.Parameters.Add(new SqlParameter("@Profile_Email", SqlDbType.VarChar, 25)).Value = email;
                        cmd.Parameters.Add(new SqlParameter("@Profile_PhoneNo", SqlDbType.VarChar, 13)).Value = phoneNo;
                        cmd.Parameters.Add(new SqlParameter("@Profile_Image", SqlDbType.VarChar, 128)).Value = "image/lioSb.png";
                        cmd.Parameters.Add(new SqlParameter("@Username", SqlDbType.VarChar, 15)).Value = username;
                        cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar, 20)).Value = pws1;

                        con.Open();
                        rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }

            return rowsAffected;
        }

        private static void alert()
        {
            throw new NotImplementedException();
        }

        private static void alert(string name)
        {
            throw new NotImplementedException();
        }

        [WebMethod]
        public static List<User> CheckUserExist(string username, string password)
        {
            string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            // Create a new instance of the DataTable class:
            DataTable tbl = new DataTable("User");

            List<User> userList = new List<User>();
            using (SqlConnection myConnection = new SqlConnection(constring))
                try
                {
                    myConnection.Open();

                    SqlCommand sCmd = new SqlCommand("select * from [User] where Username='" + username + "' and Password ='" + password + "'", myConnection);
                    sCmd.CommandType = CommandType.Text;

                    // Execute the command and return a DataReader object:
                    using (SqlDataReader reader = sCmd.ExecuteReader())
                    {
                        // Load the table with the data returned from the DataReader:
                        tbl.Load(reader);
                    }


                    if (tbl.Rows.Count > 0)
                    {
                        foreach (DataRow tb in tbl.Rows)
                        {
                            User cor = new User();
                            cor.UserId = Convert.ToInt32(tb["UserId"].ToString());
                            cor.Username = tb["Username"].ToString();
                            cor.Password = tb["Password"].ToString();
                            userList.Add(cor);

                            cor = null;
                        }
                    }
                }
                catch (Exception exc)
                {
                    exc.Message.ToString();

                }
                finally
                {
                    myConnection.Close();
                }

            return userList;
        }


        [WebMethod]
        public static string GetProfileData(string userid)
        {
            string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            // Create a new instance of the DataTable class:
            DataTable tbl = new DataTable("User");

            List<User> profileList = new List<User>();
            using (SqlConnection myConnection = new SqlConnection(constring))
                try
                {
                    myConnection.Open();

                    SqlCommand sCmd = new SqlCommand("SELECT * FROM [User] WHERE [UserId] = @UserId", myConnection);
                    sCmd.CommandType = CommandType.Text;
                    sCmd.Parameters.AddWithValue("@UserId", userid);


                    using (SqlDataReader reader = sCmd.ExecuteReader())
                    {

                        tbl.Load(reader);
                    }


                    if (tbl.Rows.Count > 0)
                    {
                        foreach (DataRow tb in tbl.Rows)
                        {
                            User cou = new User();
                            cou.UserId = Convert.ToInt32(tb["UserId"].ToString());
                            cou.Profile_Name = tb["Profile_Name"].ToString();
                            cou.Profile_DOB = tb["Profile_DOB"].ToString();
                            cou.Profile_Gender = tb["Profile_Gender"].ToString();
                            cou.Profile_Country = tb["Profile_Country"].ToString();
                            cou.Profile_ZipCode = tb["Profile_ZipCode"].ToString();
                            cou.Profile_City = tb["Profile_City"].ToString();
                            cou.Profile_Email = tb["Profile_Email"].ToString();
                            cou.Profile_PhoneNo = tb["Profile_PhoneNo"].ToString();
                            cou.Profile_Image = tb["Profile_Image"].ToString();
                            cou.Username = tb["Username"].ToString();
                            cou.Password = tb["Password"].ToString();

                            profileList.Add(cou);

                            cou = null;
                        }
                    }
                }
                catch (Exception exc)
                {
                    exc.Message.ToString();

                }
                finally
                {
                    myConnection.Close();
                }

            JavaScriptSerializer serializer = new JavaScriptSerializer();

            //return serializer.Serialize(profileList[0]);
            //return "Shit";
            return serializer.Serialize(profileList.ToList());
        }


        [WebMethod]
        public static Boolean UpdateProfileData(string name, string country, string zipcode, string city, string phoneNo, string email, string image, string password, string userid)
        {
            int rowsAffected = 0;

            try
            {

                string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE [User] SET [Profile_Name]=@Profile_Name, [Profile_Country]=@Profile_Country, [Profile_ZipCode]=@Profile_ZipCode, [Profile_City]=@Profile_City, [Profile_PhoneNo]=@Profile_PhoneNo, [Profile_Email]=@Profile_Email, [Profile_Image]=@Profile_Image, [Password]=@Password WHERE [UserId]=@UserId", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@Userid", userid);
                        cmd.Parameters.AddWithValue("@Profile_Name", name);
                        cmd.Parameters.AddWithValue("@Profile_Country", country);
                        cmd.Parameters.AddWithValue("@Profile_ZipCode", zipcode);
                        cmd.Parameters.AddWithValue("@Profile_City", city);
                        cmd.Parameters.AddWithValue("@Profile_PhoneNo", phoneNo);
                        cmd.Parameters.AddWithValue("@Profile_Email", email);
                        cmd.Parameters.AddWithValue("@Profile_Image", image);
                        cmd.Parameters.AddWithValue("@Password", password);

                        con.Open();
                        rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }

            return rowsAffected == 1;

        }


        [WebMethod]
        public static int InsertPostContent(string title, string content, string userid)
        {

            int rowsAffected = 0;
            DateTime datetime = DateTime.Now;
            try
            {

                string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO [Post] ([Post_Title],[Post_DateTime],[Post_Content],[UserId]) VALUES (@Post_Title, @Post_DateTime, @Post_Content, @UserId)", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.Add(new SqlParameter("@Post_Title", SqlDbType.NVarChar, 100)).Value = title;
                        cmd.Parameters.Add(new SqlParameter("@Post_DateTime", SqlDbType.DateTime)).Value = datetime;
                        cmd.Parameters.Add(new SqlParameter("@Post_Content", SqlDbType.NVarChar, 4000)).Value = content;
                        cmd.Parameters.Add(new SqlParameter("@UserId", SqlDbType.Int, 0)).Value = Convert.ToInt32(userid);
                        con.Open();
                        rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }

            return rowsAffected;
        }

        [WebMethod]
        public static List<Post> GetPostData()
        {
            string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            // Create a new instance of the DataTable class:
            DataTable tbl = new DataTable("Post");

            List<Post> postList = new List<Post>();
            using (SqlConnection myConnection = new SqlConnection(constring))
                try
                {
                    myConnection.Open();

                    SqlCommand sCmd = new SqlCommand("SELECT * FROM Post", myConnection);
                    sCmd.CommandType = CommandType.Text;


                    using (SqlDataReader reader = sCmd.ExecuteReader())
                    {

                        tbl.Load(reader);
                    }

                    if (tbl.Rows.Count > 0)
                    {
                        foreach (DataRow tb in tbl.Rows)
                        {
                            Post post = new Post();
                            post.PostID = Convert.ToInt32(tb["PostID"].ToString());
                            post.Post_Title = tb["Post_Title"].ToString();
                            post.Post_DateTime = Convert.ToDateTime(tb["Post_DateTime"]);
                            post.Post_Content = tb["Post_Content"].ToString();

                            postList.Add(post);

                            post = null;
                        }
                    }
                }
                catch (Exception exc)
                {
                    exc.Message.ToString();

                }
                finally
                {
                    myConnection.Close();
                }

            return postList;
        }

        [WebMethod]
        public static int DeletePost(string id)
        {
            int rowsAffected = 0;
            try
            {
                string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constring))
                {

                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Post WHERE PostID = @PostID", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@PostID", Convert.ToInt32(id));
                        con.Open();
                        rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }

            return rowsAffected;
        }


        [WebMethod]
        public static int InsertCommentContent(string comment, string postid)
        {

            int rowsAffected = 0;
            DateTime datetime = DateTime.Now;
            try
            {

                string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO [Comment] ([Comment_DateTime],[Comment_Content],[PostID]) VALUES (@Comment_DateTime, @Comment_Content, (SELECT PostID FROM Post WHERE PostID = @PostID))", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.Add(new SqlParameter("@Comment_DateTime", SqlDbType.DateTime)).Value = datetime;
                        cmd.Parameters.Add(new SqlParameter("@Comment_Content", SqlDbType.NVarChar, 4000)).Value = comment;
                        cmd.Parameters.Add(new SqlParameter("@PostID", SqlDbType.Int, 0)).Value = Convert.ToInt32(postid);
                        con.Open();
                        rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }

            return rowsAffected;
        }

        [WebMethod]
        public static List<Comment> GetCommentData()
        {
            string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            DataTable tbl = new DataTable("Comment");

            List<Comment> commentList = new List<Comment>();
            using (SqlConnection myConnection = new SqlConnection(constring))
                try
                {
                    myConnection.Open();

                    SqlCommand sCmd = new SqlCommand("SELECT * FROM Comment", myConnection);
                    sCmd.CommandType = CommandType.Text;


                    using (SqlDataReader reader = sCmd.ExecuteReader())
                    {

                        tbl.Load(reader);
                    }

                    if (tbl.Rows.Count > 0)
                    {
                        foreach (DataRow tb in tbl.Rows)
                        {
                            Comment com = new Comment();
                            com.CommentID = Convert.ToInt32(tb["CommentID"].ToString());
                            com.Comment_DateTime = Convert.ToDateTime(tb["Comment_DateTime"]);
                            com.Comment_Content = tb["Comment_Content"].ToString();
                            com.PostID = Convert.ToInt32(tb["PostID"].ToString());

                            commentList.Add(com);

                            com = null;
                        }
                    }
                }
                catch (Exception exc)
                {
                    exc.Message.ToString();

                }
                finally
                {
                    myConnection.Close();
                }

            return commentList;
        }

    }
}