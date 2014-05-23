<%-- 
    Document   : header
    Created on : Apr 12, 2014, 5:32:51 AM
    Author     : acer
--%>

<%@page import="com.madlyincraft.DatabaseInfo"%>
<%@page import="com.madlyincraft.Kategori"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <body>
        <%
            HttpSession sess = request.getSession();
            Object usernameObj = sess.getAttribute("username");
            boolean logged = false;
            
            String username = "";

            // cek session
            if (request.getParameter("logout") != null) {
                sess.setAttribute("username", null);
            } else if (usernameObj != null) {
                logged = true;
                username = (String) usernameObj;
            }

            if (request.getServletPath().equalsIgnoreCase("/register.jsp")) {
                String registerError = (String) sess.getAttribute("registerError");
                if (registerError != null) {
                    if (registerError.equals("not completed")) {
                        String alert = "Lengkapi semua isian!";
                        out.print("<script  type=\"text/javascript\">alert('" + alert + "');</script>");
                    }
                    if (registerError.equalsIgnoreCase("password not match")) {
                        String alert = "konfirmasi password salah!";
                        out.print("<script  type=\"text/javascript\">alert('" + alert + "');</script>");
                    }
                    if (registerError.equalsIgnoreCase("user exist")) {
                        String alert = "user dengan tersebut telah ada";
                        out.print("<script  type=\"text/javascript\">alert('" + alert + "');</script>");
                    }
                }
            }

            // check register
            String register = (String) sess.getAttribute("registerDone");
            if (register != null) {
                if (register.equalsIgnoreCase("done")) {
                    String alert = "registrasi berhasil. silakan login";
                    out.print("<script  type=\"text/javascript\">alert('" + alert + "');</script>");
                    sess.setAttribute("registerDone", null);
                    sess.setAttribute("registerError", null);
                }
            }
            DatabaseInfo db = new DatabaseInfo();
            ArrayList<Kategori> kList = db.getKategori();
        %>   
        <div class="container">
            <div class="row menunav">
                <div><a href="index.jsp"><img class="img-responsive mascotw" src="images/menubar.png"/></div>
                <nav class="navbar navbar-inverse navigation" role="navigation">
                    <div class="container-fluid">
                      <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                          <span class="sr-only">Toggle navigation</span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.jsp">Madly In Craft</a>
                      </div>

                      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                          <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categories <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <%for (Kategori k : kList) {%>
                                    <li><a href="category.jsp?kategori=<%=k.getNama_kategori()%>"><%=k.getNama_kategori()%></a></li>
                                    <%}%>
                                </ul>
                            </li>

                          <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Search <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <form class="navbar-form navbar-left buttons" action="search.jsp" method="GET" role="search">
                                        <div class="form-group">
                                            <input type="text" name="keyword" class="form-control" placeholder="Search">
                                        </div>
                                        <button type="submit" class="btn btn-default">Submit</button>
                                    </form>
                                </ul>
                            </li>

                          <li><a href="gallery.jsp">Gallery</a></li>

                          <li class="dropdown">
                            <% if (!logged) {%>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <p class="login">new user? please <a href="register.jsp">register</a></p>
                                <li>
                                    <form class="navbar-form navbar-left" role="search" action="LoginHandler" method="POST">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="username" name="username">
                                            <input type="password" class="form-control" placeholder="password" name="password">
                                        </div>
                                        <button type="submit" class="btn btn-default">Login</button>
                                    </form>
                                </li>
                                <li class="divider"></li>
                                <p class="login">forgot your password?</p>
                                <li>
                                    <form class="navbar-form navbar-left" role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="email">
                                        </div>
                                        <button type="submit" class="btn btn-default">Recover</button>
                                    </form>
                                </li>
                                <li class="divider"></li>
                            </ul>
                            <% } else { %>
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=sess.getAttribute("username")%><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                  <li>
                                      <a href="profile.jsp">My Profile</a>
                                  </li>
                                  <li>
                                      <a href="editprofile.jsp">Edit Profile</a>
                                  </li>
                                  <li>
                                      <a href="tutorialUser.jsp">My Tutorial</a>
                                  </li>
                                  <li>
                                      <a href="addTutorial.jsp">Write Tutorial</a>
                                  </li>
                                  <li>
                                      <a href="gallery.jsp">My Gallery</a>
                                  </li>
                                  <li>
                                      <a href="index.jsp?logout" name="logout">Logout</a>
                                  </li>
                                </ul>
                            <% }%>
                          </li>
                        </ul>

                      </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                  </nav><!-- menu navigation -->
            </div>
