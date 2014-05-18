<%-- 
    Document   : Profile
    Created on : Apr 12, 2014, 4:33:17 PM
    Author     : acer
--%>

<%@page import="com.madlyincraft.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.madlyincraft.DatabaseInfo"%>
<%@page import="com.madlyincraft.User"%>
<%@page import="com.madlyincraft.Tutorial"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! Tutorial t = new Tutorial();
    User user = new User();
%>
<%
    HttpSession sess = request.getSession();
    Object usernameObj = sess.getAttribute("username");
    DatabaseInfo db = new DatabaseInfo();

    if (request.getMethod() == "GET") {
        if (request.getParameter("id") != null) {
            user = db.getMemberData(request.getParameter("id"));
        } else {
            user = db.getMemberData(usernameObj.toString());
        }
    }
    if (request.getMethod() == "POST") {
        out.println("cek1");
        if (request.getParameter("action").equalsIgnoreCase("sendMessage")) {
            out.println("cek2");
            Calendar calendar = Calendar.getInstance();
            String senderID = usernameObj.toString();
            String receiverID = "";
            String isi = "";
            String tutID = "";
            if (request.getMethod() == "POST") {
                out.println("cek3");
                receiverID = request.getParameter("uid");
                isi = request.getParameter("komentar");
                String query = "INSERT INTO message VALUES (null,'" + senderID + "','" + receiverID + "','" + isi + "','" + new java.sql.Timestamp(calendar.getTime().getTime()) + "');";
                out.println(query);
                db.doUpdate(query);
                response.sendRedirect("profile.jsp?id=" + receiverID);
            }
        }
    }
    ArrayList<Tutorial> tutList = new ArrayList<Tutorial>();
    tutList = db.getUserTutorial(user.getUsername());
    user.setPesan(db.getMessageList("SELECT * FROM MESSAGE WHERE RECEIVER_ID='" + user.getUsername() + "' ORDER BY DATE_POSTED desc"));
    user.setLink(db.linkList("SELECT * FROM LINK WHERE USER_ID='" + user.getUsername() + "'"));
    ArrayList<String> lList = user.getLink();
    ArrayList<Message> mList = user.getPesan();
%>
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
            <div class="col-md-3 mbottom">
                <img src="<%=user.getDisplay_picture()%>">
        </div>
        <div class="col-md-9">
            <div class="row">
                <h3><%=user.getUsername()%></h3>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <p><%=user.getDescription()%></p>
                </div>
            </div>
            <div class="row">
                <p>Find me:</p>
            </div>

            <div class="row">
                <%for (String l : lList) {%>
                <li><a href="<%out.println(l);%>"><%out.println(l);%></a></li>
                    <%}%>
            </div>
        </div>
    </div>

    <div class="row">
        <a href="tutorialUser.jsp"><h2 class="heading">Tutorials (<%=tutList.size()%>)</h2></a>
        <% for (Tutorial t : tutList) {%>
        <div class="col-xs-6 col-md-3">
            <a href="tutorial.jsp?id=<%=t.getId()%>" class="thumbnail">
                <img src="<%=t.getFeatured_image()%>">
            </a>
        </div>
        <%}%>
    </div><!-- latest gallery thumbnails -->

    <div class="row">
        <h2 class="heading">Comments</h2>

        <div class="col-md-7">
            <table class="boxcolor">
                <%if (usernameObj != null) {%>
                <tr><td>
                        <form class="comment" method="POST" role="form">
                            <div class="form-group">
                                <textarea name="komentar" class="form-control" rows="3" placeholder="Write your comment..." value=""></textarea>
                            </div>
                            <input type ="hidden" name="tutorialID" value=<%=t.getId()%> />
                            <input type ="hidden" name="uid" value="<%=user.getUsername()%>" />
                            <button type="submit" name="action" value="sendMessage" class="btn btn-primary floatr">Post</button>
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
                            <div class="col-md-1"><a href="profile.jsp"><img src="<%=db.getMemberData(usernameObj.toString()).getDisplay_picture()%>"></a></div>
                            <div class="col-md-7">
                                <div class="col-md-3 commentpad commentname"><%=usernameObj%></div>
                            </div>
                        </div>
                    </td></tr>
                    <%} else {
                            out.println("Silakan login untuk meninggalkan pesan");
                        }%>
            </table>
        </div>
    </div><!-- comment other -->

    <% for (Message m : mList) {%>
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
                        User u = db.getMemberData(m.getSender());
                    %>
                    <a href="profile.jsp?id=<%=u.getUsername()%>"> <img src="<%=u.getDisplay_picture()%>" ></a>
                </div>
                <div class="col-md-10">
                    <table frame="box" width="535" height="70" class="usrcomment">
                        <div class="row">
                            <tr>
                            <div class="col-md-8"><td class="commentpad2"><%= m.getSender()%></td></div>
                            <div class="col-md-4"><td class="floatr commentpad3"><%= m.getTimestamp()%></td></div>
                            </tr>
                        </div>
                        <div class="row">
                            <tr>
                            <div class="col-md-12"><td class="commentpad4"><%= m.getContent()%></td></div>
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
