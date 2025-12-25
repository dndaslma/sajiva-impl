<%-- 
    Document   : persetujuan
    Created on : 31 Oct 2025
    Author     : dinda salma
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Persetujuan Pengguna Sajiva</title>

    <link 
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
        rel="stylesheet"
    />
    <link 
        href="https://fonts.googleapis.com/css2?family=Inria+Sans:wght@300;400;700&display=swap" 
        rel="stylesheet"
    />

    <style>
        body {
            background: url('assets/images/bg.png') no-repeat center center fixed;
            background-size: cover;
            font-family: "Inria Sans", sans-serif;
            color: #333;
            display: flex;
            justify-content: center;
            padding-top: 7%;
        }

        .container-box {
            background-color: rgba(255, 255, 255, 0.5);
            padding: 2rem 2.2rem;
            border-radius: 0.75rem;
            text-align: center;
            max-width: 620px;
            box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.15);
        }

        .title-agoka {
            font-family: "Inria Sans", sans-serif;
            color: #812A23;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1.4rem;
        }

        .info-text {
            font-size: 1.05rem;
            line-height: 1.6;
            margin-bottom: 0.9rem;
        }

        .btn-main {
            background-color: #812A23;
            color: #fff;
            border: none;
            font-weight: 600;
            width: 160px;
            padding: 0.55rem;
            margin-top: 1.2rem;
        }

        .btn-main:hover {
            background-color: #6b1f1c;
            color: #fff;
        }
    </style>
</head>

<body>
    <div class="container-box">
        <h1 class="title-agoka">Persetujuan Pengguna Sajiva</h1>

        <p class="info-text">
            Sajiva menampilkan informasi café yang disediakan langsung oleh pihak café. Akurasi dan pembaruan informasi menjadi tanggung jawab masing-masing café.
        </p>

        <p class="info-text">
            Dengan melanjutkan penggunaan Sajiva, pengguna dianggap telah membaca, memahami, dan menyetujui ketentuan ini.
        </p>

        <a href="login.jsp" class="btn btn-main">Setuju</a>
    </div>

    <script 
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
    </script>
</body>
</html>
