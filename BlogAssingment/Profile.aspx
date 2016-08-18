<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BlogAssingment.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BLOGGY</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway"/>
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"/>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://www.parsecdn.com/js/parse-1.4.2.min.js"></script>
    <script src="jquery-1.11.3.min.js"></script>
    <script src="Cookie.js" type="text/javascript"></script>
    <style>
        body, h1, h2, h3, h4, h5 {
            font-family: "Raleway", sans-serif;
        }

        body {
            background-image: url('img/blog-bg.jpg');
        }

            body .editProfileBody {
                margin: 0 10% 0 10%;
            }

            body #picpreview {
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
                <li class="w3-hide-small"><a href="#" class="w3-padding-large w3-hover-white" id="dropmenu">User</a></li>
                <div class="dropdown-content">
                    <a href="#" class="postanalysis">Post Analysis</a>
                    <a href="#" class="signout">Sign Out</a>
                </div>
            </div>
            <li class="w3-hide-small" style="float: right"><a href="#" class="post w3-padding-large w3-btn w3-black w3-hover-white">New Post</a></li>
        </ul>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top: 51px">
        <ul class="w3-navbar w3-left-align w3-large w3-black">
            <li><a href="#" class="w3-padding-large">User</a></li>
            <li><a href="#" class="w3-padding-large">New Post</a></li>
        </ul>
    </div>

    <!-- Header -->
    <div class="w3-container w3-center w3-padding-32">
        <h1>
            <br>
            <b>BLOGGY</b></h1>
        <p>Welcome to the blog of <span class="w3-tag">unknown</span></p>
    </div>

    <!-- Body -->
    <div class="w3-content" style="max-width: 1400px">
        <div class="editProfileBody w3-white">
            <div class="w3-container w3-padding-8">
                <h3><b><span id="uname">Jay</span>'s Account</b></h3>
                <h5>Edit your personal infrormation.</h5>
            </div>
            <form id="form1" class="editprof w3-container" runat="server" action="Profile.aspx">
                <div class="w3-container">
                    <div class="row">
                        <div class="w3-col s8">
                            <div class="w3-row">
                                <div class="w3-col s5">
                                    <h4><b>Profile name:</b></h4>
                                </div>
                                <div class="w3-col s7">
                                    <input class="update w3-input w3-border" type="text" id="Name" required="required"/>
                                </div>
                            </div>
                            <div class="w3-row">
                                <div class="w3-col s5">
                                    <h4><b>Current Password:</b></h4>
                                </div>
                                <div class="w3-col s7">
                                    <input class="update w3-input w3-border" type="password" id="pw1" required="required"/>
                                </div>
                            </div>
                            <div class="hide w3-row">
                                <div class="w3-col s5">
                                    <h4><b>New Password:</b></h4>
                                </div>
                                <div class="w3-col s7">
                                    <input class="w3-input w3-border" type="password" id="pw2" required="required"/>
                                </div>
                            </div>
                            <div class="hide w3-row">
                                <div class="w3-col s5">
                                    <h4><b>Repeat New Password:</b></h4>
                                </div>
                                <div class="w3-col s7">
                                    <input class="update w3-input w3-border" type="password" id="pw3" required="required"/>
                                    <label class="error" id="validPw">New Password not match.</label>
                                </div>
                            </div>

                            <div class="w3-row">
                                <div class="w3-col s5">
                                    <h4><b>Gender:</b></h4>
                                </div>
                                <div class="w3-col s7">
                                    <input class="update1 w3-input w3-border" type="text" id="Gender" required="required"/>
                                </div>
                            </div>

                             <div class="w3-row">
                                <div class="w3-col s5">
                                    <h4><b>Age:</b></h4>
                                </div>
                                <div class="w3-col s7">
                                    <input class="update1 w3-input w3-border" type="number" id="Age" required="required"/>
                                </div>
                            </div>

                            <div class="w3-row">
                                <div class="w3-col s5">
                                    <h4><b>Email Address:</b></h4>
                                </div>
                                <div class="w3-col s7">
                                    <input class="update w3-input w3-border" type="text" id="Email" required="required"/>
                                    <label class="error" id="validEmail">Please enter valid email.</label>
                                </div>
                            </div>
                            <div class="w3-row">
                                <div class="w3-col s5">
                                    <h4><b>Country:</b></h4>
                                </div>
                                <div class="w3-col s7">
                                    <input class="update w3-input w3-border" type="text" id="Country" required="required"/>
                                </div>
                            </div>
                            <div class="w3-row">
                                <div class="w3-col s5">
                                    <h4><b>Zip Code:</b></h4>
                                </div>
                                <div class="w3-col s7">
                                    <input class="update w3-input w3-border" type="number" id="ZipCode" required="required"/>
                                </div>
                            </div>
                            <div class="w3-row">
                                <div class="w3-col s5">
                                    <h4><b>City:</b></h4>
                                </div>
                                <div class="w3-col s7">
                                    <input class="update w3-input w3-border" type="text" id="City" required="required"/>
                                </div>
                            </div>
                            <div class="w3-row">
                                <div class="w3-col s5">
                                    <h4><b>Phone Number:</b></h4>
                                </div>
                                <div class="w3-col s7">
                                    <input class="update w3-input w3-border" type="text" id="PhoneNo" required="required"/>
                                </div>
                            </div>
                           
                        </div>
                        <div class="w3-col s3 w3-right w3-middle w3-padding-64">
                            <img id="picpreview" src="Image/02.jpg" alt="profile pic" /><br>
                            <input type='file' id="profpic" />
                        </div>
                    </div>
                </div>
                <p>
                    <button type="submit" class="checkFormat w3-btn w3-padding-large w3-white w3-border w3-margin" id="edit"><b>Edit Profile</b></button>
                    <button type="submit" class="saveprofile checkFormat w3-btn w3-padding-large w3-white w3-border w3-margin" id="save"><b>Save changes</b></button>
                </p>

                <input type ="hidden" id="userID" value="" /> 
                <input type ="hidden" id="userName" value="" />
            </form>
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
    <script type="text/javascript">
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
        function readURL(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#picpreview').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
        function validateEmail(email) {
            var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            if (!emailReg.test(email))
                return false;
            else
                return true;
        }
        function validatePw(pw2, pw3) {
            if (pw2 != pw3)
                return false;
            else
                return true;
        }

        function CheckCookie() {

            var theUser = getCookie("user");


            if (theUser != null) {
                var obj = JSON.parse(theUser);

                $("#userID").val(obj.userid);
                alert("userId" + $("#userID").val(obj.userid));
                $("#userName").val(obj.username);
            }

        }

        $(document).ready(function () {
            CheckCookie();

            $('.error').hide();
            $("#profpic").hide();
            $("#save").hide();
            $("div.hide").hide();
            $('#update').click(function () {
                $('.error').hide();
                var email = $('input#Email').val();
                var pw2 = $('input#pw2').val();
                var pw3 = $('input#pw3').val();
                if (!validateEmail(email)) {
                    $("#validEmail").show();
                    $("input#Email").focus();
                    return false;
                }
                if (!validatePw(pw2, pw3)) {
                    $("#validPw").show();
                    $("input#pw3").focus();
                    return false;
                }
            });
            $('.editprofile').on('click', function () {
                window.location.href = "edit-profile.html";
            });
            $('.postanalysis').on('click', function () {
                window.location.href = "post-analysis.html";
            });
            $('.signout').on('click', function () {
                window.location.href = "start-page.html";
            });
            $('.post').on('click', function () {
                window.location.href = "new-post.aspx";
            });
            $("#profpic").change(function () {
                readURL(this);
            });
            $(".saveprofile").on('click', function () {
                window.location.href = "Profile.aspx";
            });

            $("#form1").ready(function () {
                var userId = $("#userID").val();
                var obj = new Object;
                obj.userid = userId;
                var jsonText = JSON.stringify(obj);
               
                alert(userId);
                alert("Loaded");
                $.ajax({
                    type: "POST",
                    data: jsonText,
                    url: "GetData.aspx/GetProfileData",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        var response = JSON.parse(data.d);
                        //alert(data.d);
                        for (var i = 0; i <= response.length - 1; i++) {
                            $("#Name").val(response[i].Profile_Name);
                            var d = new Date(response[i].Profile_DOB);
                            var nwDate = new Date();
                            d = d.getFullYear();
                            nwDate = nwDate.getFullYear();
                            
                            $("#Age").val(nwDate - d);
                            $("#pw1").val(response[i].Password);

                            $("#Gender").val(response[i].Profile_Gender);
                            
                            $("#Country").val(response[i].Profile_Country);
                            
                            $("#ZipCode").val(response[i].Profile_ZipCode);
                            
                            $("#City").val(response[i].Profile_City);
                            
                            $("#PhoneNo").val(response[i].Profile_PhoneNo);
                            
                            $("#Email").val(response[i].Profile_Email);
                            
                            $("#picpreview").attr("src", response[i].Profile_Image);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Error: " + XMLHttpRequest.responseText + " " + textStatus + " " + errorThrown);
                    }
                });

                $("#save").click(function () {
                    alert("updating");
                    var name = $("#Name").val();

                    var password = $("#pw2").val();
                    var country = $("#Country").val();
                    var zipcode = $("#ZipCode").val();
                    var city = $("#City").val();
                    var phoneNo = $("#PhoneNo").val();
                    var email = $("#Email").val();
                    var image = $("#picpreview").attr("src");
                    var userid = $("#userID").val();

                    var obj = new Object();
                    obj.name = name;
                    obj.country = country;
                    obj.zipcode = zipcode;
                    obj.city = city;
                    obj.phoneNo = phoneNo;
                    obj.email = email;
                    obj.image = image;
                    obj.password = password;
                    obj.userid = userid;

                    var jsonText = JSON.stringify(obj);
                    alert(jsonText);
                    if (name != "" && password != "" && country != "" && zipcode != "" && city != "" && phoneNo != "" && email != "" && image != "") {
                       
                        $.ajax({
                            type: "POST",
                            url: "GetData.aspx/UpdateProfileData",
                            data: jsonText,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            async: false,
                            success: function (data, textStatus, XMLHttpRequest) {
                                
                                alert(data + "\n" + textStatus + "\n" + XMLHttpRequest.responseText);
                                //var myObject = eval('(' + response.d + ')');
                                if (data) {
                                    alert("Data update successfully");
                                }
                                else {
                                    alert("Omg Somethings Wrong!!!!")
                                }
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                alert(XMLHttpRequest.responseText + '\n' + textStatus + '\n' + errorThrown);
                            }
                        });
                    }
                    else {
                        alert("Not allow empty");
                    }
                });
            });

            
            $("input.update").attr("readonly", "readonly");
            $("input.update1").attr("readonly", "readonly");

            $("#edit").on('click', function () {
                $("#edit").hide();
                $("div.hide").show();
                $("#save").show();
                $("#profpic").show();
                $("input.update").removeAttr("readonly");
                return false;
            });

            $("input#PhoneNo1").change(function () {
                var phoneNo = $("input#PhoneNo1").val();
                if (!validatePhoneNo(phoneNo)) {
                    alert("Please enter valid phone number.");
                    $("input#PhoneNo1").val("");
                    $("input#PhoneNo1").focus();
                    return false;
                }
            });

            function validatePhoneNo(phoneNo) {
                var filter = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
                if (filter.test(phoneNo)) {
                    return true;
                }
                else {
                    return false;
                }
            }
        });
    </script>
    
</body>
</html>

