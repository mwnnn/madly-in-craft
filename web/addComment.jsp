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
        DatabaseInfo db = new DatabaseInfo();
        Calendar calendar = Calendar.getInstance();
        String userID = "";
        String isi = "";
        String tutID = "";
        if (request.getMethod() == "POST") {
            userID = request.getParameter("uid");
            isi = request.getParameter("komentar");
            tutID = request.getParameter("tutorialId");
        }
        
        String query = "INSERT INTO comment VALUES (null,'" + tutID + "','" + userID + "','" + isi + "','" + new java.sql.Timestamp(calendar.getTime().getTime()) + "');";
        db.doUpdate(query);
        response.sendRedirect("tutorial.jsp?id=1");
    %>
            
</body>
</html>
