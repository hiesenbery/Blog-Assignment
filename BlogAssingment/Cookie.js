function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return null;
}

function verifyUserCookie() {
    var userCookie = getCookie("user");
    var verified = false;

    if (userCookie == null) return;

    $.ajax({
        type: "POST",
        url: "GetData.aspx/SignIn",
        data: JSON.stringify(userCookie),
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        async: false,
        success: function (response) {
            verified = response.d;
        },
        error: function (response) {
        }
    });

    return verified;
}
