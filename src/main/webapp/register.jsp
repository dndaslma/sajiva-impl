<%-- 
    Document   : register
    Created on : 30 Oct 2025
    Author     : dinda salma
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Registrasi SAJIVA</title>

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

        .register-form {
            background-color: rgba(255, 255, 255, 0.5);
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.15);
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
    </style>
</head>

<body>
<div class="container d-flex justify-content-center align-items-center vh-100">

    <div class="col-md-6 register-form">

        <h3 class="title-agoka">Registrasi Sajiva</h3>

        <%
            String error = (String) session.getAttribute("error");
            if (error != null) {
        %>
            <div class="alert alert-danger text-center">
                <%= error %>
            </div>
        <%
                session.removeAttribute("error");
            }
        %>

        <form action="RegisterServlet" method="post">

            <div class="mb-3">
                <label for="nama" class="form-label">Nama</label>
                <input type="text" id="nama" name="nama" class="form-control" required placeholder="Nama lengkap">
            </div>

            <div class="mb-3">
                <label for="no_hp" class="form-label">Nomor HP</label>
                <input type="tel" id="no_hp" name="no_hp" class="form-control"
                       pattern="[0-9]+" required placeholder="08xxxxxxxxxx">
            </div>

            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" id="username" name="username" class="form-control"
                       required placeholder="username123">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Kata Sandi</label>
                <input type="password" id="password" name="password" class="form-control"
                       required placeholder="••••••••">
            </div>

            <div class="mb-4">
                <label for="role" class="form-label">Pilih Role</label>
                <select id="role" name="role" class="form-select" required>
                    <option value="user" selected>User</option>
                    <option value="super_user">Pemilik Cafe</option>
                </select>
            </div>

            <button type="submit" class="btn btn-main w-100">Daftar</button>

            <div class="mt-3 text-center">
                <span>Sudah punya akun? </span>
                <a href="login.jsp">Masuk di sini</a>
            </div>

        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
