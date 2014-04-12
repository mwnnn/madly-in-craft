/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.madlyincraft;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author putih
 */
public class RegisterHandler extends HttpServlet {

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
            String username = request.getParameter("name");
            String password = request.getParameter("password");
            String passwordConfirm = request.getParameter("password_confirm");

            if (username == null || username.length() == 0
                    || password == null || password.length() == 0
                    || passwordConfirm == null || passwordConfirm.length() == 0) {
                response.sendRedirect("error.jsp?code=5&back=index");
                return;
            }

            if (!password.equals(passwordConfirm)) {
                response.sendRedirect("error.jsp?code=6&back=index");
                return;
            }

            DatabaseInfo db = new DatabaseInfo();
            try {
                if (db.isUserExist(username)) {
                    response.sendRedirect("error.jsp?code=7&back=index");
                }
                tryRegister(username, password);
                response.sendRedirect("info.jsp?code=1&back=index");
                return;
            } catch (Exception e) {
                response.sendRedirect("error.jsp?code=4&back=index");
                return;
            }
        }
    }

    private void tryRegister(String username, String password) {
        DatabaseInfo db = new DatabaseInfo();
        String query = "INSERT INTO user(username, password) VALUES ('" + username + "','" + password + "')";

        db.doUpdate(query);
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
