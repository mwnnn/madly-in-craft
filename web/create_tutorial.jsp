<%-- 
    Document   : create_tutorial
    Created on : Apr 12, 2014, 2:49:43 PM
    Author     : putih
--%>

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
    }
//    } else if (usernameObj != null) {
//        response.sendRedirect("display.jsp");
//    }
    if (usernameObj == null) {
        response.sendRedirect("login.jsp");
        return;
    }


%>

<jsp:include page="header.jsp"></jsp:include>
    <body>
        <h1>Create Tutorial</h1>

        <form method="post">
            <table>
                <tr>
                    <td>Judul</td>
                    <td> <input name="title" type="text" id="title" /> </td>
                </tr>
                <tr>
                    <td>Isi</td>
                    <td> <input name="content" type="text" id="content" /> </td>
                </tr>
                <tr>
                    <td>Tingkat Kesulitan</td>
                    <td> <input name="difficulty" type="text" id="difficulty" /> </td>
                </tr>
                <tr>
                    <td>Kategori</td>
                    <td> <input name="kategori" type="text" id="kategori" /> </td>
                </tr>
            </table>
            <input name="submit" type="submit" class="submit" id="loginButton" value ="Create Tutorial" />
        </form>
    <%        boolean isCreate = false;
        boolean success = false;
        String title = "";
        String content = "";
        String difficulty = "";
        String kategori = "";
        
        DatabaseInfo db = new DatabaseInfo();

        if (request.getMethod() == "POST") {
            String action = request.getParameter("action");
            title = request.getParameter("title");
            content = request.getParameter("content");
            difficulty = request.getParameter("difficulty");
            kategori = request.getParameter("kategori");

            if (action.equals("Create Tutorial")) {
                isCreate = true;
            }
        }

        if (isCreate) {
            success = db.addLike(tutorialId);
            if (success) {
                response.sendRedirect("success.jsp");
            }
    %>
</body>
</html>