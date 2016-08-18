using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BlogAssingment
{
    public class Comment
    {
        public int CommentID { get; set; }
        public DateTime Comment_DateTime { get; set; }
        public string Comment_Content { get; set; }
        public int PostID { get; set; }
    }
}