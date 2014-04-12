<%-- 
    Document   : index
    Created on : Mar 9, 2014, 2:59:54 PM
    Author     : putih
--%>

<?xml version = "1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">


<jsp:include page="header.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.madlyincraft.DatabaseInfo" %>
<%@page import="com.madlyincraft.Book" %>
<%@page import="java.util.ArrayList" %>

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
<a href="index.jsp?logout">Logout</a><br />
<a href="login.jsp">Login</a><br />
        <h1>List Tutorial</h1>
        <form action = "/MadlyInCraft/BookViewer2" method = "get">

            <style type="text/css">
                .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
                .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
                .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
                .tg .tg-s6z2{text-align:center}
            </style>
            <table class="tg">
                <tr>
                    <th class="tg-s6z2">Nama Anda</th>
                    <th class="tg-s6z2"><input type = "text" name = "namamu" /><br /></th>
                </tr>
                <tr>
                    <td class="tg-031e">ISBN</td>
                    <td class="tg-031e"><input type = "text" name = "isbn" /><br /></td>
                </tr>
                <tr>
                    <td class="tg-031e">Judul</td>
                    <td class="tg-031e"><input type = "text" name = "title" /><br /></td>
                </tr>
                <tr>
                    <td class="tg-031e">Edisi</td>
                    <td class="tg-031e"><input type = "text" name = "edisi" /><br /></td>
                </tr>
                <tr>
                    <td class="tg-031e">Penerbit</td>
                    <td class="tg-031e"><input type = "text" name = "publisher" /><br /></td>
                </tr>
                <tr>
                    <td class="tg-031e">Harga</td>
                    <td class="tg-031e"><input type = "text" name = "price" /><br /></td>
                </tr>
                <tr>
                    <td class="tg-031e" colspan="2"><input type = "submit" value = "Submit" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
