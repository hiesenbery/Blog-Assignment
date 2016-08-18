<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="BlogAssingment.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BLOGGY</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/w3.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://www.parsecdn.com/js/parse-1.4.2.min.js"></script>
    <style>
        body, h1, h2, h3, h4, h5 {
            font-family: "Raleway", sans-serif;
        }

        body {
            background-image: url('img/blog-bg.jpg');
        }

            body #profpic {
                display: block;
                height: 220px;
                width: 220px;
                margin: auto;
                margin-top: 20px;
                border-radius: 50%;
            }

        footer {
            background-image: url('img/white.jpg');
        }

            footer .icon {
                float: right;
            }

        .dropdown {
            position: fixed;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 150px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

                .dropdown-content a:hover {
                    background-color: #f1f1f1;
                }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover #dropbtn {
            background-color: #3e8e41;
        }
    </style>
</head>
<body>
    <!-- Navbar-->
    <div class="w3-top">
        <ul class="w3-navbar w3-card-2 w3-top w3-left-align w3-large" id="myNavbar">
            <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
                <a class="w3-padding-large w3-hover-white w3-medium w3-red" href="javascript:void(0);" onclick="smallScreen()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
            </li>
            <li><a href="MainPage.aspx" class="w3-padding-large">Home</a></li>
            <div class="dropdown">
                <li class="w3-hide-small"><a href="#" class="w3-padding-large w3-hover-white" id="A1">User</a></li>
                <div class="dropdown-content">
                    <a href="#" class="editprofile">Edit Profile</a>
                    <a href="#" class="postanalysis">Post Analysis</a>
                    <a href="#" class="signout">Sign Out</a>
                </div>
            </div>
            <li class="w3-hide-small" style="float: right"><a href="#" class="post w3-padding-large w3-btn w3-black w3-hover-white">New Post</a></li>
        </ul>
    </div>

    <!-- Navbar on small screens -->
    <div id="Div1" class="w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top: 51px">
        <ul class="w3-navbar w3-left-align w3-large w3-black">
            <li><a href="#" class="w3-padding-large">Edit profile</a></li>
            <li><a href="#" class="w3-padding-large">User</a></li>
            <li><a href="#" class="w3-padding-large">New Post</a></li>
        </ul>
    </div>

    <!-- Header -->
    <div class="w3-container w3-center w3-padding-32">
        <h1>
            <br />
            <b>BLOGGY</b>
        </h1>
        <p>Welcome to the blog of <span class="w3-tag">unknown</span></p>
    </div>

    <!-- Body -->
    <div class="w3-content" style="max-width: 1400px">
        <div class="w3-row">
            <div id="postList" class="w3-col l8 s12">
            </div>

            <!-- Introduction menu -->
            <div class="w3-col l4 w3-hide-medium w3-hide-small">
                <div class="w3-card-2 w3-margin w3-margin-top">
                    <div class="w3-container w3-white">
                        <img id="profpic" src="img/profilepic.png" />
                        <hr/>
                        <p>Just me, myself and I, exploring the universe of uknownment. I have a heart of love and a interest of lorem ipsum and mauris neque quam blog. I want to share my world with you.</p>
                    </div>
                </div>
            </div>
        </div>
        <br>
    </div>

    <!-- Footer -->
    <footer class="w3-container w3-padding-32 w3-margin-top">
        <button class="w3-btn w3-disabled w3-padding-large w3-margin-bottom">Previous</button>
        <button class="w3-btn w3-padding-large w3-margin-bottom">Next »</button>
        <div class="w3-xlarge w3-padding-32">
            Copyright &copy; 2016 <a href="#">Bloggy</a>
            <a href="#" class="icon w3-hover-text-indigo"><i class="fa fa-linkedin"></i></a>
            <a href="#" class="icon w3-hover-text-grey"><i class="fa fa-flickr"></i></a>
            <a href="#" class="icon w3-hover-text-light-blue"><i class="fa fa-twitter"></i></a>
            <a href="#" class="icon w3-hover-text-red"><i class="fa fa-pinterest-p"></i></a>
            <a href="#" class="icon w3-hover-text-indigo"><i class="fa fa-facebook-official"></i></a>
        </div>
    </footer>
    <script>
        window.onscroll = function () { scroll() };
        LoadPostData();
        function scroll() {
            var navbar = document.getElementById("myNavbar");
            if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
                navbar.className = "w3-navbar" + " w3-card-2" + " w3-animate-top" + " w3-black";
            } else {
                navbar.className = navbar.className.replace(" w3-card-2 w3-animate-top w3-black", "");
            }
        }
        function smallScreen() {
            var x = document.getElementById("navDemo");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
        }
        function LoadPostData() {
            $.ajax({
                type: "POST",
                url: "GetData.aspx/GetPostData",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.length == 0) {
                        var preview = "<div class=\"postblock w3-card-4 w3-margin w3-white\">" +
                                      "<div class=\"w3-container w3-padding-8\" style=\"height: 200px\">" +
                                      "<h2><b>You haven't any post yet.</b></h2><br>" +
                                      "<h4>Ready to publish your first post? " +
                                      "<a href=\"new-post.aspx\" style=\"color: red\">Get started here.</a>" +
                                      "</h4></div></div>";;
                        $('#postList').append(preview);
                    }
                    else {
                        for (var i = 0; i <= response.d.length - 1; i++) {
                            var datetime = response.d[i].Post_DateTime.replace(/\/Date\((-?\d+)\)\//, '$1');
                            var convertformat = new Date(parseInt(datetime));
                            var preview = "<div class=\"postblock w3-card-4 w3-margin w3-white\" ><div class=\"w3-container w3-padding-8\">" +
                                          "<h3><b>" + response.d[i].Post_Title + "</b></h3><h5>post by Jay, <span class=\"w3-opacity\">" +
                                          convertformat.toLocaleString() + "</span></h5></div><div class=\"w3-container\"><form action=\"view-post.aspx\" method=\"get\">" +
                                          "<input class=\"position\" style=\"display: none\" name=\"post\" value=" + i + ">" +
                                          "<input class=\"postID\" style=\"display: none\" value=" + response.d[i].PostID + ">" +
                                          "<div class=\"postContent\" style=\"max-height:90px; overflow: hidden\">" + response.d[i].Post_Content +
                                          "</div><div class=\"w3-row w3-padding-top w3-padding-bottom\"><div class=\"w3-col s7\">" +
                                          "<button class=\"readmore w3-btn w3-padding-large w3-margin-top w3-white w3-border w3-hover-border-black\" type=\"submit\"><b>READ MORE »</b></button>" +
                                          "</div><div class=\"w3-col s2\"><button class=\"dela w3-btn w3-padding-large w3-margin-top w3-right w3-white w3-hover-black\" type=\"button\"><b>Delete</b></button>" +
                                          "</div><div class=\"w3-col s3\"><span class=\"w3-padding-large w3-margin-top w3-right\"><b>Comments  </b><span class=\"w3-badge\">0</span></span>" +
                                          "</div></div></form></div><div class=\"delAlert w3-modal\"><div class=\"w3-modal-content w3-card-8 w3-animate-zoom\" style=\"max-width: 500px\">" +
                                          "<div class=\"w3-container w3-border-top w3-padding-16 w3-light-grey\"><h3>Are you sure want to delete this post?</h3>" +
                                          "<button type=\"button\" class=\"dely w3-btn w3-red w3-round-medium\">Yes</button>" +
                                          "<button type=\"button\" class=\"deln w3-btn w3-green w3-round-medium\">No</button></div></div></div></div>";
                            var preview = preview.replace(/<img[^>]*>/g, "");
                            var preview = preview.replace(/<table[^>]*>/g, "");
                            $('#postList').append(preview);
                            $('.dela').on('click', function () {
                                $(this).parents(".postblock").children('.delAlert').css('display', 'block');
                            });
                            $('.dely').on('click', function () {
                                var id = $(this).closest(":has(input)").find('.postID').val();
                                DeletePostData(id);
                                //$(this).parents(".postblock").animate({ opacity: "hide" }, "slow");     
                                window.location.href = "blog-main.aspx";
                            });
                            $('.deln').on('click', function () {
                                $(this).parents(".postblock").children('.delAlert').css('display', 'none');
                            });

                        }

                    }

                }
            });
        }
        function DeletePostData(id) {
            var obj = new Object();
            obj.id = id;
            var jsonText = JSON.stringify(obj);
            $.ajax({
                type: "POST",
                url: "GetData.aspx/DeletePost",
                data: jsonText,
                contentType: "application/json; charset=utf-8",
                datatype: "jsondata",
                async: "true",
                success: function (response) {

                    var myObject = eval('(' + response.d + ')');
                    if (myObject > 0) {

                        $("#message").text("Data saved successfully");

                    }
                    else {
                        $("#message").text("Opppps something went wrong.");
                    }

                    $("#postcontent").val("");

                },
            });
        }
        $(document).ready(function () {
            $('.editprofile').on('click', function () {
                window.location.href = "Profile.aspx";
            });
            $('.postanalysis').on('click', function () {
                window.location.href = "post-analysis.html";
            });
            $('.signout').on('click', function () {
                window.location.href = "HomePage.aspx";
            });
            $('.post').on('click', function () {
                window.location.href = "new-post.aspx";
            });

        });
    </script>
</body>
</html>

