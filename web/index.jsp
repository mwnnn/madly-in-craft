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
<% // get featured tutorial: tutorial yang punya like terbanyak
    DatabaseInfo db = new DatabaseInfo();
    ArrayList<Tutorial> tutList = new ArrayList<Tutorial>();
    tutList = db.getFeaturedTutorial();
%>
              <div class="row mtop-50">
                    <div class="col-md-7">
                        <h2 class="heading carousel-title">Featured Tutorial</h2>
                        <div id="slider" class="carousel slide">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <a href="tutorial.jsp?id=<%=tutList.get(0).getId()%>">
                                        <img class="img-responsive" src="<%=tutList.get(0).getFeatured_image()%>">
                                    </a>

                                    <div class="carousel-caption">
                                        <h4><%=tutList.get(0).getTitle()%></h4>
                                        <p><%=tutList.get(0).getContent()%></p>
                                    </div>
                                </div>

                                <div class="item">
                                     <a href="tutorial.jsp?id=<%=tutList.get(1).getId()%>">
                                        <%//get image of the tuts%>
                                        <img class="img-responsive" src="<%=tutList.get(1).getFeatured_image()%>">
                                    </a>

                                    <div class="carousel-caption">
                                        <h4><%=tutList.get(1).getTitle()%></h4>
                                        <p><%=tutList.get(1).getContent()%></p>
                                    </div>
                                </div>

                                <div class="item">
                                    <a href="tutorial.jsp?id=<%=tutList.get(1).getId()%>">
                                       <%//get image of the tuts%>
                                       <img class="img-responsive" src="<%=tutList.get(2).getFeatured_image()%>">
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
    ArrayList<Tutorial> creationList = new ArrayList<Tutorial>();
    creationList = db.getFeaturedTutorial();
%>                    
                    <div class="col-md-5">
                            <h2 class="heading carousel-title">Featured Creation</h2>
                            <div id="slider2" class="carousel slide creation">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <img class="img-responsive" src="<%=creationList.get(0).getFeatured_image()%>" width="450"><!-- 450x215 -->
                                        <div class="carousel-caption">
                                            <h4><%=creationList.get(0).getTitle()%></h4>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img class="img-responsive" src="<%=creationList.get(1).getFeatured_image()%>" width="450">

                                        <div class="carousel-caption">
                                            <h4><%=creationList.get(1).getTitle()%></h4>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img class="img-responsive" src="<%=creationList.get(2).getFeatured_image()%>" width="450">

                                        <div class="carousel-caption">
                                            <h4><%=creationList.get(2).getTitle()%></h4>
                                        </div>
                                    </div>
                                </div>

                                <a class="left carousel-control" href="#slider2" data-slide="prev">&lsaquo;</a>
                                <a class="right carousel-control" href="#slider2" data-slide="next">&rsaquo;</a>
                        </div><!-- featured creation -->

<%
    ArrayList<User> featuredMemberList = new ArrayList<User>();
    featuredMemberList = db.getFeaturedMember();
%>                        
                        <div>
                            <p class="heading carousel-title">Featured Member</p>
                            <div class="col-md-4">
                                <a href="profile.jsp"><img class="img-responsive" src="<%=featuredMemberList.get(0).getDisplay_picture()%>" width="118" height="118"></a>
                            </div>
                            <div class="col-md-4">
                                <a href="profile.jsp"><img class="img-responsive" src="<%=featuredMemberList.get(1).getDisplay_picture()%>" width="118" height="118"></a>
                            </div>
                            <div class="col-md-4">
                                <a href="profile.jsp"><img class="img-responsive" src="<%=featuredMemberList.get(2).getDisplay_picture()%>" width="118" height="118"></a>
                            </div>
                        </div><!-- featured member -->
                    </div>
              </div><!-- featured carousel -->
              
              <div class="row">
                <h2 class="heading">Latest Tutorial</h2>
                <%ArrayList<Tutorial> latestList = new ArrayList<Tutorial>();
                        latestList = db.getLatestTutorial();
                for(Tutorial t: latestList){%>
                <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp?id=<%=t.getId()%>" class="thumbnail">
                        <img class="img-responsive" src="<%= t.getFeatured_image()%>">
                    </a>
                </div>
                <%}%>
              </div><!-- latest tutorial thumbnails -->
              <!--<div class="row">
                  <h2 class="heading">Latest Tutorial</h2>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img class="img-responsive" src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img class="img-responsive" src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img class="img-responsive" src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img class="img-responsive" src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img class="img-responsive" src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img class="img-responsive" src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img class="img-responsive" src="http://placehold.it/250x250">
                    </a>
                  </div>
                  <div class="col-xs-6 col-md-3">
                    <a href="tutorial.jsp" class="thumbnail">
                      <img class="img-responsive" src="http://placehold.it/250x250">
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