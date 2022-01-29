<%-- 
    Document   : edit
    Created on : 21 Ara 2021, 08:32:06
    Author     : Emree
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://bootswatch.com/5/sandstone/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/514ed7772a.js" crossorigin="anonymous"></script>
        <title>Update</title>
    </head>
    <body>


    <div class="row mt-5">
        <div class="col-md-6 m-auto">
            <div class="card card-body">
                <h1 class="text-center mb-3">
                    <i class="fas fa-user-plus"></i>Kullanıcı Güncelleme</h1>
                <form action="UpdateServlet" method="POST">
                    <%
                        if (session.getAttribute("sessionAdminToken") == null) {
                            response.sendRedirect("adminLogin.jsp");
                        } else {

                        }
                        String usId = request.getParameter("u");

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yazlabproje", "root", "");
                        System.out.println("Veritabanına Bağlandı.");
                        String query4 = "SELECT * FROM users WHERE userId='" + usId + "'";
                        Statement ifade4 = conn.createStatement();
                        ResultSet rs4 = ifade4.executeQuery(query4);
                        String usName, usMail, usPass;

                        while (rs4.next()) {
                    %>
                    <input class="form-control" type="text" name="userIdAl" value="<%=rs4.getString("userId")%>"/>

                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="name" id="name" name="name" class="form-control" placeholder="Enter Name" value="<%=rs4.getString("userName")%>"/>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" class="form-control" placeholder="Enter Email" value="<%=rs4.getString("userMail")%>"/>
                    </div>
                    <div class="form-group">
                        <label for="passText">Password</label>
                        <input type="text" id="password" name="passText" class="form-control" placeholder="Create Password" value="<%=rs4.getString("userPass")%>"/>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block">
                        Güncelle
                    </button>
                </form>
            </div>
        </div>
                    <%}%>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
            integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
            integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
    crossorigin="anonymous"></script>
</body>
</html>
