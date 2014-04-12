<%-- 
    Document   : display
    Created on : Mar 27, 2014, 12:44:44 AM
    Author     : acer
--%>

<%@page import="java.util.Calendar"%>

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
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/mic_db?zeroDateTimeBehavior=convertToNull", "root", "");
        Statement statement = connection.createStatement();
        Calendar calendar = Calendar.getInstance();
        String userID = "";
        String isi = "";
        if (request.getMethod() == "GET") {
            userID = request.getParameter("uid");
            isi = request.getParameter("komentar");
        }
        
        String query = "INSERT INTO comment VALUES (null, 3,'" + userID + "','" + isi + "','" + new java.sql.Timestamp(calendar.getTime().getTime()) + "');";
        statement.executeUpdate (query);
        response.sendRedirect("comments.jsp");
    %>
            
</body>
</html>
