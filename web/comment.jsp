<%-- 
    Document   : comment
    Created on : Apr 12, 2014, 1:21:22 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
              <div class="row">                
                  <h2 class="heading">Comments</h2>
                  
                  <div class="col-md-7">
                      <table class="boxcolor">
                        <tr><td>
                            <form class="comment" role="form">
                              <div class="form-group">
                                <textarea class="form-control" rows="3" placeholder="Write your comment..."></textarea>   
                              </div>
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
                                <div class="col-md-1"><img src="http://placehold.it/50x50"></div>
                                <div class="col-md-3 commentpad commentname">Namanya Namanya</div>
                                <div class="col-md-7">
                                  <button type="submit" class="btn btn-primary floatr">Post</button>
                                </div>
                            </div>
                            </td></tr>
                    </table>
                  </div>
              </div><!-- comment other -->            
              
              <div class="row">
                  <div class="col-md-7">
                      <p class="borderline"></p>
                  </div>
              </div>
              
              <div class="row">
                  <div class="col-md-7">
                      <div class="row">
                          <div class="col-md-2">
                              <img src="http://placehold.it/80x80">
                          </div>
                          <div class="col-md-10">
                              <table frame="box" width="535" height="70" class="usrcomment">
                                <div class="row">
                                    <tr>
                                        <div class="col-md-8"><td class="commentpad2">Namanya Namanya</td></div>
                                        <div class="col-md-4"><td class="floatr commentpad3">Timestamp</td></div>
                                    </tr>
                                </div>
                                <div class="row">
                                    <tr>
                                        <div class="col-md-12"><td class="commentpad4">Komentar...</td></div>
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
