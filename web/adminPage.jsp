<%-- 
    Document   : adminPage
    Created on : May 2, 2014, 1:58:30 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <h2 class="heading">Submited Tutorial</h2>
  
    <div class="heading">
        <table width="450" class="table">
            <th>#</th>
            <th>Tutorial</th>
            <th>Posted by</th>
            <th>Date Posted</th>
            <th></th>
            <th></th>
            <tr>
                <td>1</td>
                <td><a href="#">Tutorial 1</a></td>
                <td><a href="#">User1</a></td>
                <td><a href="#">Date1</a></td>
                <td><a href="#">Approve</a></td>
                <td><a href="#">Delete</a></td>
            </tr>
            <tr>
                <td>2</td>
                <td><a href="#">Tutorial 2</a></td>
                <td><a href="#">User2</a></td>
                <td><a href="#">Date2</a></td>
                <td><a href="#">Approve</a></td>
                <td><a href="#">Delete</a></td>
            </tr>
            <tr>
                <td>3</td>
                <td><a href="#">Tutorial 3</a></td>
                <td><a href="#">User3</a></td>
                <td><a href="#">Date3</a></td>
                <td><a href="#">Approve</a></td>
                <td><a href="#">Delete</a></td>
            </tr>
        </table>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
