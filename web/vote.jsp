<%-- 
    Document   : vote
    Created on : Apr 12, 2014, 2:22:28 PM
    Author     : putih
--%>

<%@page import="com.madlyincraft.Fotokreasi"%>
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
<h1>Fungsi Vote</h1>
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

            ArrayList<Fotokreasi> fotoKreasiList = new ArrayList<Fotokreasi>();
            fotoKreasiList = db.getAllFotokreasi();

            for (Fotokreasi f : fotoKreasiList) {
        %>

        <tr>
            <td><%= f.getId()%></td>
            <td><%= f.getTutorial_id()%></td>
            <td><%= f.getUser_id()%></td>
            <td><%= f.getDate_posted()%></td>
            <td>
                <form method="POST">
                    <input type="hidden" name="fotokreasiId" value="<%=f.getId()%>" />
                    <input type="submit" name="action" class="submit" value="Vote Up"
                           onclick="alert('Vote Up +1 !')"/>
                    <input type="submit" name="action" class="submit" value="Vote Down"
                           onclick="alert('Vote Down +1 !')"/>
                </form>
            </td>
        </tr>
        <% }
            boolean isVoteUp = false;
            boolean isVoteDown = false;
            boolean success = false;
            String fotokreasiId = "";

            if (request.getMethod() == "POST") {
                String action = request.getParameter("action");
                fotokreasiId = request.getParameter("fotokreasiId");

                if (action.equals("Vote Up")) {
                    isVoteUp = true;
                }
                if (action.equals("Vote Down")) {
                    isVoteDown = true;
                }
            }

            if (isVoteUp) {
                success = db.addVoteUp(fotokreasiId);
            }
            if (isVoteDown) {
                success = db.addVoteDown(fotokreasiId);
            }

        %>
    </tbody>
</table>
<%            if (success) {
        response.sendRedirect("success.jsp");
    } else {
        out.println("gagal");
    }
%>
</body>
</html>
