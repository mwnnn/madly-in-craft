<%-- 
    Document   : gallery
    Created on : May 2, 2014, 12:24:15 AM
    Author     : acer
--%>

<%@page import="com.madlyincraft.Fotokreasi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.madlyincraft.DatabaseInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% // get featured tutorial: tutorial yang punya like terbanyak
    int jumlah = 0;
    int start = 0;
    int end = 0;
    int numb = 0;
    DatabaseInfo db = new DatabaseInfo();
    ArrayList<Fotokreasi> kList = new ArrayList<Fotokreasi>();
    kList = db.getAllFotokreasi();
    if (request.getMethod() == "GET") {
        if (request.getParameter("uid") != null) {
            kList = db.getUserkreasi(request.getParameter("uid"));
        }
        if (request.getParameter("tid") != null) {
            kList = db.getTutorialkreasi(request.getParameter("tid"));
        }
        if (request.getParameter("page") == null) {
            numb = 1;
        } else {
        numb = Integer.parseInt(request.getParameter("page"));
        }
        jumlah = kList.size() / 8 + 1;
        start = 8 * (numb - 1);
        end = start + 8;
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Gallery</title>

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
            <h2 class="heading">Gallery</h2><br>
        <%            //for (Fotokreasi k : kList) {
            for (int index = start; index < end && index < kList.size(); index++) {
                Fotokreasi k = kList.get(index);
        %>
        <div class="col-xs-6 col-md-3">
            <a href="creation.jsp?id=<%=k.getId()%>" class="thumbnail">                        
                <img src="uploads/<%=k.getUrl()%>" width="250" height="250">
            </a>
        </div>
        <%}%>
    </div>
    <div class="row">
        <div class="col-md-12">
            <ul class="pagination">
                <li <%if (numb == 1) {%>class="disabled"<%;
                    }%>><a href="gallery.jsp?page=<%=numb - 1%>">&laquo;</a></li>
                    <%for (int i = 1; i <= jumlah; i++) {%>
                <li><a href="gallery.jsp?page=<%=i%>"><%=i%></a></li>
                    <%}%>
                <li <%if (numb == jumlah) {%>class="disabled"<%;
                    }%>><a href="gallery.jsp?page=<%=numb + 1%>">&raquo;</a></li>
            </ul>
        </div>
    </div> 
    <jsp:include page="footer.jsp"></jsp:include>
