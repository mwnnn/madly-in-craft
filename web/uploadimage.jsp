<%-- 
    Document   : uploadimage
    Created on : Apr 12, 2014, 2:05:02 PM
    Author     : putih
--%>

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
<h1>Upload image</h1>
<form action="UploadServlet" method="post"
      enctype="multipart/form-data">
    <input type="file" name="file" size="50" />
    <br />
    <input type="submit" value="Upload File" />
</body>
</html>