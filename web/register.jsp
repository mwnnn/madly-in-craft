<%-- 
    Document   : register
    Created on : Mar 27, 2014, 1:57:02 AM
    Author     : putih
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
        <h1>Register</h1>

        <form action="RegisterHandler" method="post">
            <table>
                <tr>
                    <td>nama</td>
                    <td> <input name="name" type="text" id="name" /> </td>
                </tr>
                <tr>
                    <td>password</td>
                    <td> <input name="password" type="password" id="password" /> </td>
                </tr>
                <tr>
                    <td>ulang password</td>
                    <td> <input name="password_confirm" type="password" id="password_confirm" /> </td>
                </tr>
            </table>
            <input name="submit" type="submit" class="submit" id="registerButton" value ="Register" />
        </form>
    </body>
</html>
