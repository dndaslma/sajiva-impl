<%-- 
    Document   : login
    Created on : 31 Oct 2025
    Author     : dinda salma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Sajiva Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Inria+Sans:wght@300;400;700&display=swap" rel="stylesheet">

    <style>
        body {
            background: url('assets/images/bg.png') no-repeat center center fixed;
            background-size: cover;
            font-family: "Inria Sans", sans-serif;
            color: #333;
        }

        .title-agoka {
            font-family: "Inria Sans", sans-serif;
            color: #812A23;
            font-size: 2.5rem;   
            font-weight: 700;
            margin-bottom: 1.4rem;
            text-align: center;
        }

        .btn-main {
            background-color: #812A23;
            color: #fff;
            border: none;
            font-weight: 600;
        }

        .btn-main:hover {
            background-color: #6b1f1c;
            color: #fff;
        }

        a {
            color: #812A23;
            text-decoration: none;
        }

        a:hover {
            color: #6b1f1c;
            text-decoration: underline;
        }

        .input-group-text {
            background-color: #812A23;
            color: #fff;
            border: none;
        }

        .login-form {
            background-color: rgba(255, 255, 255, 0.50);
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.15);
        }

        .alert-login {
            max-width: 100%;
            margin: 0 auto 16px auto; 
            padding: 10px 14px;
            font-size: 0.9rem;
            text-align: center;
            border-radius: 10px;
        }

    </style>
</head>

<body>
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="col-md-4 login-form">

        <h3 class="title-agoka">Sajiva Login</h3>

        <%
            String notif = (String) session.getAttribute("notif");
            if (notif != null) {
        %>
            <div class="alert alert-success" role="alert"
                 style="color:#155724; background-color:#d4edda; border:1px solid #c3e6cb;">
                <%= notif %>
            </div>
        <%
                session.removeAttribute("notif");
            }
        %>
        
        <%
            String error = request.getParameter("error");

            if ("1".equals(error)) {
        %>
            <div class="alert alert-danger alert-login" role="alert">
                Username atau password salah. Silakan coba lagi.
            </div>


        <% } else if ("pending".equals(error)) { %>

            <div class="alert alert-warning alert-login" role="alert">
                Akun Anda sedang dalam proses verifikasi oleh Admin. Silahkan tunggu persetujuan.
            </div>


        <% } else if ("rejected".equals(error)) {%>
            <div class="alert alert-danger alert-login" role="alert">
                Pengajuan akun Anda ditolak. Silakan hubungi admin.
            </div>

        <% } %>

        <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                    <input type="text" id="username" name="username" class="form-control"
                           placeholder="username" required>
                </div>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Kata Sandi</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <input type="password" id="password" name="password" class="form-control"
                           placeholder="••••••••" required>
                </div>
            </div>

            <button type="submit" class="btn btn-main w-100">Masuk</button>
        </form>

        <div class="mt-3 text-center">
            Belum punya akun? <a href="register.jsp">Daftar di sini</a>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
