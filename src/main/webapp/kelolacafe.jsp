<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Cafe, dao.CafeDAO" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Kelola Café - SAJIVA</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Inria+Sans:wght@300;400;700&display=swap" rel="stylesheet">

    <style>
        body {
    font-family: "Inria Sans", sans-serif;
    background-color: #F9F4F3;
    min-height: 100vh;
}

        .color-main { background-color: #812A23; color: #fff; }
        .text-color-main { color: #812A23; }
        .hover-color-main:hover { background-color: #6b1f1c; color: #fff !important; }
        .sidebar-bg { background-color: #581d1a; }
        .sidebar-header-bg { background-color: #431614; }
        .content-area-bg { background-color: rgba(255, 255, 255, 0.9); }

        table {
            width: 100%;
            table-layout: fixed; 
        }

        th, td {
            vertical-align: top;
            word-wrap: break-word;
            overflow-wrap: break-word;
        }

        th:nth-child(1), td:nth-child(1) { width: 120px; }  
        th:nth-child(2), td:nth-child(2) { width: 320px; }  
        th:nth-child(3), td:nth-child(3) { width: 120px; }  
        th:nth-child(4), td:nth-child(4) { width: 200px; }  
        th:nth-child(5), td:nth-child(5) { width: 90px; }   
        th:nth-child(6), td:nth-child(6) { width: 120px; }  
        th:nth-child(7), td:nth-child(7) { width: 120px; }  
        th:nth-child(8), td:nth-child(8) { width: 100px; }  

        .menu-link {
            display: inline-block;
            max-width: 100%;
            white-space: normal;
            word-break: break-all;
            font-size: 0.85rem;
        }
    </style>
</head>

<body>

<%
    Integer idAkun = (Integer) session.getAttribute("idAkun");
    String role = (String) session.getAttribute("role");

    if (idAkun == null || !"super_user".equalsIgnoreCase(role)) {
        response.sendRedirect("login.jsp");
        return;
    }

    CafeDAO cafeDAO = new CafeDAO();
    List<Cafe> daftarCafe = cafeDAO.getCafeByAkun(idAkun);
%>


<div class="flex h-screen">
    <div class="hidden md:flex md:flex-shrink-0">
        <div class="flex flex-col w-64 sidebar-bg">
            <div class="flex items-center justify-center h-16 sidebar-header-bg">
                <h1 class="text-white font-bold text-xl">SAJIVA SUPERUSER</h1>
            </div>
            <div class="px-4 py-4">
                <nav class="space-y-2">
                    <a href="superuser.jsp" class="flex items-center px-4 py-3 text-sm text-gray-300 hover:text-white hover-color-main rounded-lg">
                        <i class="fas fa-plus mr-3"></i> Tambah Café
                    </a>
                    <a href="kelolacafe.jsp" class="flex items-center px-4 py-3 text-sm text-white color-main rounded-lg">
                        <i class="fas fa-coffee mr-3"></i> Kelola Café
                    </a>
                    <a href="LogoutServlet" class="flex items-center px-4 py-3 text-sm text-red-400 hover:text-white hover:bg-red-600 rounded-lg">
                        <i class="fas fa-sign-out-alt mr-3"></i> Keluar
                    </a>
                </nav>
            </div>
        </div>
    </div>

    <div class="flex-1 p-8 overflow-y-auto">

        <h2 class="text-2xl font-bold text-color-main mb-4">Daftar Café</h2>
        <p class="text-gray-600 mb-4">Lihat, edit, atau hapus data café yang sudah tersedia.</p>

        <div class="bg-white p-4 rounded-lg shadow-lg">
            <table class="table table-bordered table-striped">
                <thead class="table-danger">
                    <tr>
                        <th>Nama Cafe</th>
                        <th>Alamat + Map</th>
                        <th>Jam Operasional</th>
                        <th>Menu</th>
                        <th>Harga</th>
                        <th>Fasilitas</th>
                        <th>Suasana</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (daftarCafe.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="8" class="text-center">Belum ada café yang terdaftar.</td>
                        </tr>
                    <%
                        } else {
                            for (Cafe c : daftarCafe) {
                    %>
                        <tr>
                            <td><%= c.getNama() %></td>
                            <td style="max-width: 300px;">
                                <div style="word-wrap: break-word;"><%= c.getAlamat() %></div>
                                <% if (c.getLatitude() != null && c.getLongitude() != null) { %>
                                    <iframe width="250" height="150" style="border:0;"
                                        src="https://maps.google.com/maps?q=<%= c.getLatitude() %>,<%= c.getLongitude() %>&z=15&output=embed">
                                    </iframe>
                                <% } else { %>
                                    <span class="text-danger">Koordinat tidak tersedia</span>
                                <% } %>
                            </td>
                            <td><%= c.getJamOperasional() %></td>
                            <td>
                                <a href="<%= c.getMenu() %>"
                                   target="_blank"
                                   class="menu-link text-primary">
                                    Lihat Menu
                                </a>
                            </td>
                            <td>Rp <%= c.getHarga() %></td>
                            <td><%= c.getFasilitas() %></td>
                            <td><%= c.getSuasana() %></td>
                            <td>
                                <a href="editCafe.jsp?id=<%= c.getId() %>"
                                   class="btn btn-warning btn-sm mb-1">
                                    Edit
                                </a>

                                <form action="HapusCafeServlet"
                                      method="post"
                                      style="display:inline;">
                                    <input type="hidden" name="id" value="<%= c.getId() %>">
                                    <button type="submit"
                                            onclick="return confirm('Yakin hapus café ini?')"
                                            class="btn btn-danger btn-sm mb-1">
                                        Hapus
                                    </button>
                                </form>
                            </td>
                        </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
