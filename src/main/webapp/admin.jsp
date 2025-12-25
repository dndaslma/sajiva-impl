<%-- 
    Document   : detailCafe
    Created on : 31 May 2025
    Author     : dinda salma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model.VerifikasiCafe"%>
<%@page import="model.Cafe"%>

<%
    List<VerifikasiCafe> verifikasiList =
        (List<VerifikasiCafe>) request.getAttribute("verifikasiList");
    if (verifikasiList == null) verifikasiList = new ArrayList<>();

    List<Cafe> cafeList =
        (List<Cafe>) request.getAttribute("cafeList");
    if (cafeList == null) cafeList = new ArrayList<>();

    int pending = 0, approved = 0, rejected = 0;
    for (VerifikasiCafe v : verifikasiList) {
        if ("pending".equalsIgnoreCase(v.getStatus())) pending++;
        else if ("approved".equalsIgnoreCase(v.getStatus())) approved++;
        else if ("rejected".equalsIgnoreCase(v.getStatus())) rejected++;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>SAJIVA ADMIN</title>

    <link href="https://fonts.googleapis.com/css2?family=Inria+Sans:wght@300;400;700;800&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: "Inria Sans", sans-serif;
            background-color: #F9F4F3;
            margin: 0;
        }

        .header {
            background: #7b1f1f;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .tabs {
            display: flex;
            gap: 30px;
            padding: 15px 30px;
            background: #fff6f5;
            border-bottom: 1px solid #ddd;
        }

        .tab {
            cursor: pointer;
            font-weight: bold;
            color: #777;
        }

        .tab.active {
            color: #7b1f1f;
            border-bottom: 3px solid #7b1f1f;
        }

        .container {
            padding: 30px;
        }
        
        .stats {
            display: flex;
            gap: 20px;
            margin-bottom: 25px;
        }

        .card {
            background: #f1e6e4;
            padding: 15px;
            width: 200px;
            border-radius: 6px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #f1e6e4;
        }

        th {
            background: #7b1f1f;
            color: white;
            padding: 10px;
            text-align: center;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            vertical-align: middle;
            text-align: center;
        }

        .badge {
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 12px;
        }

        .pending { background: #f3d87c; }
        .approved { background: #8fd19e; }
        .rejected { background: #f19999; }

        .btn {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            font-size: 12px;
        }

        .btn-approve { background: green; }
        .btn-reject { background: red; }
        .btn-detail { background: gray; }

        .logout-btn {
            background: transparent;
            border: 2px solid #fff;
            color: #fff;
            padding: 6px 14px;
            border-radius: 20px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .logout-btn:hover {
            background: #fff;
            color: #7b1f1f;
        }

        form {
            display: inline;
        }

        #cafeSection th,
        #cafeSection td {
            vertical-align: middle;
        }

        #cafeSection th:nth-child(1),
        #cafeSection td:nth-child(1) {
            width: 60px;
            text-align: center;
        }

        #cafeSection th:nth-child(2),
        #cafeSection td:nth-child(2),
        #cafeSection th:nth-child(3),
        #cafeSection td:nth-child(3) {
            width: 150px; 
            text-align: center;
        }

        #cafeSection th:nth-child(4),
        #cafeSection td:nth-child(4) {
            text-align: left;
            vertical-align: top;
            white-space: normal;
            word-wrap: break-word;
        }
    </style>
</head>

<body>

<div class="header">
    <h2>SAJIVA ADMIN</h2>

    <form action="LogoutServlet"
          method="post"
          style="margin:0;"
          onsubmit="return confirm('Yakin ingin logout?')">
        <button type="submit" class="logout-btn">
            Logout
        </button>
    </form>
</div>

<div class="tabs">
    <div class="tab active" onclick="showTab('verifikasi')">Verifikasi Pengajuan</div>
    <div class="tab" onclick="showTab('akun')">Akun Pemilik Café</div>
    <div class="tab" onclick="showTab('cafe')">Café Terdaftar</div>
</div>

<div class="container">

<div id="verifikasiSection">

    <div class="stats">
        <div class="card"><b>Total</b><p><%= verifikasiList.size() %></p></div>
        <div class="card"><b>Pending</b><p><%= pending %></p></div>
        <div class="card"><b>Approved</b><p><%= approved %></p></div>
        <div class="card"><b>Rejected</b><p><%= rejected %></p></div>
    </div>

    <h3>Menunggu Verifikasi</h3>

    <table>
        <tr>
            <th>Tanggal</th>
            <th>Nama Pemilik</th>
            <th>Nama Café</th>
            <th>Email</th>
            <th>File</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>

        <% for (VerifikasiCafe v : verifikasiList) {
            if (!"pending".equalsIgnoreCase(v.getStatus())) continue;
        %>
        <tr>
            <td><%= v.getTanggalSubmit() %></td>
            <td><%= v.getNamaPemilik() %></td>
            <td><%= v.getNamaCafe() %></td>
            <td><%= v.getEmail() %></td>
            <td>
                <a href="<%= request.getContextPath() %>/uploads/verifikasi/<%= v.getFileName() %>" target="_blank">
                    Lihat
                </a>
            </td>
            <td><span class="badge pending">Pending</span></td>
            <td>
                <form action="<%= request.getContextPath() %>/VerifikasiServlet" method="post">
                    <input type="hidden" name="id" value="<%= v.getId() %>">

                    <button type="submit" name="aksi" value="approved" class="btn btn-approve">
                        Setujui
                    </button>

                    <button type="submit" name="aksi" value="rejected" class="btn btn-reject">
                        Tolak
                    </button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</div>

<div id="akunSection" style="display:none">

    <h3>Semua Akun Pemilik Café</h3>

    <table>
        <tr>
            <th>Tanggal</th>
            <th>Nama Pemilik</th>
            <th>Nama Café</th>
            <th>Email</th>
            <th>File</th>
            <th>Status</th>
        </tr>

        <% for (VerifikasiCafe v : verifikasiList) { %>
        <tr>
            <td><%= v.getTanggalSubmit() %></td>
            <td><%= v.getNamaPemilik() %></td>
            <td><%= v.getNamaCafe() %></td>
            <td><%= v.getEmail() %></td>
            <td>
                <a href="<%= request.getContextPath() %>/uploads/verifikasi/<%= v.getFileName() %>" target="_blank">
                    Lihat
                </a>
            </td>
            <td>
                <% if ("pending".equalsIgnoreCase(v.getStatus())) { %>
                    <span class="badge pending">Pending</span>
                <% } else if ("approved".equalsIgnoreCase(v.getStatus())) { %>
                    <span class="badge approved">Approved</span>
                <% } else { %>
                    <span class="badge rejected">Rejected</span>
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>

<div id="cafeSection" style="display:none">

    <h3>Daftar Café Terdaftar</h3>

    <table>
        <tr>
            <th>No</th>
            <th>Nama Café</th>
            <th>Pemilik</th>
            <th>Alamat</th>
        </tr>

        <% int no = 1;
           for (Cafe c : cafeList) { %>
        <tr>
            <td><%= no++ %></td>
            <td><%= c.getNama() %></td>
            <td><%= c.getNamaPemilik() %></td>
            <td><%= c.getAlamat() %></td>
        </tr>
        <% } %>
    </table>
</div>

</div>

<script>
function showTab(tab) {
    document.getElementById("verifikasiSection").style.display = "none";
    document.getElementById("akunSection").style.display = "none";
    document.getElementById("cafeSection").style.display = "none";

    if (tab === "verifikasi") document.getElementById("verifikasiSection").style.display = "block";
    if (tab === "akun") document.getElementById("akunSection").style.display = "block";
    if (tab === "cafe") document.getElementById("cafeSection").style.display = "block";

    document.querySelectorAll(".tab").forEach(t => t.classList.remove("active"));

    if (tab === "verifikasi") document.querySelectorAll(".tab")[0].classList.add("active");
    if (tab === "akun") document.querySelectorAll(".tab")[1].classList.add("active");
    if (tab === "cafe") document.querySelectorAll(".tab")[2].classList.add("active");
}

showTab('verifikasi');
</script>

</body>
</html>
