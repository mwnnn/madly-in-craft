<%-- 
    Document   : creation
    Created on : May 2, 2014, 12:48:02 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <h2 class="heading">Creation Title</h2>
    <div class="col-md-7">
        <img class="img-responsive" src="http://placehold.it/650x450">
    </div><!--foto kreasi -->

    <div class="col-md-5">
        <div class="description">
            <table class="mbottom">
                <tr>
                    <td class="topleft">
                        <h3 style="margin-top: 0">Description</h3>
                        <p>
                            Yah apalah artinya
                        </p>
                        <p>Based on: <a href="#">Link Tutorial</a></p>
                    </td>
                </tr>
            </table>
        </div><!-- Deskripsi/Intro -->
        <div class="row">
            <div class="col-md-3 nopadr">
                <img class="img-responsive" src="http://placehold.it/70x50"> 
                <p>#VoteUP</p>           
            </div>
            <div class="col-md-3" style="padding-left: 0">
                <img class="img-responsive" src="http://placehold.it/70x50"> 
                <p>#VoteDOWN</p>           
            </div>
        </div><!-- Vote -->
    </div>
</div>
        
<jsp:include page="footer.jsp"></jsp:include>
