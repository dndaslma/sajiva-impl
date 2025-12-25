<%-- 
    Document   : cariCafe
    Created on : 10 November 2025
    Author     : dinda salma
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Cafe, dao.CafeDAO" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Superuser - SAJIVA</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Inria+Sans:wght@300;400;700&display=swap" rel="stylesheet">
    
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    
    <style>
        body {
            font-family: "Inria Sans", sans-serif;
            background-color: #F9F4F3; 
            min-height: 100vh;
        }

        .content-area-bg {
            background-color: rgba(255, 255, 255, 0.8);
        }

        .color-main { background-color: #812A23; color: #fff; }
        .text-color-main { color: #812A23; }
        .hover-color-main:hover { background-color: #6b1f1c; color: #fff !important; }
        .btn-main { background-color: #812A23 !important; border-color: #812A23 !important; color: #fff !important; font-weight: 600; }
        .sidebar-bg { background-color: #581d1a; }
        .sidebar-header-bg { background-color: #431614; }
        .w-full:focus { border-color: #812A23 !important; box-shadow: 0 0 0 3px rgba(129, 42, 35, 0.25) !important; }
        .select2-container,
        .select2-container--default .select2-selection--multiple .select2-selection__choice {
            font-family: "Inria Sans", sans-serif !important;
        }

        .select2-container--default .select2-selection--multiple .select2-selection__placeholder {
            font-family: "Inria Sans", sans-serif !important; 
            color: #999 !important; 
            font-size: 0.9rem;
            line-height: 1.5; 
        }
        
        .select2-container--default .select2-selection--multiple .select2-search__field {
            font-family: "Inria Sans", sans-serif !important;
        }
        
        .select2-container--default .select2-selection--multiple {
            border: 1px solid #ced4da !important;
            padding: 3px; 
            min-height: 42px; 
        }
        
        .select2-container .select2-selection--multiple .select2-selection__choice {
            background-color: #e6d1c7 !important; 
            color: #581d1a !important; 
            border: 1px solid #d3b4a8 !important; 
            border-radius: 4px;
            padding: 4px 10px !important; 
            margin-top: 5px;
            margin-right: 5px;
            font-size: 0.9rem;
            
            display: inline-flex;
            align-items: center; 
            line-height: 1; 
        }
        
        .select2-container .select2-selection--multiple .select2-selection__choice__remove {
            display: none !important; 
        }
    </style>
</head>
<body>

<div class="flex h-screen">
    <div class="hidden md:flex md:flex-shrink-0">
        <div class="flex flex-col w-64 sidebar-bg">
            <div class="flex items-center justify-center h-16 sidebar-header-bg">
                <h1 class="text-white font-bold text-xl">SAJIVA SUPERUSER</h1>
            </div>
            <div class="px-4 py-4">
                <nav class="space-y-2">
                    <a href="superuser.jsp" class="flex items-center px-4 py-3 text-sm text-white color-main rounded-lg">
                        <i class="fas fa-plus mr-3"></i> Tambah Café
                    </a>
                    <a href="kelolacafe.jsp" class="flex items-center px-4 py-3 text-sm text-gray-300 hover:text-white hover-color-main rounded-lg">
                        <i class="fas fa-coffee mr-3"></i> Kelola Café
                    </a>
                    <a href="LogoutServlet" onclick="return confirm('Yakin mau logout?')" class="flex items-center px-4 py-3 text-sm text-red-400 hover:text-white hover-color-main rounded-lg">
                        <i class="fas fa-sign-out-alt mr-3"></i> Keluar
                    </a>
                </nav>
            </div>
        </div>
    </div>

    <div class="flex-1 p-8 overflow-y-auto">

        <h2 class="text-2xl font-bold text-color-main mb-4">Tambah Café Baru</h2>
        <p class="text-gray-600 mb-6">Masukkan informasi café baru ke sistem, termasuk foto galeri.</p>

        <% 
           String message = (String) request.getAttribute("message"); 
           if (message != null) { 
        %>
            <div class="alert alert-info mb-4"><%= message %></div>
        <% } %>

        <form method="post"
      action="<%= request.getContextPath() %>/TambahCafeServlet"
      enctype="multipart/form-data"
      class="bg-white p-6 rounded-lg shadow-lg max-w-2xl">

            <div class="grid grid-cols-1 gap-4">
                
                <div>
                    <label class="block text-color-main font-bold">Nama Café</label>
                    <input type="text" name="nama" class="w-full border p-2 rounded" placeholder="Cafe..." required />
                </div>
                
                <div>
                    <label class="block text-color-main font-bold">Alamat</label>
                    <input type="text" name="alamat" class="w-full border p-2 rounded" placeholder="Jl.xxxx" required />
                </div>
                
                <div>
                    <label class="block text-color-main font-bold">Latitude</label>
                    <input type="text" name="latitude" class="w-full border p-2 rounded" placeholder="-6.972006" required />
                </div>
                <div>
                    <label class="block text-color-main font-bold">Longitude</label>
                    <input type="text" name="longitude" class="w-full border p-2 rounded" placeholder="107.636273" required />
                </div>

                <div>
                    <label class="block text-color-main font-bold">Jam Operasional</label>
                    <select name="jam_operasional" class="w-full border p-2 rounded" required>
                        <option value="">Pilih Jam Operasional</option>
                        <option value="06.00 - 15.00">06.00 - 15.00</option>
                        <option value="07.00 - 16.00">07.00 - 16.00</option>
                        <option value="08.00 - 17.00">08.00 - 17.00</option>
                        <option value="09.00 - 18.00">09.00 - 18.00</option>
                        <option value="09.00 - 21.00">09.00 - 21.00</option>
                        <option value="09.00 - 22.00">09.00 - 22.00</option>
                        <option value="09.00 - 23.00">09.00 - 23.00</option>
                        <option value="09.00 - 00.00">09.00 - 00.00</option>
                        <option value="09.00 - 01.00">09.00 - 01.00</option>
                        <option value="10.00 - 22.00">10.00 - 22.00</option>
                        <option value="10.00 - 23.00">10.00 - 23.00</option>
                        <option value="10.00 - 00.00">10.00 - 00.00</option>
                        <option value="10.00 - 01.00">10.00 - 01.00</option>
                        <option value="10.00 - 02.00">10.00 - 02.00</option>
                        <option value="11.00 - 23.00">11.00 - 23.00</option>
                        <option value="16.00 - 00.00">16.00 - 00.00</option>
                        <option value="24 jam">24 Jam</option>
                    </select>

                </div>
                <div>
                    <label class="block text-color-main font-bold">Link Menu Café</label>
                    <input type="url"name="menu" class="w-full border p-2 rounded" placeholder="https://drive.google.com/menu-cafe" required />
                </div>
                <div>
                    <label class="block text-color-main font-bold">Range Harga</label>
                    <input type="text" name="harga" class="w-full border p-2 rounded" placeholder="Contoh: 20.000 - 50.000" required />
                </div>
                
                <div>
                    <label class="block text-color-main font-bold">Fasilitas</label>
                    <input type="text" name="fasilitas" class="w-full border p-2 rounded" placeholder="WiFi, Stop kontak, dll" />
                </div>
                
                <div>
                    <label class="block text-color-main font-bold">Suasana</label>
                    
                    <select id="suasana-select" name="suasana[]" multiple="multiple" class="w-full border p-2 rounded" required>
                        <option value="santai">Santai</option>
                        <option value="nyaman">Nyaman</option>
                        <option value="terang">Terang</option>
                        <option value="minimalis">Minimalis</option>
                        <option value="estetis">Estetis</option>
                        <option value="modern">Modern</option>
                        <option value="industrial">Industrial</option>
                        <option value="indoor">Indoor</option>
                        <option value="outdoor">Outdoor</option>
                        <option value="romantis">Romantis</option>
                        <option value="ramah_keluarga">Ramah Keluarga</option>
                        <option value="untuk_bekerja">Cocok untuk Bekerja</option>
                        <option value="untuk_sosial">Cocok untuk Aktivitas Sosial</option>
                        <option value="hening">Hening</option>
                        <option value="alam">Alam</option>
                        <option value="instagrammable">Instagrammable</option>
                        <option value="colorful">Colorful</option>
                    </select>
                    
                </div>

                <div>
                    <label class="block text-color-main font-bold">Upload Foto Café (bisa pilih lebih dari 1)</label>
                    <input type="file" name="foto[]" multiple accept="image/*" class="w-full border p-2 rounded bg-gray-50" required />
                </div>
                
                <div class="mt-4">
                    <button type="submit" class="w-full btn btn-main">Tambah Café</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>
$(document).ready(function() {
    $('#suasana-select').select2({
        placeholder: "Pilih suasana...", 
        allowClear: true,
        dropdownParent: $('#suasana-select').parent() 
    });
});
</script>

</body>
</html>