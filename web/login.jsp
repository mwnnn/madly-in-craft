<%-- 
    Document   : register
    Created on : Mar 27, 2014, 1:16:34 AM
    Author     : putih
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sess = request.getSession();
    Object usernameObj = sess.getAttribute("username");

    if (request.getParameter("logout") != null) {
        sess.setAttribute("username", null);
    } else if (usernameObj != null) {
        response.sendRedirect("index.jsp");
    }
%>   

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>

        <form action="LoginHandler" method="post">
            <table>
                <tr>
                    <td>nama</td>
                    <td> <input name="name" type="text" id="name" /> </td>
                </tr>
                <tr>
                    <td>password</td>
                    <td> <input name="password" type="password" id="password" /> </td>
                </tr>
            </table>
            <input name="submit" type="submit" class="submit" id="loginButton" value ="Login" />
        </form>
    </body>
</html>
