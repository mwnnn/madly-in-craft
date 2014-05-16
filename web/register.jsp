<%-- 
    Document   : register
    Created on : Apr 12, 2014, 5:43:06 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Madly In Craft: Register</title>

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
    
<h2>New Member</h2>
<br>
<form class="form-horizontal registerform" role="form" action="RegisterHandler" method="POST">
  <div class="form-group">
    <label for="username" class="col-sm-2 control-label">Username</label>
    <div class="col-sm-4">
      <input type="text" name="username" class="form-control" placeholder="Username">
    </div>
  </div>
  <div class="form-group">
    <label for="password" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-4">
      <input type="password" name="password" class="form-control" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <label for="confirm_password" class="col-sm-2 control-label">Confirm Password</label>
    <div class="col-sm-4">
      <input type="password" name="password_confirm" class="form-control" placeholder="Confirm Password">
    </div>
  </div>
  <div class="form-group">
    <label for="email" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-4">
      <input type="email" name="email" class="form-control" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-10">
      <button type="submit" class="btn btn-primary">Register</button>
    </div>
  </div>
</form>
    
<jsp:include page="footer.jsp"></jsp:include>
