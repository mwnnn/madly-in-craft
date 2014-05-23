<%-- 
    Document   : tutorialUser
    Created on : May 2, 2014, 12:24:15 AM
    Author     : acer
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.madlyincraft.DatabaseInfo"%>
<%@page import="com.madlyincraft.User"%>
<%@page import="com.madlyincraft.Tutorial"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! Tutorial t = new Tutorial();
    User user = new User();
%>
<%
    HttpSession sess = request.getSession();
    Object usernameObj = sess.getAttribute("username");
    DatabaseInfo db = new DatabaseInfo();
    if (usernameObj != null) {
        user = db.getMemberData(usernameObj.toString());
    }
    ArrayList<Tutorial> tutList = new ArrayList<Tutorial>();
    
    if (request.getMethod() == "GET") {
        if (request.getParameter("uid") != null) {
            tutList = db.getUserTutorial(request.getParameter("uid"));
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>User Tutorial</title>

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

        <div class="row">
            <h2 class="heading">User Tutorial</h2><br>
        <% for (Tutorial t : tutList) {%>
        <div class="col-xs-6 col-md-3">
            <a href="tutorial.jsp?id=<%=t.getId()%>" class="thumbnail">
                <img src="uploads/<%=t.getFeatured_image()%>">
            </a>
        </div>
        <%}%>
    </div>
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
    </div> 
    <jsp:include page="footer.jsp"></jsp:include>
