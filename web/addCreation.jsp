<%-- 
    Document   : addCreation
    Created on : May 1, 2014, 2:11:18 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Creation</title>

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

<h2>New Creation</h2>
<br>
<form class="form-horizontal" role="form" action="AddKreasiHandler" method="POST" enctype="multipart/form-data">
  <div class="form-group">
    <label for="title" class="col-sm-2 control-label">Title</label>
    <div class="col-sm-6">
        <input type="text" class="form-control" id="title" name="title">
    </div>
  </div>
  <div class="form-group">
    <label for="featuredImg" class="col-sm-2 control-label">Creation Image</label>
    <div class="col-sm-6">
        <p>Upload your creation image</p>
        <input type="file" id="creation_img" name="imageLink">
    </div>
  </div>
  <div class="form-group">
    <label for="description" class="col-sm-2 control-label">Description</label>
    <div class="col-sm-6">
      <textarea class="form-control" rows="3" placeholder="a brief description of your creation" name="description"></textarea>
    </div>
  </div>
    <div>
        <button type="submit" class="btn btn-primary btn-lg">Submit Creation</button>
    </div>
</form>   
<jsp:include page="footer.jsp"></jsp:include>
