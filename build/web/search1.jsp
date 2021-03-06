<%-- 
    Document   : search1
    Created on : 21 Ara 2021, 05:51:55
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
            if (session.getAttribute("sessionEmail") == null) {
                response.sendRedirect("login.jsp");
            } else {

            }

        %>

        <h1 class="mt-4">Dashboard</h1>
        <p class="lead mb-3">Welcome ${sessionUserName} ${sessionUserId}</p>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/">EJS Is Fun</a>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="tezler.jsp">Tezler</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="upload.jsp">Upload</a>
                </li>
            </ul>
            <form action="LogoutServlet" method="POST">
                <button type="submit" class="btn btn-secondary">Logout</button>
            </form>


        </nav>
        <form action="search1.jsp" method="get"> 
            <div class="input-group mb-3">
                <select class="form-select bg-light" name="secenek" aria-label=/>
                <option selected>Arama T??r??n?? Se??iniz</option>
                <option value="1">Yazar ????renci</option>
                <option value="2">Ders</option>
                <option value="3">Proje Ad??</option>
                <option value="4">Anahtar Kelimeler</option>
                <input type="text" class="form-control" name="q" placeholder="Search here"/>
            </div>

            </select>

        </form> 

        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>Tez T??r??</th>
                    <th>Tez Konu</th>
                    <th>Tez D??nem</th>
                    <th class="text-center">Tez ??zet</th>
                    <th>Tez Anahtar Kelimeler</th>
                    <th>Tez D??nem</th>

                </tr>
            </thead>
            <tbody>

                <%                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yazlabproje", "root", "");
                    System.out.println("Veritaban??na Ba??land??.");
                    String userId = String.valueOf(session.getAttribute("sessionUserId"));
                    String query4 = "SELECT *" + " FROM tezler WHERE tezYukleyenId='" + userId + "'";
                    String istek = request.getParameter("secenek");
                    String istekParcasi = request.getParameter("q");

                    if (istek.equals("1")) {
                        query4 = "SELECT * FROM tezler WHERE tezler.tezId IN (SELECT tezogrenci.tezOgrenc??TezId FROM tezogrenci WHERE tezogrenci.tezOgrenciAd LIKE '%" + istekParcasi + "%')";
                    } else if (istek.equals("2")) {
                        query4 = "SELECT * FROM tezler WHERE tezler.tezTur LIKE '%" + istekParcasi + "%'";
                    } else if (istek.equals("3")) {
                        query4 = "SELECT * FROM tezler WHERE tezler.tezKonu LIKE '%" + istekParcasi + "%'";

                    } else if (istek.equals("4")) {
                        query4 = "SELECT * FROM tezler WHERE tezAnahtarKelimeler LIKE '%" + istekParcasi + "%'";
                    }

                    Statement ifade4 = conn.createStatement();
                    ResultSet rs4 = ifade4.executeQuery(query4);
                    while (rs4.next()) {
                %>
                <tr>
                    <td><%=rs4.getString("tezTur")%></td>
                    <td><%=rs4.getString("tezKonu")%></td>
                    <td><%=rs4.getString("tezDonem")%></td>
                    <td><%=rs4.getString("tezOzet")%></td>
                    <td><%=rs4.getString("tezAnahtarKelimeler")%></td>
                    <td><%=rs4.getString("tezDonem")%></td>

                    <td>
                        <a href="#" class="btn btn-warning">B??R ETK??S?? YOK</a>
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