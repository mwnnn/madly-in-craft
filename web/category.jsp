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
    String kategori;
%>
<%
    DatabaseInfo db = new DatabaseInfo();

    if (request.getMethod() == "GET") {
        kategori = request.getParameter("kategori");
        tList = db.getByCategory(kategori);
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
    
<h2><%=kategori%></h2>
<br>

<div class="row">
    <%
        if (tList.size() == 0) {
            out.println("No Tutorial in This Category");
        } else {
            for (Tutorial t : tList) {
                url = "tutorial.jsp?id=" + t.getId();

    %>
    <div class="col-xs-6 col-md-3">
        <a href="<%= url%>" class="thumbnail">
            <img src="<%= t.getFeatured_image()%>">
            <h4><%=t.getTitle()%></h4>
        </a>
    </div>
    <%}
        }%>
</div><!-- latest tutorial thumbnails -->
                  <!--<div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                    <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img src="http://placehold.it/250x250">
                    </a>
                  </div>
              </div><!-- latest tutorial thumbnails -->
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
