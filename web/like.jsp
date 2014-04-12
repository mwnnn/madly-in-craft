<%-- 
    Document   : like
    Created on : Apr 12, 2014, 12:51:33 PM
    Author     : putih
--%>


<%@page import="com.madlyincraft.Tutorial"%>
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
<h1>Fungsi Like</h1>
<table summary="Our Bookstore" border="1px" class="table">
    <thead>
        <tr style="text-align: center">
            <th>ID</th>
            <th>User_ID</th>
            <th>Title</th>
            <th>Content</th>
        </tr>
    </thead>
    <tbody>
        <%
            DatabaseInfo db = new DatabaseInfo();

            ArrayList<Tutorial> tutorialList = new ArrayList<Tutorial>();
            tutorialList = db.getAllTutorial();

            for (Tutorial t : tutorialList) {
        %>

        <tr>
            <td><%= t.getId()%></td>
            <td><%= t.getUser_id()%></td>
            <td><%= t.getTitle()%></td>
            <td><%= t.getContent()%></td>
            <td>
                <form method="post">
                    <input type="hidden" name="tutorialId" value="<%=t.getId()%>" />
                    <input type="submit" name="action" class="submit" value="Like"
                           onclick="alert('+1 !')"/>
                </form>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>
<br />
<%
    boolean isLike = false;
    String tutorialId = "";

    if (request.getMethod() == "POST") {
        String action = request.getParameter("action");
        tutorialId = request.getParameter("tutorialId");
        out.println(tutorialId);

        if (action.equals("Like")) {
            isLike = true;
        }
    }

    if (isLike) {
        int success = db.addLike(tutorialId);
        out.println(success);
        if (success > 0) {
            response.sendRedirect("success.jsp");
        } else {
            out.println("gagal");
        }
    }
%>
</body>
</html>
