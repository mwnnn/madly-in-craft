<%-- 
    Document   : tutorial
    Created on : Apr 12, 2014, 7:37:45 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
    
            <div class="row">
                  <h2 class="heading">Tutorial 1</h2>
                    <div class="col-md-7">
                        <img src="http://placehold.it/650x450">
                    </div><!--foto tutorial -->

                    <div class="col-md-5">
                        <div class="description">
                            <table width="450" height="240">
                                <tr>
                                    <td class="topleft">
                                        <h3 style="margin-top: 0">Deskripsi</h3>
                                        <p>
                                            Bagian ini merupakan pendahuluan mengenai tutorial yang
                                            berisi kalimat persuasif untuk membuat tutorial, ataupun deskripsi
                                            singkat mengenai tutorial yang akan dijelaskan.
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </div><!-- Deskripsi/Intro -->
                        <div class="mbottom">
                            <img src="http://placehold.it/450x50">
                        </div><!-- Time -->
                        <div class="mbottom">
                            <img src="http://placehold.it/450x50">
                        </div><!-- Difficulty -->
                        
                        <div class="row"> 
                            <div class="col-md-4">Share</div>
                            <div class="col-md-8">Like</div>
                        </div><!-- share label -->
                        
                        <div class="row">
                                <div class="col-md-4">
                                    <img class="share" src="http://placehold.it/30x30"><!-- facebook -->
                                    <img src="http://placehold.it/30x30"><!-- twitter -->
                                </div>
                                <div class="col-md-8">
                                    <img src="http://placehold.it/30x30"><!-- like button -->
                                    <img src="http://placehold.it/130x30"><!-- number of like -->
                                </div>
                        </div>
                        
                    </div>
              </div><!-- Tutorial Intro -->
              
              <div class="row">
                  <h2 class="heading">Supplies</h2>
                  <div class="col-md-5">
                      <table width="1000">
                          <tr><td class="topleft">
                                  1. Alat 1 <br>
                                  2. Alat 2 <br>
                                  3. Alat 3 <br>
                                  4. Bahan 1 <br>
                                  5. Bahan 2 <br>
                                  6. Bahan 3
                          </td></tr>
                      </table>
                  </div><!--list od supplies -->
              </div>
              
              <div class="row">
                  <h2 class="heading">Instruction</h2>
                  <div class="col-md-7">
                      <img src="http://placehold.it/650x450">
                  </div><!--instruction -->
                  <div class="col-md-5">
                      <table width="450" height="450">
                          <tr>
                              <td class="topleft">
                                  <h3 style="margin-top: 0">Step 1</h3>
                                  <p>Berisi langkah pertama yang menjelaskan cara mengerjakan tutorial ini
                                  untuk langkah pertama pada tutorial.</p>
                              </td>
                          </tr>
                      </table>
                  </div><!--Description -->
              </div>
              <jsp:include page="comment.jsp"></jsp:include>
    
<jsp:include page="footer.jsp"></jsp:include>
