using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BlogAssingment
{
    public class Post
    {
        public int PostID { get; set; }
        public string Post_Title { get; set; }
        public DateTime Post_DateTime { get; set; }
        public string Post_Content { get; set; }
        public int UserId { get; set; }
    }
}