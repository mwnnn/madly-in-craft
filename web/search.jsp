<%-- 
    Document   : display
    Created on : Mar 27, 2014, 12:44:44 AM
    Author     : acer
--%>

<%@page import="com.madlyincraft.Tutorial"%>
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

<jsp:include page="header.jsp"></jsp:include>
<h4>Search Result(s):</h4>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/mic_db?zeroDateTimeBehavior=convertToNull", "root", "");
    Statement statement = connection.createStatement();

    String key = "";
    if (request.getMethod() == "GET") {
        key = request.getParameter("keyword");
    }
    ArrayList<Tutorial> tList = new ArrayList<Tutorial>();
    String query = "SELECT * FROM TUTORIAL WHERE TITLE LIKE '%" + key + "%';";
    statement.executeQuery(query);
    ResultSet resultset = statement.executeQuery(query);
    while (resultset.next()) {
        Tutorial t = new Tutorial(
                resultset.getString("user_id"),
                resultset.getTimestamp("date_posted"),
                resultset.getString("difficulty"),
                resultset.getString("title"),
                resultset.getString("content"),
                resultset.getInt("total_like")
        );
        tList.add(t);
    }
    for (Tutorial t : tList) {
%>

<p><%= t.getTitle()%></p>
<p><%= t.getTotal_like()%> Likes</p>
<p><%= t.getContent()%></p>
<hr />
<% }%>
</body>
</html>
