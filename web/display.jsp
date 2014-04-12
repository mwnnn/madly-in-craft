<%-- 
    Document   : display
    Created on : Mar 27, 2014, 1:48:14 AM
    Author     : putih
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.madlyincraft.DatabaseInfo" %>
<%@page import="com.madlyincraft.Book" %>
<%@page import="java.util.ArrayList" %>

<%
    HttpSession sess = request.getSession();
    Object usernameObj = sess.getAttribute("username");
    
    if (request.getParameter("logout") != null) {
        sess.setAttribute("username", null);}
//    } else if (usernameObj != null) {
//        response.sendRedirect("display.jsp");
//    }
    if(usernameObj == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    
%>

<jsp:include page="header.jsp"></jsp:include>
    <h1>Hello World!</h1>
    <table>
        <thead>
        <td>
            ISBN
        </td>
        <td>
            Title  
        </td>
        <td>
            Edition Number
        </td>
    </thead>
    <tbody>
    <%
        DatabaseInfo db = new DatabaseInfo();
        ArrayList<Book> bList = db.getAllBook();
        
        for (Book b: bList) {
    %>
    <tr>
        <td><%= b.getISBN() %></td>
        <td><%= b.getTitle() %></td>
        <td><%= b.getEditionNumber() %></td>
    </tr>
    <% } %>
</tbody>
</table>
</body>
</html>
