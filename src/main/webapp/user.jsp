<%-- 
    Document   : cariCafe
    Created on : 10 November 2025
    Author     : dinda salma
--%>

<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.Cafe" %>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Cari Café - SAJIVA</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inria+Sans:wght@300;400;700&display=swap" rel="stylesheet">

    <style>
        body {
    font-family: "Inria Sans", sans-serif;
    background: url("assets/images/bg.png") no-repeat center center fixed;
    background-size: cover;
}


        :root {
            --main: #812A23;
            --main-dark: #581d1a;
            --main-soft: #e6d1c7;
        }

        h1, h5 {
            color: var(--main);
            font-weight: 700;
        }

        .card {
            border-radius: 14px;
            border: none;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        .form-control, .form-select {
            border-radius: 10px;
        }

        .btn-main {
            background-color: var(--main);
            border-color: var(--main);
            color: #fff;
            font-weight: 600;
            border-radius: 10px;
            padding: 10px 20px;
        }

        .btn-main:hover {
            background-color: var(--main-dark);
            border-color: var(--main-dark);
        }

        .section-box {
            background-color: #ffffff;
            border-radius: 18px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.08);
        }

        a.cafe-link {
            text-decoration: none;
            color: var(--main);
        }

        a.cafe-link:hover {
            color: var(--main-dark);
        }
        .btn-logout {
    background-color: transparent;
    border: 2px solid var(--main);
    color: var(--main);
    font-weight: 600;
    border-radius: 10px;
    padding: 6px 18px;
    transition: all 0.3s ease;
}

.btn-logout:hover {
    background-color: var(--main);
    color: #fff;
}
.top-white-box {
    background-color: #ffffff;
    border-radius: 14px;
    padding: 12px 16px;
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.12);
}
.form-control,
.form-select {
    height: 44px;
}

.btn-main {
    height: 44px;
    display: flex;
    align-items: center;
    justify-content: center;
}



    </style>
</head>

<body class="p-4">
<div class="top-white-box d-flex justify-content-between align-items-center mb-4 px-3">
    <h4 style="color:#812A23; font-weight:700; margin:0;">
        SAJIVA
    </h4>

    <form action="LogoutServlet"
          method="post"
          onsubmit="return confirm('Yakin ingin logout?')">
        <button type="submit" class="btn btn-logout">
            Logout
        </button>
    </form>
</div>


<%
    String keyword = request.getParameter("keyword");
    String jam_operasional = request.getParameter("jam_operasional");
    String suasana = request.getParameter("suasana");

    boolean sudahCari =
        (keyword != null && !keyword.isEmpty()) ||
        (jam_operasional != null && !jam_operasional.isEmpty()) ||
        (suasana != null && !suasana.isEmpty());

    List<Cafe> daftarCafe = (List<Cafe>) request.getAttribute("daftarCafe");
%>

<!-- SEARCH SECTION -->
<section class="py-5 mb-5 section-box">
    <div class="container text-center">
        <h1 class="mb-3">Temukan Café Favoritmu</h1>
        <p class="text-muted mb-4">Cari berdasarkan nama, jam operasional, atau suasana</p>

        <form method="get" action="CariCafeServlet" class="row g-3 justify-content-center align-items-center">
            <div class="col-md-4">
                <input type="text" name="keyword" class="form-control"
                       placeholder="Nama café..."
                       value="<%= keyword != null ? keyword : "" %>">
            </div>

            <div class="col-md-2">
                <select name="jam_operasional" class="form-select">
                    <option value="">Jam Operasional</option>

                    <option value="06.00 - 15.00" <%= "06.00 - 15.00".equals(jam_operasional) ? "selected" : "" %>>06.00 - 15.00</option>
                    <option value="07.00 - 16.00" <%= "07.00 - 16.00".equals(jam_operasional) ? "selected" : "" %>>07.00 - 16.00</option>
                    <option value="08.00 - 17.00" <%= "08.00 - 17.00".equals(jam_operasional) ? "selected" : "" %>>08.00 - 17.00</option>
                    <option value="09.00 - 18.00" <%= "09.00 - 18.00".equals(jam_operasional) ? "selected" : "" %>>09.00 - 18.00</option>
                    <option value="09.00 - 21.00" <%= "09.00 - 21.00".equals(jam_operasional) ? "selected" : "" %>>09.00 - 21.00</option>
                    <option value="09.00 - 22.00" <%= "09.00 - 22.00".equals(jam_operasional) ? "selected" : "" %>>09.00 - 22.00</option>
                    <option value="09.00 - 23.00" <%= "09.00 - 23.00".equals(jam_operasional) ? "selected" : "" %>>09.00 - 23.00</option>
                    <option value="09.00 - 00.00" <%= "09.00 - 00.00".equals(jam_operasional) ? "selected" : "" %>>09.00 - 00.00</option>
                    <option value="09.00 - 01.00" <%= "09.00 - 01.00".equals(jam_operasional) ? "selected" : "" %>>09.00 - 01.00</option>
                    <option value="10.00 - 22.00" <%= "10.00 - 22.00".equals(jam_operasional) ? "selected" : "" %>>10.00 - 22.00</option>
                    <option value="10.00 - 23.00" <%= "10.00 - 23.00".equals(jam_operasional) ? "selected" : "" %>>10.00 - 23.00</option>
                    <option value="10.00 - 00.00" <%= "10.00 - 00.00".equals(jam_operasional) ? "selected" : "" %>>10.00 - 00.00</option>
                    <option value="10.00 - 01.00" <%= "10.00 - 01.00".equals(jam_operasional) ? "selected" : "" %>>10.00 - 01.00</option>
                    <option value="10.00 - 02.00" <%= "10.00 - 02.00".equals(jam_operasional) ? "selected" : "" %>>10.00 - 02.00</option>
                    <option value="11.00 - 23.00" <%= "11.00 - 23.00".equals(jam_operasional) ? "selected" : "" %>>11.00 - 23.00</option>
                    <option value="16.00 - 00.00" <%= "16.00 - 00.00".equals(jam_operasional) ? "selected" : "" %>>16.00 - 00.00</option>
                    <option value="24 jam" <%= "24 jam".equals(jam_operasional) ? "selected" : "" %>>24 Jam</option>
                </select>

            </div>

            <div class="col-md-2">
                <select name="suasana" class="form-select">
                    <option value="">Suasana</option>

                    <option value="santai" <%= "santai".equals(suasana) ? "selected" : "" %>>Santai</option>
                    <option value="nyaman" <%= "nyaman".equals(suasana) ? "selected" : "" %>>Nyaman</option>
                    <option value="terang" <%= "terang".equals(suasana) ? "selected" : "" %>>Terang</option>
                    <option value="minimalis" <%= "minimalis".equals(suasana) ? "selected" : "" %>>Minimalis</option>
                    <option value="estetis" <%= "estetis".equals(suasana) ? "selected" : "" %>>Estetis</option>
                    <option value="modern" <%= "modern".equals(suasana) ? "selected" : "" %>>Modern</option>
                    <option value="industrial" <%= "industrial".equals(suasana) ? "selected" : "" %>>Industrial</option>
                    <option value="indoor" <%= "indoor".equals(suasana) ? "selected" : "" %>>Indoor</option>
                    <option value="outdoor" <%= "outdoor".equals(suasana) ? "selected" : "" %>>Outdoor</option>
                    <option value="romantis" <%= "romantis".equals(suasana) ? "selected" : "" %>>Romantis</option>
                    <option value="ramah keluarga" <%= "ramah keluarga".equals(suasana) ? "selected" : "" %>>Ramah Keluarga</option>
                    <option value="cocok untuk bekerja" <%= "cocok untuk bekerja".equals(suasana) ? "selected" : "" %>>Cocok untuk Bekerja</option>
                    <option value="cocok untuk aktivitas sosial" <%= "cocok untuk aktivitas sosial".equals(suasana) ? "selected" : "" %>>Cocok untuk Aktivitas Sosial</option>
                    <option value="hening" <%= "hening".equals(suasana) ? "selected" : "" %>>Hening</option>
                    <option value="alam" <%= "alam".equals(suasana) ? "selected" : "" %>>Alam</option>
                    <option value="instagrammable" <%= "instagrammable".equals(suasana) ? "selected" : "" %>>Instagrammable</option>
                    <option value="colorful" <%= "colorful".equals(suasana) ? "selected" : "" %>>Colorful</option>
                </select>

            </div>

            <div class="col-auto">
                <button type="submit" class="btn btn-main">Cari Café</button>
            </div>
        </form>
    </div>
</section>

<!-- RESULT SECTION -->
<div class="container">
<%
    if (daftarCafe == null || daftarCafe.isEmpty()) {
%>
    <div class="text-center text-muted mt-5">
        <p>
            <%= sudahCari
                ? "🙁 Tidak ada café yang sesuai dengan pencarian."
                : "Silakan masukkan kata kunci pencarian café." %>
        </p>
    </div>
<%
    } else {
%>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <% for (Cafe cafe : daftarCafe) { %>
        <div class="col">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="mb-2">
                        <a class="cafe-link"
                           href="DetailCafeServlet?nama=<%= URLEncoder.encode(cafe.getNama(), "UTF-8") %>">
                            <%= cafe.getNama() %>
                        </a>
                    </h5>
                    <p class="text-muted small">
                        <strong>Alamat:</strong> <%= cafe.getAlamat() %><br>
                        <strong>Jam:</strong> <%= cafe.getJamOperasional() %><br>
                        <strong>Harga:</strong> <%= cafe.getHarga() %><br>
                        <strong>Suasana:</strong> <%= cafe.getSuasana() %>
                    </p>
                </div>
            </div>
        </div>
        <% } %>
    </div>
<%
    }
%>
</div>

</body>
</html>
