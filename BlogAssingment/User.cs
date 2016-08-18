using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BlogAssingment
{
    public class User
    {
        public int UserId { get; set; }

        public string Profile_Name { get; set; }

        public string Profile_DOB { get; set; }
        public string Profile_Gender { get; set; }
        public string Profile_Country { get; set; }
        public string Profile_ZipCode { get; set; }
        public string Profile_City { get; set; }
        public string Profile_Email { get; set; }
        public string Profile_PhoneNo { get; set; }
        public string Profile_Image { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    }
}