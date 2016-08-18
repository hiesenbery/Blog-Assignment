
$(function () {
    $("label.error").hide()
    $(".button").click(function () {
        $("label.error").hide();

        var name = $("input#Name").val();
        if (name == "") {
            $("label#name_error").show();
            $("input#Name").focus();
            return false;
        }

        var age = $("input#Age").val();
        if (age == "")
        {
            $("label#age_error").show();
            $("input#Age").focus();
            return false;
        }
        else {
            if(!isInteger(age))
            {
                $("label#validAge").show();
                $("input#Age").focus();
                return false;
            }
        }

        var zipcode = $("input#ZipCode").val();
        if (zipcode == "")
        {
            $("label#zip_error").show();
            $("input#ZipCode").focus();
            return false;
        }
        else {
            if(!isInteger(zipcode))
            {
                $("label#validZipCode").show();
                $("input#ZipCode").focus();
                return false;
            }
        }
        var phoneNo = $("input#PhoneNo").val();
        if (phoneNo == "") {
            $("label#phone_error").show();
            $("input#PhoneNo").focus();
            return false;
        }
        else {
            if(!validatePhoneNo(phoneNo))
            {
                $("#validPhoneNo").show()
                $("input#PhoneNo").focus();
                return false;
            }
        }

        var email = $("input#Email").val();
        if (email == "") {
            $("label#email_error").show();
            $("input#Email").focus();
            return false;
        }
        else {
            if (!validateEmail(email)) {
                $("#validEmail").show();
                $("input#Email").focus();
                return false;
            }
        }
    });
    //$('#form1').on('keypress', function (e) {
    //    return e.which !== 13;
    //});

});

function validatePhoneNo(phoneNo)
{
    var filter = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
    if(filter.test(phoneNo))
    {
        return true;
    }
    else {
        return false;
    }
}

function validateEmail(email)
{
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if (!emailReg.test(email)) {


        return false;
    } else {


        return true;
    }
}

function isInteger(n)
{
    return Number(n) == n && n % 1 == 0;
}