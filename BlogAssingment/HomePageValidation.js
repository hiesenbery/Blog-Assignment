
$(document).ready(function () {
    $("#btn-submit").click(function () {
        
        
        var pw1 = $("input#pw1").val();
        var pw2 = $("input#pw2").val();
        if (pw2 != "")
        {
            if (pw1 != pw2) {
                alert("The Repeat Password is wrong");
                $("input#pw2").val("");
                $("input#pw2").focus();
                return false;
            }
        }

        var email = $("input#Email1").val();
        if (!validateEmail(email)) {

            $("input#Email1").focus();
            return false;
        }

    });

    $("input#PhoneNo1").change(function()
    {
        var phoneNo = $("input#PhoneNo1").val();
        if (!validatePhoneNo(phoneNo)) {
            alert("Please enter valid phone number.");
            $("input#PhoneNo1").val("");
            $("input#PhoneNo1").focus();
            return false;
        }
    })
    

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

function validateEmail(email) {
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if (!emailReg.test(email)) {


        return false;
    } else {


        return true;
    }
}

function isInteger(n) {
    return Number(n) == n && n % 1 == 0;
}