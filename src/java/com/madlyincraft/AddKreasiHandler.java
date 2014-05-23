/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.madlyincraft;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/AddKreasiHandler")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB 
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)      // 100 MB
/**
 *
 * @author putih
 */
public class AddKreasiHandler extends HttpServlet {

    private static final long serialVersionUID = 205242440643911308L;
    private static final String UPLOAD_DIR = "uploads";

    String id = null;
    int tutorial_id = 1;
    String date_posted;
    String imageLink;
    String title = "";
    String description = "";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //response.sendRedirect("profile.jsp");
        try (PrintWriter out = response.getWriter()) {
            // get session
            HttpSession sess = request.getSession();
            Object usernameObj = sess.getAttribute("username");
            String username = usernameObj.toString();
            // end of get session

            // upload part
            // gets absolute path of the web application
            String applicationPath = request.getSession().getServletContext().getRealPath("/");
            // constructs path of the directory to save uploaded file
            String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

            // create file save directory if it doesn't exist
            File fileSaveDir = new File(uploadFilePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }

            // null filename
            String fileName = null;
            Calendar calendar = Calendar.getInstance();
            date_posted = new java.sql.Timestamp(calendar.getTime().getTime()).toString();

            // upload counter
            int ii = 0;
            //Get all the parts from request and write it to the file on server
            for (Part part : request.getParts()) {
                if (part.getName().equalsIgnoreCase("imageLink")) {
                    // first upload is featured images
                    fileName = getFileName(part);
                    part.write(uploadFilePath + File.separator + fileName);
                    // save fileName as imageLink
                    imageLink = fileName;
                    //out.println(fileName + " File uploaded successfully!");
                }
            }
            // end of upload part
            // get POST data
            title = request.getParameter("title");
            description = request.getParameter("description");
            
            // try add tutorial
            int add = tryAddFotokreasi(id,tutorial_id,username,date_posted,imageLink,0,0,title,description);

            if (add > 0) {
            //return;
            response.sendRedirect("tutorialUser.jsp");
            } else {
                 out.println(id+","+tutorial_id+","+username+","+date_posted+","+imageLink+","+0+","+0+","+title+","+description);
                 //   out.println("description=" + description);
            }
        }

        //return;
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        //System.out.println("content-disposition header= " + contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }

    private int tryAddFotokreasi(String id, int tutorial_id, String user_id, String date_posted, String url, int total_vote_up, int total_vote_down, String title, String description) {
        DatabaseInfo db = new DatabaseInfo();
        return db.addFotokreasi(id, tutorial_id, user_id, date_posted, url, total_vote_up, total_vote_down, title, description);
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
