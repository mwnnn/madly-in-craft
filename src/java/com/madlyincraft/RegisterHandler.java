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
import javax.servlet.http.HttpSession;

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

        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String passwordConfirm = request.getParameter("password_confirm");
            String email = request.getParameter("email");

            if (username == null || username.length() == 0
                    || password == null || password.length() == 0
                    || passwordConfirm == null || passwordConfirm.length() == 0
                    || email == null || email.length() == 0) {
                session.setAttribute("registerError", "not completed");
                response.sendRedirect("register.jsp");
                return;
            }

            if (!password.equals(passwordConfirm)) {
                session.setAttribute("registerError", "password not match");
                response.sendRedirect("register.jsp");
                return;
            }

            DatabaseInfo db = new DatabaseInfo();
            try {
                if (db.isUserExist(username)) {
                    session.setAttribute("registerError", "user exist");
                    response.sendRedirect("register.jsp");
                    return;
                }
                tryRegister(username, password, email);
                session.setAttribute("registerDone", "done");
                response.sendRedirect("index.jsp");
                return;
            } catch (Exception e) {
                response.sendRedirect("error.jsp?code=4&back=index");
                return;
            }
        }
    }

    private void tryRegister(String username, String password, String email) {
        DatabaseInfo db = new DatabaseInfo();
        String query = "INSERT INTO user VALUES ('" + username + "','" + password + "',null,'" + email + "')";
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
