<%-- 
    Document   : tutorial
    Created on : Apr 12, 2014, 7:37:45 AM
    Author     : acer
--%>

<%@page import="java.util.Calendar"%>
<%@page import="com.madlyincraft.Comment"%>
<%@page import="com.madlyincraft.TutorialStep"%>
<%@page import="com.madlyincraft.Material"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.madlyincraft.Tutorial"%>
<%@page import="com.madlyincraft.DatabaseInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! Tutorial t = new Tutorial();%>
<%
    // post handler
    DatabaseInfo db = new DatabaseInfo();
    if (request.getMethod() == "POST") {
        if (request.getParameter("action").equalsIgnoreCase("comment")) {
            Calendar calendar = Calendar.getInstance();
            String userID = "";
            String isi = "";
            String tutID = "";
            if (request.getMethod() == "POST") {
                userID = request.getParameter("uid");
                isi = request.getParameter("komentar");
                tutID = request.getParameter("tutorialID");

                out.println(tutID);
                String query = "INSERT INTO comment VALUES (null,'" + tutID + "','" + userID + "','" + isi + "','" + new java.sql.Timestamp(calendar.getTime().getTime()) + "');";
                db.doUpdate(query);
                response.sendRedirect("tutorial.jsp?id=" + tutID);
            }
        } else if (request.getParameter("action").equalsIgnoreCase("Like")) {
            String query = "UPDATE tutorial SET"
                    + " total_like=total_like + 1"
                    + " WHERE id='" + request.getParameter("id") + "'";
            //out.println(query);
            db.doUpdate(query);

            //db.addLike(request.getParameter("id"));
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
    <%
        // get username
        HttpSession sess = request.getSession();
        String username = (String) sess.getAttribute("username");
        System.out.println(username);
    %>

    <div class="row">
        <h2 class="heading"><%=t.getTitle()%></h2>
        <div class="col-md-7">
            <img class="img-responsive" src="uploads/<%= t.getFeatured_image()%>">
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
                    <img class="img-responsive share" src="http://3.bp.blogspot.com/-kRWxNK5xqEU/U08RWdLDU1I/AAAAAAAABFY/H_g7oHfJX0k/s1600/FB-f-Logo__blue_30.png"><!-- facebook -->
                    <img class="img-responsive" src="http://1.bp.blogspot.com/-0z2GGxmTRUs/U08RWcUyyrI/AAAAAAAABFc/DVXZBXPHxMQ/s1600/Twitter_logo_white_30.png"><!-- twitter -->
                </div>
                <div class="col-md-5">
                    <!--like-->
                    <form method="POST">
                        <input type="hidden" name="id" value="<%=t.getId()%>">
                        <input type="image" src="http://1.bp.blogspot.com/-wmIjVCcf2kE/U08TTD-JDHI/AAAAAAAABFs/Jytg4uRAJwE/s1600/love+button.png" name="action" value="Like"><!-- like button --> Love: <%=t.getTotal_like()%> <!-- number of like -->
                    </form>
                    <!--end of like-->
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
                <!--
                2. Alat 2 <br>
                3. Alat 3 <br>
                4. Bahan 1 <br>
                5. Bahan 2 <br>
                6. Bahan 3
                -->
                </td></tr>
            </table>
        </div><!--list od supplies -->
    </div>

    <% ArrayList<TutorialStep> tsList = t.getStep();
        for (TutorialStep ts : tsList) {
    %>
    <div class="row">
        <h2 class="heading">Instruction</h2>
        <div class="col-md-7 mbottom">
            <img class="img-responsive" src = "uploads/<%=ts.getLink_gambar()%>">
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
    </div>
    <%}%>               

    <div class="row">
        <h2 class="heading">Comments</h2>

        <div class="col-md-7">
            <table class="boxcolor">
                <tr><td>
                        <form class="comment" method="POST" role="form">
                            <div class="form-group">
                                <textarea name="komentar" class="form-control" rows="3" placeholder="Write your comment..." value=""></textarea>
                            </div>
                            <input type ="hidden" name="tutorialID" value="<%=t.getId()%>" />
                            <input type ="hidden" name="uid" value="<% if (username == null) {
                                    out.print("anon");
                                } else {
                                    out.print(username);
                                } %>" />
                            <button type="submit" class="btn btn-primary floatr" name="action" value="comment">Post</button>
                        </form>
                    </td></tr>
            </table>
        </div>
    </div> 
    <!-- comment form -->
    <div class="row">

        <div class="col-md-7">
            <table class="boxcolor" width="650px">
                <tr><td>
                        <div class="row comment2">
                            <div class="col-md-1 commentpad">AS:</div>
                            <div class="col-md-1"><img src="http://placehold.it/50x50"></div>
                            <div class="col-md-3 commentpad commentname">Namanya Namanya</div>
                            <div class="col-md-7">

                            </div>
                        </div>
                    </td></tr>
            </table>
        </div>
    </div><!-- comment other -->

    <%
        ArrayList<Comment> cList = t.getKomentar();%>
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
                    <img src="http://placehold.it/80x80">
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
        </div>
    </div>
    <%}%>


    <jsp:include page="footer.jsp"></jsp:include>
