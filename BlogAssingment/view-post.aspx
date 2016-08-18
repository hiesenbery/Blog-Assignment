<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view-post.aspx.cs" Inherits="BlogAssingment.view_post" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BLOGGY</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" type="text/css" href="css/w3.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway"/>
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"/>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://www.parsecdn.com/js/parse-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/tinymce.min.js"></script>
    <style>
        body, h1, h2, h3, h4, h5 {
            font-family: "Raleway", sans-serif;
        }

        body {
            background-image: url('img/blog-bg.jpg');
        }

            body .viewPostBody {
                margin: 0 15% 0 15%;
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

        .otherprofilepic {
            display: block;
            height: 100px;
            width: 100px;
            margin: auto;
            margin-top: 20px;
            border-radius: 50%;
        }

        .newcomment {
            float: right;
            width: 80%;
            height: 100px;
        }

        .spam {
            color: #999999;
        }
        .pane {
            display: block;
            margin: auto;
            
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
        <div class="viewPostBody w3-white w3-padding">
            <div class="w3-container w3-padding">
                <div id="showPost"></div> 
                <hr />
                <h4>Rate this post:&emsp;<span><button class="like-button" style="width:8%">&#x1f44d;(0)</button></span></h4>
                <h3><b>Comments:</b></h3>
                <div class="comments">
                </div>
                <button class="send w3-btn w3-white w3-border w3-margin-top" style="float: right">Send</button>
                <textarea class="newcomment w3-margin w3-padding" placeholder="Enter comment here"></textarea><br />
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="w3-container w3-padding-32 w3-margin-top">
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
        var pid = getPostID();
        LoadPostData();
        LoadCommentData();
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

                    var datetime = response.d[pid].Post_DateTime.replace(/\/Date\((-?\d+)\)\//, '$1');
                    var convertformat = new Date(parseInt(datetime));
                    $('#showPost').append(
                        "<h3><b>" + response.d[pid].Post_Title + "</b></h3>" +
                        "<input class=\"postID\" style=\"display: none\" value=" + response.d[pid].PostID + ">" +
                        "<h5>post by JAY, <span class=\"w3-opacity\">" + convertformat.toLocaleString() +
                        "</span></h5><br /><div>" + response.d[pid].Post_Content + "</div><br />"
                    )

                }
            });
        }
        function LoadCommentData() {
            $.ajax({
                type: "POST",
                url: "GetData.aspx/GetCommentData",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    for (var i = 0; i <= response.d.length - 1; i++) {
                        if (response.d[i].PostID == $('.postID').val()) {
                            var datetime = response.d[i].Comment_DateTime.replace(/\/Date\((-?\d+)\)\//, '$1');
                            var convertformat = new Date(parseInt(datetime));
                            $('.comments').append(
                                "<div class=\"pane w3-row w3-margin w3-padding\">" +
                                    "<div class=\"w3-col s2\">" +
                                    "<input class=\"commentID\" style=\"display: none\" value=" + response.d[i].CommentID + ">" +
                                    "<img class=\"otherprofilepic\" src=\"img/profilepic.png\" /></div>" +
                                    "<div class=\"w3-col s9 w3-border w3-padding\">" +
                                    "<h3><span><b>Jay</b></span></h3>" +
                                    "<span><em>" + convertformat.toLocaleString() + "</em></span>" +
                                    "<p>" + response.d[i].Comment_Content + "</p>" +
                                    "<p style=\"float: right\"><a href=\"#\" class=\"btn-delete\">Delete</a></p></div></div>"
                            )
                        }
                    }
                }
            });
        }
        function getPostID() {
            var parameters = location.search.substring(1).split("%");
            var temp = parameters[0].split("=");
            id = unescape(temp[1]);
            return id;
        }
        $(document).ready(function () {
            $('#contenterror').hide();
            $('.editprofile').on('click', function () {
                window.location.href = "Profile.aspx";
            });
            $('.postanalysis').on('click', function () {
                window.location.href = "post-analysis";
            });
            $('.signout').on('click', function () {
                window.location.href = "start-page.html";
            });
            $('.post').on('click', function () {
                window.location.href = "new-post.aspx";
            });
            $(".pane .btn-delete").click(function () {
                $(this).parents(".pane").animate({ opacity: "hide" }, "slow")
                return false;
            });
            $(".send").click(function () {
                var obj = new Object();
                var date = new Date();
                var name = "Jane";
                var profilepic = "img/profilepic.png";
                var newcomment = $(".newcomment").val();
                var id = $(this).closest(":has(input)").find('.postID').val();
                obj.comment = newcomment;
                obj.postid = id;
                var jsonText = JSON.stringify(obj);
                $.ajax({
                    type: "POST",
                    url: "GetData.aspx/InsertCommentContent",
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

                    },
                    error: function (response) {
                        alert(response.status + ' ' + response.statusText);
                    }
                });
                if (newcomment != "") {
                    $(".comments").append("<div class=\"pane w3-row w3-margin w3-padding\"><div class=\"w3-col s2\"><img class=\"otherprofilepic\" src=" + profilepic + " /></div><div class=\"w3-col s9 w3-border w3-padding\"><h3><span><b>" + name + "</b></span></h3><span><em>" + date.toLocaleString() + "</em></span><p>" + newcomment + "</p><p style=\"float: right\"><a href=\"#\" class=\"btn-delete\">Delete</a></p></div></div>");
                }
                $(".pane .btn-delete").click(function () {
                    $(this).parents(".pane").animate({ opacity: "hide" }, "slow")
                    return false;
                });
                $(".newcomment").val('');

            });
            $('.like-button').click(function () {
                var obj = $(this);
                if (!obj.data('liked')) {
                    obj.data('liked', true);
                    obj.html('&#x1f44d;' + '(' + 1 + ')');
                    obj.css("background-color", "cyan", "color", "white");
                }
                else {
                    obj.data('liked', false);
                    obj.html('&#x1f44d;' + '(' + 0 + ')');
                    obj.css("background-color", "white", "color", "black");
                }
            });
        });
    </script>
</body>
</html>

