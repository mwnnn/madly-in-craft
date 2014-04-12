<%-- 
    Document   : display
    Created on : Mar 27, 2014, 12:44:44 AM
    Author     : acer
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.madlyincraft.DatabaseInfo" %>
<%@page import="com.madlyincraft.Comment" %>
<%@page import="java.util.ArrayList" %>

<%
    /**
     * HttpSession sess = request.getSession(); Object usernameObj =
     * sess.getAttribute("username");
     *
     * if (usernameObj == null) { response.sendRedirect("index.jsp"); return; }
     *
     * String idParam = "";
     *
     * if (request.getMethod() == "POST") { String action =
     * request.getParameter("action"); idParam = request.getParameter("id");
     *
     * }
     */
%> 

<jsp:include page="header.jsp"></jsp:include>
    <h4>Comment</h4>
    <hr />
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/mic_db?zeroDateTimeBehavior=convertToNull", "root", "");
    Statement statement = connection.createStatement();

    String query = "SELECT * FROM comment";
    ArrayList<Comment> cList = new ArrayList<Comment>();
    ResultSet resultset = statement.executeQuery(query);
    while (resultset.next()) {
        Comment c = new Comment(
                resultset.getString("id"),
                resultset.getString("content"),
                resultset.getTimestamp("date_posted"),
                resultset.getString("user_id")
        );
        cList.add(c);
    }
    for (Comment c : cList) {
%>

<p><%= c.getUname()%> posted at <%= c.getTimestamp()%></p>
<p><%= c.getContent()%></p>
<p>*****************************************************</p>
<% }%>
<p>Post a comment:<p>
<form name="commentForm" action="addComment.jsp" method="GET">
    <div>
        <textarea rows="4" cols="50" name="komentar" placeholder="Type your comment" required></textarea>
        <br />
        <input type ="hidden" name="uid" value="tamal">
        <input type="submit" name="action" value="Submit" />
    </div>
</form>
</body>
</html>
