<%-- 
    Document   : verifikasi
    Created on : 31 Oct 2025, 11.17.49
    Author     : dinda salma
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Verifikasi Akun</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inria+Sans:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        body {
            background: url('assets/images/bg.png') no-repeat center center fixed;
            background-size: cover;
            font-family: "Inria Sans", sans-serif;
            display: flex;
            justify-content: center;
            padding-top: 4%;
        }
        .container-box {
            background-color: rgba(255, 255, 255, 0.5);
            padding: 2rem 2.2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.15);
            width: 750px;
        }
        .title-agoka { color:#812A23; font-size:2.4rem; text-align:center; margin-bottom:1.8rem; font-weight:700; }
        label { font-weight:700; margin-top:0.7rem; }
        .section-title { font-weight:700; font-size:1.2rem; color:#812A23; margin-top:1.5rem; }
        .btn-main { background-color:#812A23; color:#fff; font-weight:600; margin-top:1.5rem; width:200px; border:none; }
        .btn-main:hover { background-color:#6b1f1c; }
        a { color:#812A23; }
    </style>
</head>
<body>
<div class="container-box">
    <h3 class="title-agoka">VERIFIKASI DATA PEMILIK CAFE</h3>

    <form action="<%= request.getContextPath() %>/SubmitVerifikasiServlet"
      method="post" enctype="multipart/form-data">

        <label>Nama:</label>
        <input type="text" name="nama" class="form-control" placeholder="Nama" required>

        <label>Nama Café:</label>
        <input type="text" name="nama_cafe" class="form-control" placeholder="Nama Cafe" required>

        <label>Email:</label>
        <input type="email" name="email" class="form-control" placeholder="contoh@gmail.com" required>

        <p class="section-title">UNGGAH DOKUMEN PERSYARATAN</p>
        <p style="font-size:0.95rem;">
            Mohon unggah dokumen pernyataan kepemilikan café.
        </p>
        <p><strong>Template Dokumen:</strong><br>
            <a href="assets/template/surat_template.pdf" target="_blank">
                Surat Pernyataan Kepemilikan Cafe dan Tanggung Jawab Informasi
            </a>
        </p>

        <label>Unggah Surat Pernyataan:</label>
        <input type="file" name="berkas" class="form-control" accept=".pdf" required>

        <div class="text-center">
            <button type="submit" class="btn btn-main">Verifikasi</button>
        </div>
    </form>
</div>
</body>
</html>


