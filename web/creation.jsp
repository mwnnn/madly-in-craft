<%-- 
    Document   : creation
    Created on : May 2, 2014, 12:48:02 AM
    Author     : acer
--%>

<%@page import="com.madlyincraft.User"%>
<%@page import="com.madlyincraft.Tutorial"%>
<%@page import="com.madlyincraft.DatabaseInfo"%>
<%@page import="com.madlyincraft.Fotokreasi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!Fotokreasi k = new Fotokreasi();
    Tutorial t = new Tutorial();
%>
<!DOCTYPE html>
<%
    HttpSession sess = request.getSession();
    Object usernameObj = sess.getAttribute("username");
    DatabaseInfo db = new DatabaseInfo();

    if (request.getMethod() == "GET") {
        if (request.getParameter("id") != null) {
            k = db.getKreasiById(request.getParameter("id"));
            t = db.getTutorialByID(String.valueOf(k.getTutorial_id()));
        }
    }

    if (request.getMethod() == "POST") {
        if (request.getParameter("action").equalsIgnoreCase("VoteUp")) {
            //db.addVoteUp(request.getParameter("id"));
            String query = "UPDATE Foto_kreasi SET"
                    + " total_voteup=total_voteup + 1"
                    + " WHERE id='" + request.getParameter("id") + "'";
            db.doUpdate(query);
            response.sendRedirect("creation.jsp?id=" + request.getParameter("id"));
        }
        if (request.getParameter("action").equalsIgnoreCase("VoteDown")) {
            //db.addVoteDown(request.getParameter("id"));
            String query = "UPDATE Foto_kreasi SET"
                    + " total_votedown=total_votedown + 1"
                    + " WHERE id='" + request.getParameter("id") + "'";
            db.doUpdate(query);
            response.sendRedirect("creation.jsp?id=" + request.getParameter("id"));
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Creation</title>

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
            <h2 class="heading"><%=k.getTitle()%></h2>
        <h4 class="heading">By <a href="profile.jsp?id=<%=k.getUser_id()%>"><%=k.getUser_id()%></a></h4>
        <div class="col-md-7">
            <img class="img-responsive" src="uploads/<%=k.getUrl()%>" width="650" height="450">
        </div><!--foto kreasi -->

        <div class="col-md-5">
            <div class="description">
                <table class="mbottom">
                    <tr>
                        <td class="topleft">
                            <h3 style="margin-top: 0">Description</h3>
                            <p>
                                <%=k.getDescription()%>
                            </p>
                            <p>Based on: <a href="tutorial.jsp?id=<%=t.getId()%>"><%=t.getTitle()%></a></p>
                        </td>
                    </tr>
                </table>
            </div><!-- Deskripsi/Intro -->
            <div class="row">
                <div class="col-md-3 nopadr">
                    <form method="POST">
                        <input type="hidden" name="id" value="<%=k.getId()%>">
                        <input type="image" src="http://1.bp.blogspot.com/-wmIjVCcf2kE/U08TTD-JDHI/AAAAAAAABFs/Jytg4uRAJwE/s1600/love+button.png" name="action" value="VoteUp">
                    </form>
                    <p><!-- vote up button --><%=k.getTotal_vote_up()%> <!-- number of vote up --></p>
                </div>
                <div class="col-md-3" style="padding-left: 0">
                    <form method="POST">
                        <input type="hidden" name="id" value="<%=k.getId()%>">
                        <input type="image" src="http://1.bp.blogspot.com/-wmIjVCcf2kE/U08TTD-JDHI/AAAAAAAABFs/Jytg4uRAJwE/s1600/love+button.png" name="action" value="VoteDown">
                    </form>
                    <p><!-- vote down button --><%=k.getTotal_vote_down()%> <!-- number of vote down --></p>           
                </div>
            </div><!-- Vote -->
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
