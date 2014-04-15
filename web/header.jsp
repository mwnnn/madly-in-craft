<%-- 
    Document   : header
    Created on : Apr 12, 2014, 5:32:51 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Madly In Craft: Home</title>

        <!-- Bootstrap -->
        <link href="css/style.css" rel="stylesheet" media="screen">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  
                <ul class="nav navbar-nav">
                  <li><a href="index.jsp">Home</a></li>
                </ul>
                  
                <ul class="nav navbar-nav navbar-right">
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <p class="login">new user? please <a href="register.jsp">register</a></p>
                      <li>
                          <form class="navbar-form navbar-left" role="search">
                            <div class="form-group">
                              <input type="text" class="form-control" placeholder="username">
                              <input type="text" class="form-control" placeholder="password">
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
                  </li>
                </ul>
                  
              </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav><!-- header navigation -->
        
        <div class="container">
            <div class="mascot"><a href="index.jsp"><img class="mascotw" src="images/mascot.png"/></a></div>
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
                          <li><a href="category.jsp">Sewing</a></li>
                          <li><a href="category.jsp">Art</a></li>
                          <li><a href="category.jsp">Papercraft</a></li>
                          <li><a href="category.jsp">Jewelry</a></li>
                          <li><a href="category.jsp">Other</a></li>
                        </ul>
                      </li>

                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Search <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                          <form class="navbar-form navbar-left buttons" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search">
                            </div>
                            <button type="submit" class="btn btn-default">Submit</button>
                          </form>
                        </ul>
                      </li>

                      <li><a href="#">Gallery</a></li>
                    </ul>

                  </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
              </nav><!-- menu navigation -->
