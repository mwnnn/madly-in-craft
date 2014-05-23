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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

//@WebServlet("/EditProfileHandler")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB 
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)      // 100 MB
/**
 *
 * @author putih
 */
public class EditProfileHandler extends HttpServlet {

    private static final long serialVersionUID = 205242440643911308L;
    private static final String UPLOAD_DIR = "uploads/pp";
    String imageLink;

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
        try (PrintWriter out = response.getWriter()) {

            // get session
            HttpSession sess = request.getSession();
            String username = (String) sess.getAttribute("username");
            // end of get session

            // User and DatabaseInfo object
            DatabaseInfo db = new DatabaseInfo();
            User user = new User();

            // get user data to user object
            user = db.getMemberData(username);

            // first delete ALL the links!
            String deleteLinks = "DELETE FROM link WHERE USER_ID = '" + user.getUsername() + "'";
            db.doUpdate(deleteLinks);
            
            // first thing first, check the change of username
            String uname = request.getParameter("username");
            // check if the username is null or empty
            if (uname != null && !uname.equalsIgnoreCase("")) {
                String unameQuery;
                // update username
                // check if username already used
                if (!db.isUserExist(uname)) {
                    unameQuery = "UPDATE user SET USERNAME='" + uname + "' WHERE USERNAME='" + user.getUsername() + "';";
                    // update database
                    db.doUpdate(unameQuery);
                    // change session username
                    sess.setAttribute("username", uname);
                    // if username really changes, change the other query too, eh? vie User object
                    user.setUsername(uname);
                }
            }

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

            // upload counter
            //int ii = 0;
            // bool pp changes or not
            boolean ppChanges = false;
            //Get all the parts from request and write it to the file on server
            for (Part part : request.getParts()) {
                if (part.getName().equalsIgnoreCase("picture")) {
                    // check if user really uploads new pp
                    if (!getFileName(part).equalsIgnoreCase("")) {
                        ppChanges = true;
                        // first upload is profile picture
                        fileName = user.getUsername() + "_" + getFileName(part);
                        part.write(uploadFilePath + File.separator + fileName);
                        // save fileName as imageLink
                        imageLink = fileName;
                        //out.println(fileName + " File uploaded successfully!");
                    }
                }
            }
            // end of upload part

            // update pp
            String ppQuery;
            String pp = fileName;
            if (ppChanges) {
                ppQuery = "UPDATE user SET DISPLAY_PICTURE='" + pp + "' WHERE USERNAME='" + user.getUsername() + "';";
                db.doUpdate(ppQuery);
            }

            // er... it's useless if, btw *as long as no iseng person*
            if (request.getMethod().equals("POST")) {
                if (request.getParameter("action").equals("edit")) {
                    // get data
                    String description = request.getParameter("about");
                    String[] links = request.getParameterValues("link");

                    // update description
                    String descriptionQuery = "UPDATE user SET description='" + description + "' WHERE USERNAME='" + user.getUsername() + "';";
                    db.doUpdate(descriptionQuery);

                    // update link
                    // make query
                    String linkQuery = "INSERT INTO link VALUES ";
                    for (int i = 0; i < links.length; i++) {
                        if (i == links.length - 1) {
                            if (!links[i].equalsIgnoreCase("")) {
                                linkQuery += "(null,'" + user.getUsername() + "','" + links[i] + "')";
                            }
                        } else {
                            if (!links[i].equalsIgnoreCase("")) {
                                linkQuery += "(null,'" + user.getUsername() + "','" + links[i] + "'), ";
                            }
                        }
                    }
                    db.doUpdate(linkQuery);

                    //out.println(query);
                    response.sendRedirect("profile.jsp");
                }
            }

        }

    }

    private boolean tryUpdate(String username, String name, String dp, String email, String oldPassword, String newPassword) {
        DatabaseInfo db = new DatabaseInfo();
        return db.updateProfile(username, name, dp, email, oldPassword, newPassword);
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
}
