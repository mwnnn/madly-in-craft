<%-- 
    Document   : index
    Created on : Apr 10, 2014, 10:44:37 PM
    Author     : acer
--%>

<%@page import="com.madlyincraft.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
<% // get featured tutorial: tutorial yang punya like terbanyak
    DatabaseInfo db = new DatabaseInfo();
    ArrayList<Tutorial> tutList = new ArrayList<Tutorial>();
    tutList = db.getFeaturedTutorial();
%>
<div class="row">
    <h2 class="heading">Featured</h2>
    <div class="col-md-7">
        <div id="slider" class="carousel slide">
            <div class="carousel-inner">
                <div class="item active">
                    <a href="tutorial.jsp">
                        <%//get image of the tuts%>
                        <img src="<%=tutList.get(0).getFeatured_image()%>">
                    </a>

                    <div class="carousel-caption">
                        <h4><%=tutList.get(0).getTitle()%></h4>
                        <p><%=tutList.get(0).getContent()%></p>
                    </div>
                </div>

                <div class="item">
                    <a href="tutorial.jsp">
                        <%//get image of the tuts%>
                        <img src="<%=tutList.get(1).getFeatured_image()%>">
                    </a>

                    <div class="carousel-caption">
                        <h4><%=tutList.get(1).getTitle()%></h4>
                        <p><%=tutList.get(1).getContent()%></p>
                    </div>
                </div>

                <div class="item">
                    <a href="tutorial.jsp">
                        <%//get image of the tuts%>
                        <img src="<%=tutList.get(2).getFeatured_image()%>">
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

    <%ArrayList<Tutorial> creationList = new ArrayList<Tutorial>();
        creationList = db.getFeaturedTutorial();%>
    <div class="col-md-5">
        <div id="slider2" class="carousel slide creation">
            <div class="carousel-inner">
                <div class="item active">
                    <img src="<%=creationList.get(0).getFeatured_image()%>">
                    <div class="carousel-caption">
                        <h4><%=creationList.get(0).getTitle()%></h4>
                        <p><%=creationList.get(0).getContent()%></p>
                    </div>
                </div>

                <div class="item">
                    <img src="<%=creationList.get(1).getFeatured_image()%>">

                    <div class="carousel-caption">
                        <h4><%=creationList.get(1).getTitle()%></h4>
                        <p><%=creationList.get(1).getContent()%></p>
                    </div>
                </div>

                <div class="item">
                    <img src="<%=creationList.get(2).getFeatured_image()%>">

                    <div class="carousel-caption">
                        <h4><%=creationList.get(2).getTitle()%></h4>
                        <p><%=creationList.get(2).getContent()%></p>
                    </div>
                </div>
            </div>

            <a class="left carousel-control" href="#slider2" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#slider2" data-slide="next">&rsaquo;</a>
        </div><!-- featured creation -->

        <%ArrayList<User> featuredMemberList = new ArrayList<User>();
            featuredMemberList = db.getFeaturedMember();%>
        <div id="slider3" class="carousel slide">
            <div class="carousel-inner">
                <div class="item active">
                      <img src="<%=featuredMemberList.get(0).getDisplay_picture()%>">

                    <div class="carousel-caption">
                        <h4><%=featuredMemberList.get(0).getUsername()%></h4>
                        <p>deskripsi 1</p>
                    </div>
                </div>

                <div class="item">
                    <img src="<%=featuredMemberList.get(1).getDisplay_picture()%>">

                    <div class="carousel-caption">
                        <h4><%=featuredMemberList.get(1).getUsername()%></h4>
                        <p>deskripsi 2</p>
                    </div>
                </div>

                <div class="item">
                    <img src="<%=featuredMemberList.get(2).getDisplay_picture()%>">

                    <div class="carousel-caption">
                       <h4><%=featuredMemberList.get(2).getUsername()%></h4>
                        <p>Deskripsi 3</p>
                    </div>
                </div>
            </div>

            <a class="left carousel-control" href="#slider3" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#slider3" data-slide="next">&rsaquo;</a>
        </div><!-- featured member -->
    </div>
</div><!-- featured carousel -->

<div class="row">
    <h2 class="heading">Latest Tutorial</h2>
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