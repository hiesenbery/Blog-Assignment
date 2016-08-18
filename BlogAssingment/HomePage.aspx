<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="BlogAssingment.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Bloggy</title>
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat" />
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="bootstrap-3.3.7-dist/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="HomePageValidation.js" type="text/javascript"></script>
    <script src="Cookie.js" type="text/javascript"></script>
    <style>
            body,h1 {
                font-family: "Lato", sans-serif
            }
            .w3-navbar,h1,button {
                font-family: "Montserrat", sans-serif
            }
            body{
                background-image: url('img/start-bg.jpg');
            }
            #btn {
                border-radius: 7px;
                -moz-border-radius: 7px;
                -webkit-border-radius: 7px;
            }
    </style>
</head>
    <body>

<!-- Navbar -->
<ul class="w3-navbar w3-card-2 w3-top w3-left-align w3-large">
  <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
    <a class="w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="smallScreen()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
  </li>
  <li><a href="#" class="w3-padding-large">Home</a></li>
  <li class="w3-hide-small"><a href="#" class="w3-padding-large w3-hover-white" onclick="signUp()">Sign Up</a></li>
  <li class="w3-hide-small"><a href="#" class="w3-padding-large w3-hover-white" onclick="signIn()">Sign In</a></li>
  <li class="w3-hide-small"><a href="#" class="w3-padding-large w3-hover-white" >Contact Us</a></li>
</ul>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:51px">
  <ul class="w3-navbar w3-left-align w3-large w3-black">
    <li><a href="#" class="w3-padding-large" onclick="signUp()">Sign Up</a></li>
    <li><a href="#" class="w3-padding-large" onclick="signIn()">Sign in</a></li>
    <li><a href="#" class="w3-padding-large" >Contact Us</a></li>
  </ul>
</div>

<!-- Header -->
<div class="w3-container w3-center w3-padding-128">
  <h1 class="w3-margin w3-jumbo">Bloggy</h1>
  <p class="w3-xlarge">Create a blog for free now</p>
  <button id="btn" class="w3-btn w3-white w3-padding-16 w3-large w3-margin-top" onclick="signIn()">Get Started</button>
</div>

<div id="signin-page" class="w3-modal">
  <div class="w3-modal-content w3-card-8 w3-animate-zoom" style="max-width:600px">
  
    <form id="myform3" class="w3-container" runat="server" action="#">
      <div class="w3-section">
        <label><b>Username</b></label>
        <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" id="usrname" />

        <label><b>Password</b></label>
        <input class="w3-input w3-border" type="password" placeholder="Enter Password" id="psw" />

        <button class="w3-btn-block w3-blue w3-section" id="btn-login" type="submit">Login</button>
      </div>
    </form>

    <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
      <button onclick="cancelSignin()" type="button" class="w3-btn w3-blue">Cancel</button>
      <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>
    </div>

  </div>
</div>

<div id="signup-page" class="w3-modal">
  <div class="w3-modal-content w3-card-8 w3-animate-zoom" style="max-width:600px">
  
    <form id="myForm2" class="w3-container" action="HomePage.aspx">
      <div class="w3-section">
        <label><b>Name</b></label>
        <input class="w3-input w3-border" type="text" placeholder="Enter Your Name" id="Fname1" required="required"/>

        <label><b>Username</b></label>
        <input class="w3-input w3-border" type="text" placeholder="Enter Username" id="uname1" size="20" maxlength="12" required="required"/>

        <label><b>Password</b></label>
        <input class="w3-input w3-border" type="password" placeholder="Enter Password" id="pw1" required="required"/>
        
        <label><b>Repeat Password</b></label>
        <input class="w3-input w3-border" type="password" placeholder="Renter Password" id="pw2" required="required"/>

        <label><b>Gender</b></label>
        <select id="Gender1" class="w3-input w3-border">
            <option selected ="selected">Male</option>
            <option>Female</option>
        </select>

        <label><b>Date Of Birth</b></label>
        <input class="w3-input w3-border" type="date" id="DateOB1" required="required"/>

        <label><b>Country</b></label>
        <input class="w3-input w3-border" type="text" placeholder="Enter Country Name" id="Country1" list="countrylist" required="required"/>
        <datalist id ="countrylist">
            <option value="Malaysia">
            <option value="Japan">
            <option value="Korea">
        </datalist>

        <label><b>ZipCode</b></label>
        <input class="w3-input w3-border" type="number" id="ZipCode1" required="required"/>

        <label><b>City</b></label>
        <input class="w3-input w3-border" type="text" placeholder="Enter City Name" id="City1" required="required"/>

        <label><b>Phone No</b></label>
        <input class="w3-input w3-border" type="text" placeholder="0174658976" id="PhoneNo1"  required="required" />

        <label><b>Email Address</b></label>
        <input class="w3-input w3-border" type="email" placeholder="bravo@gmail.com" id="Email1" required="required" />

        <button class="w3-btn-block w3-blue w3-section" id="btn-submit" type="submit">Submit</button>
        <button class="w3-btn-block w3-blue w3-section" id="btn-reset" type="reset">Reset</button>
      </div>
    </form>

    <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
      <button onclick="cancelSignup()" type="button" class="w3-btn w3-blue">Cancel</button>
    </div>

  </div>
</div>

<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity">
  <div class="w3-xlarge w3-padding-32">
   <a href="#" class="w3-hover-text-indigo"><i class="fa fa-facebook-official"></i></a>
   <a href="#" class="w3-hover-text-red"><i class="fa fa-pinterest-p"></i></a>
   <a href="#" class="w3-hover-text-light-blue"><i class="fa fa-twitter"></i></a>
   <a href="#" class="w3-hover-text-grey"><i class="fa fa-flickr"></i></a>
   <a href="#" class="w3-hover-text-indigo"><i class="fa fa-linkedin"></i></a>
 </div>
 <p>Powered by <a href="http://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>

        <input type="hidden" id="userID" value="1" />
<script type="text/javascript">
    // Used to toggle the menu on small screens when clicking on the menu button
    function smallScreen() {
        var x = document.getElementById("navDemo");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }
    function signIn() {
        document.getElementById('signin-page').style.display = 'block';
    }
    function cancelSignin() {
        document.getElementById('signin-page').style.display = 'none';
    }
    function signUp() {
        document.getElementById('signup-page').style.display = 'block';
    }
    function cancelSignup() {
        document.getElementById('signup-page').style.display = 'none';
    }

    $(document).ready(function () {
        $("#myform2").ready(function () {

            $("#btn-submit").click(function () {

                var name = $("#Fname1").val();
                var gender = $("#Gender1").val();
                var dob = $("#DateOB1").val();
                var country = $("#Country1").val();
                var city = $("#City1").val();
                var zipCode = $("#ZipCode1").val();
                var phoneNo = $("#PhoneNo1").val();
                var email = $("#Email1").val();
                var username = $("#uname1").val();
                var pws1 = $("#pw1").val();
                var pws2 = $("#pw2").val();
                
                
                var obj = new Object();
                obj.name = name;
                obj.gender = gender;
                obj.dob = dob;
                obj.country = country;
                obj.zipCode = zipCode;
                obj.city = city;
                obj.phoneNo = phoneNo;
                obj.email = email;
                obj.username = username;
                obj.pws1 = pws1;

                var jsonText = JSON.stringify(obj);

                if (name != "" && username != "" && gender != "" && dob != "" && country != "" && zipCode != "" && city != "" && phoneNo != "" && email != "") {
                    $.ajax({
                        type: "POST",
                        url: "GetData.aspx/InsertUser",
                        data: jsonText,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (data, textStatus, XMLHttpRequest) {
                            alert(data + "\n" + textStatus + "\n" + XMLHttpRequest.responseText);
                            var myObject = eval('(' + response.d + ')');
                            if (myObject > 0) {
                                alert("Data saved successfully");
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

        $("#myform3").ready(function () {
            
            CheckCookie();
            $("#btn-login").click(function () {
                var username = $("#usrname").val();
                var password = $("#psw").val();
                alert(username);
                var obj = new Object();
                obj.username = username;
                obj.password = password;

                var jsonText = JSON.stringify(obj);
              
                if (username != "" && password != "") {
                    alert("Validating");
                    $.ajax({
                        type: "POST",
                        url: "GetData.aspx/CheckUserExist",
                        data: jsonText,
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        async: false,
                        success: function (response) {
                            var isExist = 0;
                            for (var i = 0; i <= response.d.length - 1; i++) {
                                isExist = 1;
                                var expDate = new Date();

                                expDate.setMinutes(expDate.getMinutes() + 5);
                                alert("Creating Cookie");
                                var user = new Object();
                                user.userid = response.d[i].UserId;
                                user.username = response.d[i].Username;
                                user.password = response.d[i].Password;

                                var jsonText = JSON.stringify(user);

                                document.cookie = "user=" + jsonText + "; expires=" + expDate.toGMTString();

                                window.location.href = "MainPage.aspx";
                            }

                            if (isExist == 0) {
                                alert("Invalid User");

                            }
                        },
                        error: function (response) {
                            alert(response.status + ' ' + response.statusText);

                        }
                    });
                }
            });
        });
        function CheckCookie() {

            var theUser = getCookie("user");
            

            if (theUser != null) {
                window.location.href = "MainPage.aspx";
            }

        }


    });

    

</script>

</body>
</html>

