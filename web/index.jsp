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
    ArrayList<Tutorial> tutList = db.getFeaturedTutorial();
    
%>
<div class="row">
    <h2 class="heading">Featured</h2>
    <div class="col-md-7">
        <div id="slider" class="carousel slide">
            <div class="carousel-inner">
                <div class="item active">
                    <a href="tutorial.jsp">
                        <img src="http://placehold.it/650x450">
                    </a>

                    <div class="carousel-caption">
                        <h4><%=tutList.get(0).getTitle()%></h4>
                        <p><%=tutList.get(0).getContent()%></p>
                    </div>
                </div>

                <div class="item">
                    <a href="tutorial.jsp">
                        <img src="http://placehold.it/650x450">
                    </a>

                    <div class="carousel-caption">
                        <h4><%=tutList.get(1).getTitle()%></h4>
                        <p><%=tutList.get(1).getContent()%></p>
                    </div>
                </div>

                <div class="item">
                    <a href="tutorial.jsp">
                        <img src="http://placehold.it/650x450">
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

    <div class="col-md-5">
        <div id="slider2" class="carousel slide creation">
            <div class="carousel-inner">
                <div class="item active">
                    <img src="http://placehold.it/450x215">

                    <div class="carousel-caption">
                        <h4>Judul 1</h4>
                        <p>Deskripsi 1</p>
                    </div>
                </div>

                <div class="item">
                    <img src="http://placehold.it/450x215">

                    <div class="carousel-caption">
                        <h4>Judul 2</h4>
                        <p>Deskripsi 2</p>
                    </div>
                </div>

                <div class="item">
                    <img src="http://placehold.it/450x215">

                    <div class="carousel-caption">
                        <h4>Judul 3</h4>
                        <p>Deskripsi 3</p>
                    </div>
                </div>
            </div>

            <a class="left carousel-control" href="#slider2" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#slider2" data-slide="next">&rsaquo;</a>
        </div><!-- featured creation -->

        <div id="slider3" class="carousel slide">
            <div class="carousel-inner">
                <div class="item active">
                    <img src="http://placehold.it/450x215">

                    <div class="carousel-caption">
                        <h4>Judul 1</h4>
                        <p>Deskripsi 1</p>
                    </div>
                </div>

                <div class="item">
                    <img src="http://placehold.it/450x215">

                    <div class="carousel-caption">
                        <h4>Judul 2</h4>
                        <p>Deskripsi 2</p>
                    </div>
                </div>

                <div class="item">
                    <img src="http://placehold.it/450x215">

                    <div class="carousel-caption">
                        <h4>Judul 3</h4>
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