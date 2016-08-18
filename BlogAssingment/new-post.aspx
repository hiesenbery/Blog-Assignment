<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new-post.aspx.cs" Inherits="BlogAssingment.new_post" %>

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
    <script type="text/javascript" src="Cookie.js"></script>
    <style>
        body, h1, h2, h3, h4, h5 {
            font-family: "Raleway", sans-serif;
        }

        body {
            background-image: url('img/blog-bg.jpg');
        }

            body .newPostBody {
                margin: 0 10% 0 10%;
            }

            body textarea {
                width: 100%;
                height: 350px;
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
    <form id="form2" runat="server" action="MainPage.aspx">
    <div class="w3-content" style="max-width: 1400px">
        <div class="newPostBody w3-white">
            <div class="w3-padding-large">
                <h3>Write a New Post:</h3>
                <input id="title" class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter title here" />
                <h5 id="titleerror" style="color: red">Please fill up your title.</h5>
                <div id="postcontent"></div>
                <h5 id="contenterror" style="color: red">This post appears to be blank. Please write something or attach a link or photo to post.</h5>
                <button class="checkPost w3-btn w3-padding-large w3-white w3-border w3-margin"><b>Publish</b></button>
            </div>
        </div>
    </div>
        <input type="hidden" id="UserID" value="" />
    </form>

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

        function CheckCookie() {

            var theUser = getCookie("user");


            if (theUser != null) {
                var obj = JSON.parse(theUser);

                $("#UserID").val(obj.userid);
                
            }

        }
        $(document).ready(function () {
            
            CheckCookie();
            alert("userid:" + $("#UserID").val());
            $('#contenterror').hide();
            $('#titleerror').hide();
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

            $("#form2").ready(function () {

                $('.checkPost').on('click', function () {
                   
                    $('#contenterror').hide();
                    $('#titleerror').hide();
                    var content = tinymce.get('postcontent').getContent();
                    var tit = $('#title').val();
                    if (tit == '') {
                        $('#titleerror').show();
                        $('#title').focus();
                        return false;
                    }
                    if (content == '') {
                        $('#contenterror').show();
                        $('#postcontent').focus();
                        return false;
                    }
                    var title = $('#title').val();
                    var userid = $("#UserID").val();
                    var obj = new Object();
                    obj.title = title;
                    obj.content = tinymce.get('postcontent').getContent();
                    obj.userid = userid;

                    var jsonText = JSON.stringify(obj);
                    $.ajax({
                        type: "POST",
                        url: "GetData.aspx/InsertPostContent",
                        data: jsonText,
                        contentType: "application/json; charset=utf-8",
                        datatype: "jsondata",
                        async: "false",
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
                        error: function (response) {

                        }
                    });
                    window.location.href = "MainPage.aspx";
                });
            })
            
        });
        tinymce.init({
            selector: '#postcontent',
            theme: 'modern',
            plugin: 'autoresize',
            width: '100%',
            height: 350,
            plugins: [
              'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
              'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
              'save table contextmenu directionality emoticons template paste textcolor'
            ],
            content_css: 'css/content.css',
            toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons'
        });
    </script>
</body>
</html>
