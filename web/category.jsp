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
                for (int i = 0; i < 8; i++) {
                    Tutorial t = tList.get(i);
                    url = "tutorial.jsp?id=" + t.getId();
        %>
        <div class="col-xs-6 col-md-3">
            <a href="<%= url%>" class="thumbnail">
                <img src="uploads/<%= t.getFeatured_image()%>">
                <h4><%=t.getTitle()%></h4>
            </a>
        </div>
        <%}
            }%>
    </div><!-- latest tutorial thumbnails -->

    <%// pagination
        // 1 page 4x4 box, 1-16
        // next page (pg 2)should be 17 till 17+16-1 = 32
        // 16*(2-1)+1 til 16*2*%>
    <div class="row">
        <div class="col-md-12">
            <ul class="pagination">
                <% 
                    // mencari nilai pagination awal yeeeeey
                    String startPage = "";
                    if (request.getParameter("p") == null || request.getParameter("page").equals("1")) {
                        startPage = null;
                    } else {
                        startPage = "1";
                    }
                    if (startPage != null) {
                %>
                <li><a href="<%= request.getRequestURL()%>?kategori=<%= kategori%>&p=1">&laquo;</a></li>
                    <% }%>
                    <% // this should be looping...
                        // count the tutorials
                        double count = db.countAllTutorial();
                        int pageMax = (int) Math.ceil(count / 8.0);
                        for (int i = 1; i <= pageMax; i++) {
                    %>
                <li><a href="<%= request.getRequestURL()%>?kategori=<%= kategori%>&page=<%=i%>"><%=i%></a></li>
                    <%}
                        // mencari nilai pagination akhir yeeeeey
                        String lastPage = "";
                        if (request.getParameter("page") == null || request.getParameter("page").equals("" + pageMax)) {
                            lastPage = null;
                        } else {
                            lastPage = "" + pageMax;
                        }
                        if (lastPage != null) {
                    %>
                <li><a href="<%= request.getRequestURL()%>?kategori=<%= kategori%>&page=<%=pageMax%>">&raquo;</a></li>
                    <% }%>
            </ul>
        </div>
    </div> 

    <jsp:include page="footer.jsp"></jsp:include>
