<%-- 
    Document   : editProfile
    Created on : May 1, 2014, 11:17:10 PM
    Author     : acer
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.madlyincraft.User"%>
<%@page import="com.madlyincraft.DatabaseInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    User user = new User();
%>
<%
    HttpSession sess = request.getSession();
    // in case cannot online, use: sess.setAttribute("username", "mawan");
    Object usernameObj = sess.getAttribute("username");
    DatabaseInfo db = new DatabaseInfo();
    user = db.getMemberData(usernameObj.toString());
    user.setLink(db.linkList("SELECT * FROM LINK WHERE USER_ID='" + user.getUsername() + "'"));
    ArrayList<String> lList = user.getLink();
//    if (request.getMethod() == "POST") {
//        if (request.getParameter("action").equals("edit")) {
//            String query;
//            String query2;
//            String query3;
//            String uname = request.getParameter("username");
//            String description = request.getParameter("about");
//            String pp = request.getParameter("picture");
//            query = "UPDATE user SET description='" + description + "' WHERE USERNAME='" + user.getUsername() + "';";
//            query2 = "UPDATE user SET DISPLAY_PICTURE='" + pp + "' WHERE USERNAME='" + user.getUsername() + "';";
//            query3 = "INSERT INTO link VALUES(null, '" + user.getUsername() + "','" + request.getParameter("link") + "')";
//            db.doUpdate(query);
//            db.doUpdate(query2);
//            db.doUpdate(query3);
//            session.setAttribute("username", uname);
//            //out.println(query);
//            response.sendRedirect("profile.jsp");
//        }
//    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Profile</title>

        <!-- Bootstrap -->
        <link href="css/style.css" rel="stylesheet" media="screen">
        <script  src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
        <script type="text/javascript" src="js/addRemoveField.js"></script>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <jsp:include page="header.jsp"></jsp:include>

        <h2>Edit Profile</h2>
        <br>
        <form action="EditProfileHandler" class="form-horizontal" role="form" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="pp" class="col-sm-2 control-label">Profile Picture</label>
                <div class="col-sm-6">
                    <img src="uploads/pp/<%=user.getDisplay_picture()%>">
                <input type="file" id="profile_picture" name="picture">
            </div>
        </div>
        <div class="form-group">
            <label for="username" class="col-sm-2 control-label">Username</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" id="username" value="<%=user.getUsername()%>">
            </div>
        </div>
        <div class="form-group">
            <label for="about" class="col-sm-2 control-label">About</label>
            <div class="col-sm-6">
                <textarea name="about" id="about" class="form-control" rows="5"><%=user.getDescription()%></textarea>
            </div>
        </div>
        <div class="form-group form-inline">
            <label for="website" class="col-sm-2 control-label">Websites</label>
            <div class="col-sm-6">
                <div id="link" >
                    <%for (String l : lList) {%>
                    <div class="mbottom-10">
                        <input type="text" class="form-control" placeholder="Label" name="linkLabel">
                        <input type="text" class="form-control" value="<%out.println(l);%>" name="link" >
                        <a href="#" class="btn btn-danger removelink">&times;</a>
                    </div>
                    <%}%>
                    <div class="mbottom-10">
                        <input type="text" class="form-control" placeholder="Label" name="linkLabel">
                        <input name="link" class="form-control" placeholder="URL" type="text" >
                        <a href="#" class="btn btn-danger removelink" >&times;</a>
                    </div>
                </div>
                <a href="#" id="addLink" class="btn btn-info">Add Link</a>
            </div>
        </div>
        <button type="submit" name="action" value="edit" class="btn btn-primary" >Save</button>
    </form>

    <jsp:include page="footer.jsp"></jsp:include>
