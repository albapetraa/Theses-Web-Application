<%-- 
    Document   : adminUsers
    Created on : 21 Ara 2021, 06:53:53
    Author     : Emree
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="proje.User"%>
<%@page import="proje.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://bootswatch.com/5/sandstone/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/514ed7772a.js" crossorigin="anonymous"></script>
        <title>Dashboard</title>
    </head>

    <body>

        <%
            if (session.getAttribute("sessionAdminToken") == null) {
                response.sendRedirect("adminLogin.jsp");
            } else {

            }

        %>


        <h1 class="mt-4">Admin Paneli</h1>
        <p class="lead mb-3">Hoşgeldin ${sessionAdminToken}</p>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/">Admin Paneli</a>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="adminDashboard.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminTezler.jsp">Tezler</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminUsers.jsp">Kullanıcılar</a>
                </li>

            </ul>
            <form action="AdminLogoutServlet" method="POST">
                <button type="submit" class="btn btn-secondary">Logout</button>
            </form>

        </nav>
    <div class="row">
        <div class="col-md-6">
            <h3>Kullanıcılar</h3>

        </div>
        <div class="col-md-6">
            <a><a href="register.jsp" class="btn btn-primary">Yeni Kullanıcı Ekle</a>
        </div>
    </div>


    <table class="table table-bordered table-striped table-hover">
        <thead>
            <tr>
                <th>User Id</th>
                <th>User Name</th>
                <th>User Mail</th>
                <th>User Password</th>

            </tr>
        </thead>
        <tbody>
            <%                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yazlabproje", "root", "");
                System.out.println("Veritabanına Bağlandı.");
                String query4 = "SELECT * FROM users WHERE 1";
                Statement ifade4 = conn.createStatement();
                ResultSet rs4 = ifade4.executeQuery(query4);
                while (rs4.next()) {
            %>
            <tr>
                <td><%=rs4.getString("userId")%></td>
                <td><%=rs4.getString("userName")%></td>
                <td><%=rs4.getString("userMail")%></td>
                <td><%=rs4.getString("userPass")%></td>


                <td>
                    <a href="edit.jsp?u=<%=rs4.getString("userId")%>" class="btn btn-info">Düzenle</a>
                    <a href="delete.jsp?d=<%=rs4.getString("userId")%>" class="btn btn-danger">Sil</a>

                </td>
            </tr>
            <%
                }
            %>
        </tbody>

    </table>

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
