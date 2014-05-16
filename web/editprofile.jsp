<%-- 
    Document   : editProfile
    Created on : May 1, 2014, 11:17:10 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<form class="form-horizontal" role="form">
    <div class="form-group">
      <label for="pp" class="col-sm-2 control-label">Profile Picture</label>
      <div class="col-sm-6">
          <img src="http://placehold.it/150x150">
          <input type="file" id="profile_picture">
          <button type="submit" class="btn btn-default">Upload</button>
      </div>
    </div>
    <div class="form-group">
        <label for="username" class="col-sm-2 control-label">Username</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="username" value="Nama username di sini">
        </div>
    </div>
    <div class="form-group">
        <label for="about" class="col-sm-2 control-label">About</label>
        <div class="col-sm-6">
            <textarea class="form-control" rows="5" value="Tulisan aboutnya di sini"></textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="about" class="col-sm-2 control-label">About</label>
        <div class="col-sm-6">
            <textarea class="form-control" rows="5" value="Tulisan aboutnya di sini"></textarea>
        </div>
    </div>
    <div class="form-group form-inline">
        <label for="website" class="col-sm-2 control-label">Websites</label>
        <div class="col-sm-6">
            <div id="link" class="mbottom-10">
                <div>
                    <input type="text" class="form-control" placeholder="Label">
                    <input type="text" class="form-control" placeholder="URL">
                    <a href="#" class="btn btn-danger removelink">&times;</a>
                </div>
            </div>
            <a href="#" id="addLink" class="btn btn-info">Add Link</a>
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Save</button>
</form>
    
<jsp:include page="footer.jsp"></jsp:include>
