<%-- 
    Document   : halamantunggu.jsp
    Created on : 17 Nov 2025, 15.35.36
    Author     : dinda salma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Verifikasi Berhasil</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inria+Sans:wght@300;400;700&display=swap" rel="stylesheet">

    <style>
        body {
            background: url('assets/images/bg.png') no-repeat center center fixed;
            background-size: cover;
            font-family: "Inria Sans", sans-serif;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 2rem;
        }
        .success-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 3rem 2.5rem;
            border-radius: 1rem;
            box-shadow: 0 0.5rem 2rem rgba(0,0,0,0.15);
            max-width: 600px;
            text-align: center;
        }
        .checkmark-circle {
            width: 120px;
            height: 120px;
            background-color: #812A23;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
        }
        .checkmark {
            color: white;
            font-size: 4rem;
            font-weight: bold;
        }
        .success-title {
            color: #812A23;
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
        }
        .success-message {
            font-size: 1.05rem;
            line-height: 1.7;
            margin-bottom: 1.5rem;
            color: #333;
        }
        .info-box {
            background-color: rgba(129, 42, 35, 0.05);
            padding: 1.5rem;
            border-radius: 0.5rem;
            margin-bottom: 2rem;
            font-size: 0.95rem;
            line-height: 1.8;
        }
        .btn-return {
            background-color: #812A23;
            color: #fff;
            font-weight: 600;
            padding: 0.75rem 2.5rem;
            border: none;
            border-radius: 0.5rem;
            font-size: 1.05rem;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s;
        }
        .btn-return:hover {
            background-color: #6b1f1c;
            color: #fff;
        }
    </style>
</head>

<body>
    <div class="success-container">

        <div class="checkmark-circle">
            <span class="checkmark">✓</span>
        </div>

        <h1 class="success-title">Terima kasih!</h1>

        <p class="success-message">
            Pengajuan verifikasi pemilik café Anda telah berhasil dikirim. Tim kami 
            akan melakukan pengecekan terhadap data dan dokumen yang Anda unggah.
        </p>

        <div class="info-box">
            Proses verifikasi membutuhkan waktu 3–5 hari kerja.<br>
            Hasil verifikasi akan kami kirimkan melalui email yang Anda daftarkan.<br>
            Pastikan untuk memeriksa folder inbox maupun spam secara berkala.
        </div>

        <a href="login.jsp" class="btn-return">Kembali ke Halaman Login</a>
    </div>
</body>
</html>


