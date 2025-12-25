<%-- 
    Document   : detailCafe
    Created on : 31 May 2025
    Author     : dinda salma
--%>

<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Cafe, java.sql.*" %>

<%
    Cafe cafe = (Cafe) request.getAttribute("cafe");
    if (cafe == null) {
        out.println("<p style='color:red;'>Data café tidak tersedia.</p>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Detail Café - SAJIVA</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inria+Sans:wght@300;400;700;800&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: "Inria Sans", sans-serif;
            background-color: #F9F4F3;
            min-height: 100vh;
        }

        :root {
            --main: #812A23;
            --main-dark: #581d1a;
        }

        .cafe-title {
            font-size: 1.8rem;  
            font-weight: 700;    
            color: var(--main);
            margin-bottom: 1rem;
        }

        h3, h4 {
            font-size: 1.25rem;
            color: var(--main);
            font-weight: 700;
        }

        .detail-label {
            font-weight: 600;
            color: var(--main);
        }

        .main-box {
            background-color: #ffffff;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.08);
        }

        .btn-main {
            background-color: var(--main);
            border-color: var(--main);
            color: #fff;
            border-radius: 10px;
            font-weight: 600;
        }

        .btn-main:hover {
            background-color: var(--main-dark);
            border-color: var(--main-dark);
        }

        iframe {
            border-radius: 12px;
            border: none;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }

        .box-soft {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        }

        .gallery-img {
            border-radius: 12px;
            transition: transform 0.25s ease;
        }

        .gallery-img:hover {
            transform: scale(1.05);
        }
    </style>
</head>

<body class="p-4">

<div class="container main-box p-4 p-md-5">

    <!-- JUDUL -->
    <h1 class="cafe-title"><%= cafe.getNama() %></h1>

    <!-- DETAIL -->
    <div class="row mb-3">
        <div class="col-md-4 detail-label">Alamat:</div>
        <div class="col-md-8">
            <div class="mb-2"><%= cafe.getAlamat() %></div>
            <% if (cafe.getLatitude() != null && cafe.getLongitude() != null) { %>
                <iframe
                    width="100%"
                    height="300"
                    loading="lazy"
                    allowfullscreen
                    referrerpolicy="no-referrer-when-downgrade"
                    src="https://maps.google.com/maps?q=<%= cafe.getLatitude() %>,<%= cafe.getLongitude() %>&z=15&output=embed">
                </iframe>
            <% } else { %>
                <p class="text-danger">Koordinat tidak tersedia.</p>
            <% } %>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-md-4 detail-label">Jam Operasional:</div>
        <div class="col-md-8"><%= cafe.getJamOperasional() %></div>
    </div>

    <div class="row mb-3">
    <div class="col-md-4 detail-label">Menu:</div>
    <div class="col-md-8">
        <a href="<%= cafe.getMenu() %>"
           target="_blank"
           style="color:#000; font-weight:400; text-decoration: underline;">
            Lihat Menu Café
        </a>
    </div>
</div>


    <div class="row mb-3">
        <div class="col-md-4 detail-label">Range Harga:</div>
        <div class="col-md-8"><%= cafe.getHarga() %></div>
    </div>

    <div class="row mb-3">
        <div class="col-md-4 detail-label">Fasilitas:</div>
        <div class="col-md-8"><%= cafe.getFasilitas() %></div>
    </div>

    <div class="row mb-4">
        <div class="col-md-4 detail-label">Suasana:</div>
        <div class="col-md-8"><%= cafe.getSuasana() %></div>
    </div>

    <hr class="my-4">

    <div class="mb-5">
        <h3 class="mb-3">Galeri <%= cafe.getNama() %></h3>
        <div class="row g-3">
            <%
                List<model.GaleriCafe> galeriList =
                    dao.CafeGalleryDAO.getPhotosByCafeId(cafe.getId());
                if (galeriList.isEmpty()) {
            %>
                <p class="text-muted">Belum ada foto untuk café ini.</p>
            <%
                } else {
                    for (model.GaleriCafe g : galeriList) {
            %>
                <div class="col-6 col-md-4 col-lg-3">
                    <img src="<%= request.getContextPath() + "/" + g.getFoto() %>"
                         class="gallery-img shadow-sm"
                         style="width:100%; height:200px; object-fit:cover;">
                </div>
            <%
                    }
                }
            %>
        </div>
    </div>

    <div class="box-soft p-4 mb-5">
        <h3 class="mb-3">Kirim Ulasan</h3>
        <form method="post" action="UlasanServlet">
            <input type="hidden" name="cafe" value="<%= cafe.getNama() %>">

            <div class="mb-3">
                <label class="detail-label">Nama Anda</label>
                <input type="text" name="nama" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="detail-label">Ulasan</label>
                <textarea name="pesan" class="form-control" rows="4" required></textarea>
            </div>

            <button type="submit" class="btn btn-main">Kirim</button>
        </form>
    </div>

    <div class="mb-4">
        <h4>Ulasan Sebelumnya</h4>
        <%
            try (
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/sajivaa_impl", "root", "123");
                PreparedStatement ps =
                    conn.prepareStatement("SELECT nama, pesan FROM kritik_saran WHERE cafe = ?");
            ) {
                ps.setString(1, cafe.getNama());
                ResultSet rs = ps.executeQuery();

                boolean adaData = false;
                while (rs.next()) {
                    adaData = true;
        %>
            <div class="box-soft p-3 mb-2">
                <strong><%= rs.getString("nama") %></strong>
                <p class="mb-0"><%= rs.getString("pesan") %></p>
            </div>
        <%
                }
                if (!adaData) {
        %>
            <p class="text-muted">Belum ada ulasan untuk café ini.</p>
        <%
                }
            } catch (Exception e) {
                out.println("<p class='text-danger'>Terjadi kesalahan: " + e.getMessage() + "</p>");
            }
        %>
    </div>

    <a href="CariCafeServlet" class="btn btn-main mt-3">Kembali ke Cari Café</a>

</div>
</body>
</html>
