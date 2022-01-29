<%-- 
    Document   : dashboard
    Created on : 19 Ara 2021, 19:28:21
    Author     : Emree
--%>

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
            }


        %>

        <h1 class="mt-4">Yazılım Laboratuvarı-1 3.Proje</h1>
        <p class="lead mb-3">Hoşgeldin ${sessionUserName}</p>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/">Kullanıcı Paneli</a>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="tezler.jsp">Tezler</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="upload.jsp">Dosya Yükleme</a>
                </li>
            </ul>
            <form action="LogoutServlet" method="POST">
                <button type="submit" class="btn btn-secondary">Logout</button>
            </form>
        </nav>

        <h1>Dosyanızı seçip yükle butonuna basın</h1>
        <%            if (session.getAttribute("sessionFileUpload") != null && session.getAttribute("sessionFileUpload").equals("true")) {
                out.println(" <div class=\"alert alert-success\" role=\"alert\">"
                        + "Dosya başarıyla yüklendi.</div>");
                session.setAttribute("sessionFileUpload", null);
            }
        %>
        <form action="FileUploadServlet" method="POST" enctype="multipart/form-data">
            <div class="input-group mb-3">
                <input type="file" class="form-control" name="myFile" id="myFile"/>
                <input type="submit" class="btn btn-outline-secondary" value="yükle" />
            </div>

        </form>


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
