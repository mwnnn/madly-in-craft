<%-- 
    Document   : index
    Created on : Apr 10, 2014, 10:44:37 PM
    Author     : acer
--%>

<%@page import="com.madlyincraft.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Madly In Craft: Home</title>

        <!-- Bootstrap -->
        <link href="css/style.css" rel="stylesheet" media="screen">
        <script  src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <jsp:include page="header.jsp"></jsp:include>    
    <%
        // get username
        HttpSession sess = request.getSession();
        String username = (String) request.getAttribute("username");

        // get featured tutorial: tutorial yang punya like terbanyak
        DatabaseInfo db = new DatabaseInfo();
        ArrayList<Tutorial> tutList = new ArrayList<Tutorial>();
        tutList = db.getFeaturedTutorial();
    %>
    <div class="row mtop-50">
        <%//featured tutorial%>
        <div class="col-md-7">
            <h2 class="heading carousel-title">Featured Tutorial</h2>
            <div id="slider" class="carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <a href="tutorial.jsp?id=<%=tutList.get(0).getId()%>">
                            <img class="img-responsive" src="uploads/<%=tutList.get(0).getFeatured_image()%>">
                        </a>

                        <div class="carousel-caption">
                            <h4><%=tutList.get(0).getTitle()%></h4>
                            <p><%=tutList.get(0).getContent()%></p>
                        </div>
                    </div>

                    <div class="item">
                        <a href="tutorial.jsp?id=<%=tutList.get(1).getId()%>">
                            <%//get image of the tuts%>
                            <img class="img-responsive" src="uploads/<%=tutList.get(1).getFeatured_image()%>">
                        </a>

                        <div class="carousel-caption">
                            <h4><%=tutList.get(1).getTitle()%></h4>
                            <p><%=tutList.get(1).getContent()%></p>
                        </div>
                    </div>

                    <div class="item">
                        <a href="tutorial.jsp?id=<%=tutList.get(1).getId()%>">
                            <%//get image of the tuts%>
                            <img class="img-responsive" src="uploads/<%=tutList.get(2).getFeatured_image()%>">
                        </a>

                        <div class="carousel-caption">
                            <h4><%=tutList.get(2).getTitle()%></h4>
                            <p><%=tutList.get(2).getContent()%></p>
                        </div>
                    </div>
                </div>

                <a class="left carousel-control" href="#slider" data-slide="prev">&lsaquo;</a>
                <a class="right carousel-control" href="#slider" data-slide="next">&rsaquo;</a>
            </div>
        </div><!--featured tutorial -->

        <%
            // featured creation list
            ArrayList<Fotokreasi> creationList = new ArrayList<Fotokreasi>();
            creationList = db.getFeaturedFotokreasi();
        %>                    
        <div class="col-md-5">
            <h2 class="heading carousel-title">Featured Creation</h2>
            <div id="slider2" class="carousel slide creation">
                <div class="carousel-inner">
                    <div class="item active">
                        <a href="creation.jsp?id=<%=creationList.get(0).getId()%>">
                            <img class="img-responsive" src="uploads/<%=creationList.get(0).getUrl()%>" width="450"><!-- 450x215 -->
                        </a>
                        <div class="carousel-caption">
                            <h4><%=creationList.get(0).getTitle()%></h4>
                        </div>
                    </div>

                    <div class="item">
                        <a href="creation.jsp?id=<%=creationList.get(1).getId()%>">
                            <img class="img-responsive" src="uploads/<%=creationList.get(1).getUrl()%>" width="450">
                        </a>
                        <div class="carousel-caption">
                            <h4><%=creationList.get(1).getTitle()%></h4>
                        </div>
                    </div>

                    <div class="item">
                        <a href="creation.jsp?id=<%=creationList.get(2).getId()%>">
                            <img class="img-responsive" src="uploads/<%=creationList.get(2).getUrl()%>" width="450">
                        </a>
                        <div class="carousel-caption">
                            <h4><%=creationList.get(2).getTitle()%></h4>
                        </div>
                    </div>
                </div>

                <a class="left carousel-control" href="#slider2" data-slide="prev">&lsaquo;</a>
                <a class="right carousel-control" href="#slider2" data-slide="next">&rsaquo;</a>
            </div><!-- featured creation -->
            <%
            // featured user
                ArrayList<User> featuredMemberList = new ArrayList<User>();
                featuredMemberList = db.getFeaturedMember();
            %>                        
            <div>
                <p class="heading carousel-title">Featured Member</p>
                <div class="col-md-4">
                    <a href="profile.jsp?id=<%=featuredMemberList.get(0).getUsername()%>"><img class="img-responsive" src="uploads/pp/<%=featuredMemberList.get(0).getDisplay_picture()%>" width="118" height="118"></a>
                </div>
                <div class="col-md-4">
                    <a href="profile.jsp?id=<%=featuredMemberList.get(1).getUsername()%>"><img class="img-responsive" src="uploads/pp/<%=featuredMemberList.get(1).getDisplay_picture()%>" width="118" height="118"></a>
                </div>
                <div class="col-md-4">
                    <a href="profile.jsp?id=<%=featuredMemberList.get(2).getUsername()%>"><img class="img-responsive" src="uploads/pp/<%=featuredMemberList.get(2).getDisplay_picture()%>" width="118" height="118"></a>
                </div>
            </div><!-- featured member -->
        </div>
    </div><!-- featured carousel -->

    <div class="row">
        <h2 class="heading">Latest Tutorial</h2>
        <%ArrayList<Tutorial> latestList = new ArrayList<Tutorial>();
            latestList = db.getLatestTutorial();
            for (Tutorial t : latestList) {%>
        <div class="col-xs-6 col-md-3">
            <a href="tutorial.jsp?id=<%=t.getId()%>" class="thumbnail">
                <img class="img-responsive" src="uploads/<%= t.getFeatured_image()%>" width="250" height="250">
            </a>
        </div>
        <%}%>
        <p align="right"><a href="tutorials.jsp">View All</a></p>
    </div><!-- latest tutorial thumbnails -->
    <jsp:include page="footer.jsp"></jsp:include>   