<%-- 
    Document   : adminPage
    Created on : May 2, 2014, 1:58:30 PM
    Author     : acer
--%>

<%@page import="com.madlyincraft.Tutorial"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.madlyincraft.DatabaseInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Madly In Craft: Profile</title>

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
            <h2 class="heading">Submited Tutorial</h2>

            <div class="heading">
                <table width="450" class="table">
                    <th>#</th>
                    <th>Tutorial</th>
                    <th>Posted by</th>
                    <th>Date Posted</th>
                    <th></th>
                    <th></th>
                    <% // get unapproved tutorials
                        DatabaseInfo db = new DatabaseInfo();
                        ArrayList<Tutorial> tut = db.getUnapprovedTutorial();

                        // loop the table
                        int i = 1;
                        for (Tutorial t : tut) {
                    %>
                <tr>
                    <td><%=i%></td>
                    <td>
                        <div class="row">
                            <div class="col-md-2">
                                <img src="uploads/<%=t.getFeatured_image()%>" width="120px" height="83px" />
                            </div>
                            <div class="col-md-10" >
                                <div class="row">
                                    <a href="tutorial.jsp?id=<%=t.getId()%>"><%=t.getTitle()%></a>
                                </div>
                                <div class="row">
                                    <p>
                                        <%= t.getContent()%>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td><%=t.getUser_id()%></td>
                    <td><%=t.getDate_posted()%></td>
                </tr>
                <%i++;}%>
            </table>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
