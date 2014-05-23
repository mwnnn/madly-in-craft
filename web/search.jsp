<%-- 
    Document   : category
    Created on : Apr 12, 2014, 6:52:49 AM
    Author     : acer
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.madlyincraft.Tutorial"%>
<%@page import="com.madlyincraft.DatabaseInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ArrayList<Tutorial> tList = new ArrayList<Tutorial>();
    String url;
    String heading;
%>
<%
    DatabaseInfo db = new DatabaseInfo();
    if (request.getMethod() == "GET") {
         tList = db.getByKeyword(request.getParameter("keyword"));
         heading = "Search Result(s) for  '" + request.getParameter("keyword") + "'";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Madly In Craft: Category</title>

        <!-- Bootstrap -->
        <link href="css/style.css" rel="stylesheet" media="screen">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
<jsp:include page="header.jsp"></jsp:include>

    <h2><%= heading%></h2>
    <br>

    <div class="row">
        <% 
        if(tList.size() == 0){
            out.println("Not Found");
        } else {
        for(Tutorial t: tList){ 
            url = "tutorial.jsp?id=" + t.getId();
        %>
        <div class="col-xs-6 col-md-3">
            <a href="<%= url %>" class="thumbnail">
                <img src="uploads/<%= t.getFeatured_image()%>">
            </a>
            <h4><%=t.getTitle()%></h4>
        </div>
        <%}}%>
    </div><!-- latest tutorial thumbnails -->
    <!--
    <div class="row">
        <div class="col-md-12">
            <ul class="pagination">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </div>
    -->
 

<jsp:include page="footer.jsp"></jsp:include>
