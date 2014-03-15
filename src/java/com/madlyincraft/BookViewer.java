/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.madlyincraft;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author putih
 */
public class BookViewer extends HttpServlet {

    // process "get" request from client
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("namamu");

        String isbn = request.getParameter("isbn");
        String title = request.getParameter("title");
        String edisi = request.getParameter("edisi");
        String publisher = request.getParameter("publisher");
        String price = request.getParameter("price");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // send XHTML document to client
        // start XHTML document
        out.println("<?xml version = \"1.0\"?>");

        out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD "
                + "XHTML 1.0 Strict//EN\" \"http://www.w3.org"
                + "/TR/xhtml1/DTD/xhtml1-strict.dtd\">");

        out.println(
                "<html xmlns = \"http://www.w3.org/1999/xhtml\">");

        // head section of document
        out.println("<head>");
        out.println(
                "<title>Pengisian Buku</title>");
        out.println("<style type=\"text/css\">\n"
                + "            body {font-family:Arial;width: 1000px;margin: 0px auto;}\n"
                + "        </style>");
        out.println("</head>");

        // body section of document
        out.println("<body>");
        out.println("<h1>Hello " + name + "!<br />");
        out.println("Pengisian buku telah diproses...</h1>");

        DatabaseInfo dbInfo = new DatabaseInfo();

        out.println(dbInfo.addBook(isbn, title, edisi, publisher, price) + "<br />");

        ArrayList<Book> books = dbInfo.getAllBook();

        // generate table
        out.println("<style type=\"text/css\">\n"
                + ".tg  {border-collapse:collapse;border-spacing:0;border-color:#bbb;}\n"
                + ".tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#bbb;color:#594F4F;background-color:#E0FFEB;}\n"
                + ".tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#bbb;color:#493F3F;background-color:#9DE0AD;}\n"
                + ".tg .tg-s6z2{text-align:center}\n"
                + "</style>\n"
                + "<table class=\"tg\">\n"
                + "  <tr>\n"
                + "    <th class=\"tg-031e\">No</th>\n"
                + "    <th class=\"tg-s6z2\">ISBN</th>\n"
                + "    <th class=\"tg-s6z2\">Judul Buku</th>\n"
                + "    <th class=\"tg-s6z2\">Edisi</th>\n"
                + "    <th class=\"tg-s6z2\">Penerbit</th>\n"
                + "    <th class=\"tg-s6z2\">Harga</th>\n"
                + "    <th class=\"tg-s6z2\">Operasi</th>\n"
                + "  </tr>\n"
                + "<form>");

        // load books from database
        for (int i = 0; i < books.size(); i++) {
            int no = i + 1;
            Book b = books.get(i);
            out.println("  <tr>\n");
            out.println("<td class=\"tg-s6z2\">" + no + "</td>\n");
            out.println("<td class=\"tg-s6z2\">" + b.getISBN() + "</td>\n");
            out.println("<td class=\"tg-s6z2\">" + b.getTitle() + "</td>\n");
            out.println("<td class=\"tg-s6z2\">" + b.getEditionNumber() + "</td>\n");
            out.println("<td class=\"tg-s6z2\">" + b.getPublisher() + "</td>\n");
            out.println("<td class=\"tg-s6z2\">" + b.getPrice() + "</td>\n");
            out.println("<td class=\"tg-s6z2\"><input type = \"submit\" value = \"Update\" /></td>\n");
            out.println("  </tr>\n");
        }
        out.println("</form>");
        out.println("</table>");
        out.println("<br /><br />");
        out.println("</body>");

        // end XHTML document
        out.println("</html>");
        out.close();  // close stream to complete the page
    }
}
