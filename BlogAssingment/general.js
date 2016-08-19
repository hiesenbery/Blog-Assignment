function signOut()
{
    alert("Signing out");
    $.ajax({
        type: "POST",
        url: "GetData.aspx/SignOut",
        data: "{}",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        async: false,
        success: function (response) {
            alert("Success");
        },
        error: function (response) {
            alert("Error: " + response.responseText);
        }
    });
}