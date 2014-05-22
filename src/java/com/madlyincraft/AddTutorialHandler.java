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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/AddTutorialHandler")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB 
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)      // 100 MB
/**
 *
 * @author putih
 */
public class AddTutorialHandler extends HttpServlet {

    private static final long serialVersionUID = 205242440643911308L;
    private static final String UPLOAD_DIR = "uploads";

    String title;
    String category;
    String imageLink;
    String description;
    String difficulty;
    ArrayList<String> supplies = new ArrayList<String>();
    ArrayList<String> tutStepImages = new ArrayList<String>();
    ArrayList<String> tutSteps = new ArrayList<String>();

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

            // upload counter
            int ii = 0;
            //Get all the parts from request and write it to the file on server
            for (Part part : request.getParts()) {
                // check if user really uploads new pp
                if (!getFileName(part).equalsIgnoreCase("")) {
                    if (part.getName().equalsIgnoreCase("imageLink")) {
                        // first upload is featured images
                        fileName = getFileName(part);
                        part.write(uploadFilePath + File.separator + fileName);
                        // save fileName as imageLink
                        imageLink = fileName;
                        //out.println(fileName + " File uploaded successfully!");
                    } else if (part.getName().equalsIgnoreCase("tutStepImage")) {
                        // next upload is instruction image
                        fileName = getFileName(part);
                        part.write(uploadFilePath + File.separator + fileName);
                        // add instruction image file name to tutStepImages
                        tutStepImages.add(fileName);
                        //out.println(fileName + " File uploaded successfully!");
                    }
                }
            }
            // end of upload part
            // get POST data
            title = request.getParameter("title");
            category = request.getParameter("category");
            description = request.getParameter("description");
            difficulty = request.getParameter("difficulty");

            // add "supply" to supplies
            supplies.addAll(Arrays.asList(request.getParameterValues("supply")));
            // add "tutStep" to tutSteps
            tutSteps.addAll(Arrays.asList(request.getParameterValues("tutStep")));

            // create ArrayList<Material> object and add supplies into it
            ArrayList<Material> materialList = new ArrayList<Material>();
            for (int i = 0; i < supplies.size(); i++) {
                int num = i + 1;
                Material m = new Material(num, supplies.get(i));
                materialList.add(m);
            }
            // done making materialList

            // create ArrayList<TutorialStep> object and add tutSteps into it
            ArrayList<TutorialStep> tutStepList = new ArrayList<TutorialStep>();
            if (tutSteps.size() > 0 && tutStepImages.size() > 0) {
                for (int i = 0; i < tutSteps.size(); i++) {
                    int num = i + 1;
                    TutorialStep t = new TutorialStep(num, tutSteps.get(i), tutStepImages.get(i));
                    tutStepList.add(t);
                }
            }
            // done making tutStepList

            // try add tutorial
            int add = tryAddTutorial(username, title, category, imageLink, description, difficulty, materialList, tutStepList);

            if (add > 0) {
                //return;
                response.sendRedirect("tutorialUser.jsp");
            } else {
                out.println("gagal bikin tutorial");
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

    private int tryAddTutorial(String userId, String title, String category, String imageLink, String description, String difficulty, ArrayList<Material> material, ArrayList<TutorialStep> tutStep) {
        DatabaseInfo db = new DatabaseInfo();
        return db.addTutorial(userId, title, category, imageLink, description, difficulty, material, tutStep);
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
