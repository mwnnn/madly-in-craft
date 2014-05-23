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
public class LoginHandler extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username == null || username.length() == 0) {
                response.sendRedirect("error.jsp?code=l&back=index");
                return;
            }

            if (password == null || password.length() == 0) {
                response.sendRedirect("error.jsp?code=2&back=index");
                return;
            }

            try {
                // tryLogin
                String tryLoginString = tryLogin(username, password);
                if (tryLoginString.equalsIgnoreCase("adm")) {
                    // logged as admin
                    HttpSession sess = request.getSession();
                    sess.setAttribute("username", username);
                    // set admin attribute, so admin can open admin page
                    sess.setAttribute("admin", "admin");

                    response.sendRedirect("index.jsp");
                    return;
                } else if (tryLoginString.equalsIgnoreCase("usr")) {
                    // logged as normal user
                    HttpSession sess = request.getSession();
                    sess.setAttribute("username", username);
                    sess.setAttribute("admin", null);

                    response.sendRedirect("index.jsp");
                    return;
                }
            } catch (Exception e) {
                response.sendRedirect("error.jsp?code=4&back=index");
                return;
            }
        }
    }

    private String tryLogin(String username, String password) {
        DatabaseInfo db = new DatabaseInfo();
        if (db.loginAdmin(username, password)) {
            return "adm";
        } else if (db.login(username, password)) {
            return "usr";
        } else {
            return "fail";
        }
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
