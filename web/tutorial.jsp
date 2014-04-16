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
            }

            String query = "INSERT INTO comment VALUES (null,'" + tutID + "','" + userID + "','" + isi + "','" + new java.sql.Timestamp(calendar.getTime().getTime()) + "');";
            db.doUpdate(query);
            response.sendRedirect("tutorial.jsp?id=" + tutID);
        }
        if (request.getParameter("action").equalsIgnoreCase("like")) {
            db.addLike(String.valueOf(t.getId()));
        }
    }
    if (request.getMethod() == "GET") {
        t = db.getTutorialByID(request.getParameter("id"));
    }
%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>

    <div class="row">
        <h2 class="heading"><%=t.getTitle()%></h2>
    <div class="col-md-7">
        <img src=<%= t.getFeatured_image()%>
    </div><!--foto tutorial -->

    <div class="col-md-5">
        <div class="description">
            <table width="450" height="240">
                <tr>
                    <td class="topleft">
                        <h3 style="margin-top: 0">Deskripsi</h3>
                        <p> <%= t.getContent()%> </p>
                        <p>Tingkat kesulitan : <%= t.getDifficulty()%></p>

                    </td>
                </tr>
            </table>
        </div><!-- Deskripsi/Intro -->
        <div class="mbottom">
            <form method="POST">
                <!--<img src="http://placehold.it/450x50">-->
                <input type="submit" name="action" value="Like">
            </form>
            
        </div><!-- Time -->
        <div class="mbottom">
            <img src="http://placehold.it/450x50">
        </div><!-- Difficulty -->

        <div class="row"> 
            <div class="col-md-4">Share</div>
            <div class="col-md-8">Like</div>
        </div><!-- share label -->

        <div class="row">
            <div class="col-md-4">
                <img class="share" src="http://placehold.it/30x30"><!-- facebook -->
                <img src="http://placehold.it/30x30"><!-- twitter -->
            </div>
            <div class="col-md-8">
                <img src="http://placehold.it/30x30"><!-- like button -->
                <img src="http://placehold.it/130x30"><!-- number of like -->
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

<div class="row">
    <% ArrayList<TutorialStep> tsList = t.getStep();
        for (TutorialStep ts : tsList) {
    %>
    <h2 class="heading">Instruction</h2>
    <div class="col-md-7">
        <img src = <%=ts.getLink_gambar()%>>
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
    <h2 class="heading">Comments</h2>

    <div class="col-md-7">
        <table class="boxcolor">
            <tr><td>
                    <form class="comment" method="POST" role="form">
                        <div class="form-group">
                            <textarea name="komentar" class="form-control" rows="3" placeholder="Write your comment..." value=""></textarea>
                        </div>
                        <input type ="hidden" name="tutorialID" value="1" />
                        <input type ="hidden" name="uid" value="Namanya Namanya" />
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
