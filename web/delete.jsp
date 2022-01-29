<%-- 
    Document   : delete
    Created on : 21 Ara 2021, 08:26:57
    Author     : Emree
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yazlabproje", "root", "");
    System.out.println("Veritabanına Bağlandı.");
    String usId = request.getParameter("d");
    String query4 = "DELETE FROM users WHERE userId='"+usId+"'";
    Statement ifade4 = conn.createStatement();
    ifade4.executeUpdate(query4);
    response.sendRedirect("adminUsers.jsp");

%>