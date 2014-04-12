<%-- 
    Document   : editprofile
    Created on : Apr 12, 2014, 11:34:49 AM
    Author     : putih
--%>

<%
    HttpSession sess = request.getSession();
    Object usernameObj = sess.getAttribute("username");

    if (request.getParameter("logout") != null) {
        sess.setAttribute("username", null);
        response.sendRedirect("login.jsp");
        return;
    }
    if (usernameObj == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<script>
    function confirmPw()
    {
        var username = document.forms["editprofileform"]["username"].value;
        var name = document.forms["editprofileform"]["name"].value;
        var dp = document.forms["editprofileform"]["dp"].value;
        var email = document.forms["editprofileform"]["email"].value;
        
        if (username == null || username == "") {
            alert("fill all the form!");
            return false;
        }
        if (name == null || name == "") {
            alert("fill all the form!");
            return false;
        }
        if (dp == null || dp == "") {
            alert("fill all the form!");
            return false;
        }
        if (email == null || email == "") {
            alert("fill all the form!");
            return false;
        }

        var oldPassword = document.forms["editprofileform"]["newpassword"].value;
        var newPassword = document.forms["editprofileform"]["confirmnewpassword"].value;
        if (!(oldPassword == newPassword))
        {
            alert("new password not match");
            return false;
        }
        return true;
    }
</script> 
<a href="index.jsp?logout">Logout</a><br />
<a href="login.jsp">Login</a><br />
<h1>Edit Profile</h1>
<form onsubmit="return confirmPw()" name="editprofileform" action = "/MadlyInCraft/EditProfileHandler" method = "post">

    <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
        .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
        .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
        .tg .tg-s6z2{text-align:center}
    </style>
    <table class="tg">
        <tr>
            <th class="tg-s6z2">Username</th>
            <th class="tg-s6z2"><input type = "text" name = "username" /><br /></th>
        </tr>
        <tr>
            <td class="tg-031e">Full Name</td>
            <td class="tg-031e"><input type = "text" name = "name" /><br /></td>
        </tr>
        <tr>
            <td class="tg-031e">Display Picture</td>
            <td class="tg-031e"><input type = "text" name = "dp" /><br /></td>
        </tr>
        <tr>
            <td class="tg-031e">Email</td>
            <td class="tg-031e"><input type = "text" name = "email" /><br /></td>
        </tr>
    </table>
    <h2>Change password</h2>
    <table class="tg">
        <tr>
            <th class="tg-s6z2">old password</th>
            <th class="tg-s6z2"><input type = "text" name = "oldpassword" /><br /></th>
        </tr>
        <tr>
            <td class="tg-031e">new password</td>
            <td class="tg-031e"><input type = "text" name = "newpassword" /><br /></td>
        </tr>
        <tr>
            <td class="tg-031e">confirm new password</td>
            <td class="tg-031e"><input type = "text" name = "confirmnewpassword" /><br /></td>
        </tr>
    </table>
    <input name="submit" type="submit" class="submit" id="loginButton" value="Login" />
</form>
</body>
</html>
