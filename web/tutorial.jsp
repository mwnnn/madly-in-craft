<%-- 
    Document   : tutorial
    Created on : Apr 12, 2014, 7:37:45 AM
    Author     : acer
--%>

<%@page import="com.madlyincraft.Fotokreasi"%>
<%@page import="com.madlyincraft.User"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.madlyincraft.Comment"%>
<%@page import="com.madlyincraft.TutorialStep"%>
<%@page import="com.madlyincraft.Material"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.madlyincraft.Tutorial"%>
<%@page import="com.madlyincraft.DatabaseInfo"%>
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
    if (request.getMethod() == "POST") {
        if (request.getParameter("action").equalsIgnoreCase("comment")) {
            Calendar calendar = Calendar.getInstance();
            String userID = "";
            String isi = "";
            String tutID = "";
            String parentID = "0";
            if (request.getMethod() == "POST") {
                userID = request.getParameter("uid");
                isi = request.getParameter("komentar");
                tutID = request.getParameter("tutorialID");
                parentID = request.getParameter("pid");
                String query = "INSERT INTO comment VALUES (null,'" + tutID + "','" + userID + "','" + isi + "','" + new java.sql.Timestamp(calendar.getTime().getTime()) + "'," + parentID + ");";
                out.println(query);
                db.doUpdate(query);
                response.sendRedirect("tutorial.jsp?id=" + tutID);
            }
        }
        if (request.getParameter("action").equalsIgnoreCase("Like")) {
            String query = "UPDATE tutorial SET"
                    + " total_like=total_like + 1"
                    + " WHERE id='" + request.getParameter("id") + "'";
            db.doUpdate(query);
            response.sendRedirect("tutorial.jsp?id=" + request.getParameter("id"));
        }
    }
    if (request.getMethod() == "GET") {
        t = db.getTutorialByID(request.getParameter("id"));
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Madly In Craft: <%= t.getTitle()%></title>

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
            <h2 class="heading"><%=t.getTitle()%></h2>
        <div class="col-md-7">
            <img class="img-responsive" src=uploads/<%= t.getFeatured_image()%>>
        </div><!--foto tutorial -->

        <div class="col-md-5">
            <div class="description">
                <table>
                    <tr>
                        <td class="topleft">
                            <h3 style="margin-top: 0">Description</h3>
                            <p>
                                <%= t.getContent()%>
                            </p>
                            <p>Tingkat kesulitan : <%= t.getDifficulty()%></p>
                        </td>
                    </tr>
                </table>
            </div><!-- Deskripsi/Intro -->
            <div class="mbottom">
                <img class="img-responsive" src="http://placehold.it/450x50">
            </div><!-- Time -->
            <div class="mbottom">
                <img class="img-responsive" src="http://placehold.it/450x50">
            </div><!-- Difficulty -->

            <div class="row"> 
                <div class="col-md-7">Share</div>
                <div class="col-md-5">Love this tutorial?</div>
            </div><!-- share and like label -->

            <div class="row">
                <div class="col-md-7">
                    <div id="fb-root"></div>
                    <script>(function(d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id))
                                return;
                            js = d.createElement(s);
                            js.id = id;
                            js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));</script>
                    <div class="fb-share-button" data-href="https://madlyincraft.cloudapps.net/tutorial.jsp" data-type="button_count"></div>
                    <br /><br />
                    <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en">Tweet</a>
                    <script>!function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (!d.getElementById(id)) {
            js = d.createElement(s);
            js.id = id;
            js.src = "https://platform.twitter.com/widgets.js";
            fjs.parentNode.insertBefore(js, fjs);
        }
    }(document, "script", "twitter-wjs");</script>
                </div>
                <div class="col-md-5">
                    <form method="POST">
                        <input type="hidden" name="id" value="<%=t.getId()%>">
                        <input type="image" src="http://1.bp.blogspot.com/-wmIjVCcf2kE/U08TTD-JDHI/AAAAAAAABFs/Jytg4uRAJwE/s1600/love+button.png" name="action" value="Like">
                        <!-- like button --> Love: <%=t.getTotal_like()%> <!-- number of like -->
                    </form>

                </div>
            </div>

        </div>
    </div><!-- Tutorial Intro -->

    <div class="row">
        <h2 class="heading">Supplies</h2>
        <div class="col-md-5">
            <table width="1000">
                <% ArrayList<Material> mList = t.getBahan();
                    for (Material m : mList) {
                %>
                <p><%=m.getId()%>. <%=m.getNama()%></p>
                <%}%>
                </td></tr>
            </table>
        </div><!--list od supplies -->
    </div>

    <div class="row">
        <h2 class="heading">Instruction</h2>
        <% ArrayList<TutorialStep> tsList = t.getStep();
            for (TutorialStep ts : tsList) {
        %>
        <div class="col-md-7 mbottom">
            <img class="img-responsive" src="uploads/<%=ts.getLink_gambar()%>" width="450" height="450">
        </div><!--instruction -->
        <div class="col-md-5">
            <table width="450" height="450">
                <tr>
                    <td class="topleft">
                        <h3 style="margin-top: 0">Step <%=ts.getNomor()%></h3>
                        <p><%=ts.getDeskripsi()%></p>
                    </td>
                </tr>
            </table>
        </div><!--Description -->
        <%}%>
    </div>


    <div class="row">
        <div class="col-md-3">
            <h2 class="heading"><a href="gallery.jsp?tid=<%=t.getId()%>">User's Creation</a></h2>
        </div>
        <div class="col-md-offset-9">
            <a href="addCreation.jsp" class="btn btn-info">Add Your Creation</a>
        </div>
    </div>
    <div class="row">
        <%ArrayList<Fotokreasi> latestList = new ArrayList<Fotokreasi>();
            latestList = db.getTutorialkreasi(String.valueOf(t.getId()));
            for (Fotokreasi t : latestList) {%>
        <div class="col-xs-6 col-md-3">
            <a href="creation.jsp?id=<%=t.getId()%>" class="thumbnail">
                <img class="img-responsive" src="uploads/<%= t.getUrl()%>" width="250" height="250">
            </a>
        </div>
        <%}%>
    </div><!-- foto kreasi thumbnail -->

    <div class="row">
        <h2 class="heading">Comments</h2>

        <div class="col-md-7">
            <table class="boxcolor">
                <tr><td>
                        <%if (usernameObj != null) {%>
                        <form class="comment" method="POST" role="form">
                            <div class="form-group">
                                <textarea name="komentar" class="form-control" rows="3" placeholder="Write your comment..." value=""></textarea>
                            </div>
                            <input type ="hidden" name="tutorialID" value=<%=t.getId()%> />
                            <input type ="hidden" name="uid" value="<%=usernameObj%>" />
                            <button type="submit" name="action" value="comment" class="btn btn-primary floatr">Post</button>
                        </form>
                    </td></tr>
            </table>
        </div>
    </div> <!-- comment form -->
    <div class="row">

        <div class="col-md-7">
            <table class="boxcolor" width="650px">
                <tr><td>
                        <div class="row comment2">
                            <div class="col-md-1 commentpad">AS:</div>
                            <div class="col-md-1"><a href="profile.jsp"><img src="uploads/pp/<%=user.getDisplay_picture()%>" width="50" height="50"></a></div>
                            <div class="col-md-7">
                                <div class="col-md-3 commentpad commentname"><%=usernameObj%></div>
                            </div>
                        </div>
                    </td></tr>
                    <%} else {
                            out.println("Silakan login untuk memberi komentar");
                        }%>
            </table>
        </div>
    </div><!-- comment other -->

    <%
        ArrayList<Comment> cList = t.getKomentar();
    %>
    <% for (Comment c : cList) {%>
    <div class="row">
        <div class="col-md-7">
            <p class="borderline"></p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-7">
            <div class="row">
                <div class="col-md-2">
                    <%
                        User u = db.getMemberData(c.getUname());
                    %>
                    <a href="profile.jsp?id=<%=u.getUsername()%>"> <img src="uploads/pp/<%=u.getDisplay_picture()%>" width="80" height="80"> </a>
                </div>
                <div class="col-md-10">
                    <table frame="box" width="535" height="70" class="usrcomment">
                        <div class="row">
                            <tr>
                            <div class="col-md-8"><td class="commentpad2"><%= c.getUname()%></td></div>
                            <div class="col-md-4"><td class="floatr commentpad3"><%= c.getTimestamp()%></td></div>
                            </tr>
                        </div>
                        <div class="row">
                            <tr>
                            <div class="col-md-12"><td class="commentpad4"><%= c.getContent()%></td></div>
                            <td></td>
                            </tr>
                        </div>
                        <div class="row">
                            <tr>
                            <div class="col-md-12"><td class="commentpad4"><a href="#">Reply</a></td></div>
                            <td></td>
                            </tr>
                        </div>
                    </table>
                </div>
            </div>
        </div>
        <%
            //ini bagian kalo komennya reply dari komen lain
            if (c.getChilds() != null) {
                for (Comment cs : c.getChilds()) {
        %>
        <div class="row" style="margin-left:90px">
            <div class="col-md-7">
                <div class="row">
                    <div class="col-md-2">
                        <%
                            User us = db.getMemberData(cs.getUname());
                        %>
                        <a href="profile.jsp?id=<%=us.getUsername()%>"> <img src="uploads/pp/<%=us.getDisplay_picture()%>" width="80" height="80"> </a>
                    </div>
                    <div class="col-md-10">
                        <table frame="box" width="535" height="70" class="usrcomment">
                            <div class="row">
                                <tr>
                                <div class="col-md-8"><td class="commentpad2"><%= cs.getUname()%></td></div>
                                <div class="col-md-4"><td class="floatr commentpad3"><%= cs.getTimestamp()%></td></div>
                                </tr>
                            </div>
                            <div class="row">
                                <tr>
                                <div class="col-md-12"><td class="commentpad4"><%= cs.getContent()%></td></div>
                                </tr>
                            </div>
                            <div class="row">
                                <tr>
                                <div class="col-md-12"><td class="commentpad4"><a href="#">Reply</a></td></div>
                                </tr>
                            </div>
                        </table>
                    </div>
                </div>
                <%
                        }
                    }%>
            </div>

            <%}%>
            <jsp:include page="footer.jsp"></jsp:include>
