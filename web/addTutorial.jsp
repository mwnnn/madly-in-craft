<%-- 
    Document   : addTutorial
    Created on : May 1, 2014, 2:11:18 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Write Tutorial</title>

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

        <h2>New Tutorial</h2>
        <br>
        <form class="form-horizontal" role="form" action="AddTutorialHandler" method="POST" enctype="multipart/form-data">
            <!--title-->
            <div class="form-group">
                <label for="title" class="col-sm-2 control-label">Title</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="title" name="title">
                </div>
            </div>
            <!--end of title-->
            <!--category -->
            <div class="form-group">
                <label for="exampleInputFile" class="col-sm-2 control-label">Category</label>
                <div class="col-sm-6">
                    <p>Choose your craft category</p>
                    <div class="row">
                        <div class="col-sm-4 ctr">
                            <label class="category">
                                <div><img alt="Icon sewing" src="http://placehold.it/70x70"></div>
                                <strong><input id="sewing" name="category" type="radio" value="sewing">Sewing</strong>
                                <br>
                                <small class="muted">Crafts that is made with sewing machine or hand stitching</small>
                            </label>
                        </div>
                        <div class="col-sm-4 ctr">
                            <label class="category">
                                <div><img alt="Icon art" src="http://placehold.it/70x70"></div>
                                <strong><input id="art" name="category" type="radio" value="art">Art</strong>
                                <br>
                                <small class="muted">Drawing, painting, graphic design, decoration, etc.</small>
                            </label>
                        </div>
                        <div class="col-sm-4 ctr">
                            <label class="category">
                                <div><img alt="Icon jewelry" src="http://placehold.it/70x70"></div>
                                <strong><input id="jewelry" name="category" type="radio" value="jewelry">Jewelry</strong>
                                <br>
                                <small class="muted">Bracelet, ring, necklace, earrings, wirework, beading, etc.</small>
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4 ctr">
                            <label class="category">
                                <div><img alt="Icon papercraft" src="http://placehold.it/70x70"></div>
                                <strong><input id="paper" name="category" type="radio" value="papercraft">Papercraft</strong>
                                <br>
                                <small class="muted">Card making, paper folding, book making, etc.</small>
                            </label>
                        </div>
                        <div class="col-sm-4 ctr">
                            <label class="category">
                                <div><img alt="Icon other" src="http://placehold.it/70x70"></div>
                                <strong><input id="other" name="category" type="radio" value="other">Other</strong>
                                <br>
                                <small class="muted">Mixed crafts or everything else.</small>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <!--end of category-->
            <!--featured image-->
            <div class="form-group">
                <label for="featuredImg" class="col-sm-2 control-label">Featured Image</label>
                <div class="col-sm-6">
                    <p>Upload the result image of your craft</p>
                    <input type="file" id="featured_img" name="imageLink">
                </div>
            </div>
            <!--end of featured image-->
            <!--description-->
            <div class="form-group">
                <label for="description" class="col-sm-2 control-label">Description</label>
                <div class="col-sm-6">
                    <textarea class="form-control" rows="3" placeholder="a brief description/introduction of your tutorial" name="description"></textarea>
                </div>
            </div>
            <!--end of description-->
            <!--difficulty-->
            <div class="form-group">
                <label for="difficulty" class="col-sm-2 control-label">Difficulty</label>
                <div class="col-sm-6">
                    <select class="form-control" name="difficulty">
                        <option>Easy</option>
                        <option>Medium</option>
                        <option>Hard</option>
                    </select>
                </div>
            </div>
            <!--difficulty-->
            <!--supplies-->
            <div class="form-group">
                <label for="supplies" class="col-sm-2 control-label">Supplies</label>
                <div class="col-sm-6">
                    <div id="supply">
                        <div class="row mbottom-10">
                            <div class="col-sm-11 nopadr"><input class="form-control" type="text" name="supply"></div><a href="#" class="btn btn-danger removeclass">&times;</a>
                        </div>
                        <div class="row mbottom-10">
                            <div class="col-sm-11 nopadr"><input class="form-control" type="text" name="supply"></div><a href="#" class="btn btn-danger removeclass">&times;</a>
                        </div>
                        <div class="row mbottom-10">
                            <div class="col-sm-11 nopadr"><input class="form-control" type="text" name="supply"></div><a href="#" class="btn btn-danger removeclass">&times;</a>
                        </div>
                    </div>
                    <a href="#" id="AddMoreFileBox" class="btn btn-info">Add Supply</a>
                </div>
            </div>
            <!--end of supplies-->
            <!--instruction-->
            <div class="form-group">
                <label for="instruction" class="col-sm-2 control-label">Instructions</label>
                <div class="col-sm-6">
                    <div id="step">
                        <div class="row mbottom-10">
                            <div class="col-sm-4">
                                <input type="file" id="featured_img" name="tutStepImage">
                            </div>
                            <div class="col-sm-7 nopadr">
                                <textarea class="form-control" rows="8" name="tutStep"></textarea>
                            </div>
                            <a href="#" class="btn btn-danger removestep">&times;</a>
                        </div>
                        <div class="row mbottom-10">
                            <div class="col-sm-4">
                                <input type="file" id="featured_img" name="tutStepImage">
                            </div>
                            <div class="col-sm-7 nopadr">
                                <textarea class="form-control" rows="8" name="tutStep"></textarea>
                            </div>
                            <a href="#" class="btn btn-danger removestep">&times;</a>
                        </div>
                        <div class="row mbottom-10">
                            <div class="col-sm-4">
                                <input type="file" id="featured_img" name="tutStepImage">
                            </div>
                            <div class="col-sm-7 nopadr">
                                <textarea class="form-control" rows="8" name="tutStep"></textarea>
                            </div>
                            <a href="#" class="btn btn-danger removestep">&times;</a>
                        </div>
                    </div>
                    <a href="#" id="addStep" class="btn btn-info">Add Step</a>
                </div>
            </div>
            <!--end of instruction-->

            <div>
                <button type="submit" class="btn btn-primary btn-lg">Submit Tutorial</button>
            </div>
        </form>   
    <jsp:include page="footer.jsp"></jsp:include>
