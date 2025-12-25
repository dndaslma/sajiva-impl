<%-- 
    Document   : editCafe
    Created on : 25 Dec 2025, 02.02.38
    Author     : dinda salma
--%>

<%@ page import="java.sql.*, model.Cafe, dao.CafeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String idStr = request.getParameter("id");
    if (idStr == null || idStr.isEmpty()) {
        response.sendRedirect("kelolacafe.jsp");
        return;
    }
    int id = Integer.parseInt(idStr);
    CafeDAO cafeDAO = new CafeDAO();
    model.Cafe c = cafeDAO.getCafeById(id);
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Edit Café - SAJIVA</title>
    <link href="https://fonts.googleapis.com/css2?family=Inria+Sans:wght@300;400;700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    
    <style>
        * { font-family: "Inria Sans", sans-serif !important; }
        
        body {
            font-family: "Inria Sans", sans-serif;
            background-color: #F9F4F3;
            min-height: 100vh;
        }

        .card-container {
            max-width: 600px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.05);
        }

        .label-custom {
            display: block;
            font-weight: 700;
            color: #812A23;
            margin-bottom: 4px;
            font-size: 0.95rem;
        }

        .input-custom {
            width: 100%;
            border: 1.5px solid #cbd5e1;
            padding: 8px 12px;
            border-radius: 8px;
            transition: all 0.2s;
            outline: none;
            font-size: 0.9rem;
        }

        .input-custom:focus {
            border-color: #812A23;
            box-shadow: 0 0 0 3px rgba(129, 42, 35, 0.1);
        }

        .btn-save {
            background-color: #812A23;
            color: white;
            padding: 10px;
            border-radius: 8px;
            font-weight: 700;
            transition: opacity 0.2s;
            width: 100%;
        }

        .btn-save:hover { opacity: 0.9; }

        .btn-cancel {
            background-color: #f1f5f9;
            color: #64748b;
            padding: 10px;
            border-radius: 8px;
            font-weight: 700;
            text-align: center;
            width: 100%;
            display: block;
            text-decoration: none;
        }

        .select2-container--default .select2-selection--multiple {
            border: 1.5px solid #cbd5e1 !important;
            border-radius: 8px !important;
            padding: 2px !important;
        }
        .select2-container--default .select2-selection--multiple .select2-selection__choice {
            background-color: #fceceb !important;
            border: 1px solid #f8d7d5 !important;
            color: #812A23 !important;
            font-weight: 600;
            border-radius: 6px;
        }
    </style>
</head>
<body>

<div class="card-container">
    <div class="mb-6">
        <h2 class="text-2xl font-bold text-[#812A23]">Edit Informasi Café</h2>
        <div class="h-1 w-12 bg-[#812A23] mt-1"></div>
    </div>

    <form method="post"
      action="EditCafeServlet"
      enctype="multipart/form-data"
      class="space-y-4">

        <input type="hidden" name="id" value="<%= id %>" />

        <div>
            <label class="label-custom">Nama Café</label>
            <input type="text" name="nama" value="<%= c.getNama() %>" class="input-custom" required />
        </div>
        
        <div>
            <label class="label-custom">Alamat</label>
            <input type="text" name="alamat" value="<%= c.getAlamat() %>" class="input-custom" required />
        </div>
        
        <div class="grid grid-cols-2 gap-4">
            <div>
                <label class="label-custom">Latitude</label>
                <input type="text" name="latitude" value="<%= c.getLatitude() %>" class="input-custom" required />
            </div>
            <div>
                <label class="label-custom">Longitude</label>
                <input type="text" name="longitude" value="<%= c.getLongitude() %>" class="input-custom" required />
            </div>
        </div>

        <div>
            <label class="label-custom">Jam Operasional</label>
            <select name="jam_operasional" class="input-custom" required>
                <option value="06.00 - 15.00" <%="06.00 - 15.00".equals(c.getJamOperasional()) ? "selected" : ""%>>06.00 - 15.00</option>
                <option value="07.00 - 16.00" <%="07.00 - 16.00".equals(c.getJamOperasional()) ? "selected" : ""%>>07.00 - 16.00</option>
                <option value="08.00 - 17.00" <%="08.00 - 17.00".equals(c.getJamOperasional()) ? "selected" : ""%>>08.00 - 17.00</option>
                <option value="09.00 - 18.00" <%="09.00 - 18.00".equals(c.getJamOperasional()) ? "selected" : ""%>>09.00 - 18.00</option>
                <option value="09.00 - 21.00" <%="09.00 - 21.00".equals(c.getJamOperasional()) ? "selected" : ""%>>09.00 - 21.00</option>
                <option value="09.00 - 22.00" <%="09.00 - 22.00".equals(c.getJamOperasional()) ? "selected" : ""%>>09.00 - 22.00</option>
                <option value="09.00 - 23.00" <%="09.00 - 23.00".equals(c.getJamOperasional()) ? "selected" : ""%>>09.00 - 23.00</option>
                <option value="09.00 - 00.00" <%="09.00 - 00.00".equals(c.getJamOperasional()) ? "selected" : ""%>>09.00 - 00.00</option>
                <option value="09.00 - 01.00" <%="09.00 - 01.00".equals(c.getJamOperasional()) ? "selected" : ""%>>09.00 - 01.00</option>
                <option value="10.00 - 22.00" <%="10.00 - 22.00".equals(c.getJamOperasional()) ? "selected" : ""%>>10.00 - 22.00</option>
                <option value="10.00 - 23.00" <%="10.00 - 23.00".equals(c.getJamOperasional()) ? "selected" : ""%>>10.00 - 23.00</option>
                <option value="10.00 - 00.00" <%="10.00 - 00.00".equals(c.getJamOperasional()) ? "selected" : ""%>>10.00 - 00.00</option>
                <option value="10.00 - 01.00" <%="10.00 - 01.00".equals(c.getJamOperasional()) ? "selected" : ""%>>10.00 - 01.00</option>
                <option value="10.00 - 02.00" <%="10.00 - 02.00".equals(c.getJamOperasional()) ? "selected" : ""%>>10.00 - 02.00</option>
                <option value="11.00 - 23.00" <%="11.00 - 23.00".equals(c.getJamOperasional()) ? "selected" : ""%>>11.00 - 23.00</option>
                <option value="16.00 - 00.00" <%="16.00 - 00.00".equals(c.getJamOperasional()) ? "selected" : ""%>>16.00 - 00.00</option>
                <option value="24 jam" <%="24 jam".equals(c.getJamOperasional()) ? "selected" : ""%>>24 Jam</option>
            </select>
        </div>

        <div>
            <label class="label-custom">Menu Utama</label>
            <input type="text" name="menu" value="<%= c.getMenu() %>" class="input-custom" required />
        </div>

        <div>
            <label class="label-custom">Range Harga</label>
            <input type="text" name="harga" value="<%= c.getHarga() %>" class="input-custom" required />
        </div>
        
        <div>
            <label class="label-custom">Fasilitas</label>
            <input type="text" name="fasilitas" value="<%= c.getFasilitas() %>" class="input-custom" placeholder="WiFi, Parkir, Stopkontak..." />
        </div>
        
        <div>
            <label class="label-custom">Suasana</label>
            <select id="suasana-select" name="suasana[]" multiple="multiple" class="w-full" required>
                <% 
                    String curS = (c.getSuasana() != null) ? c.getSuasana().toLowerCase() : "";
                    String[] opsi = {
                        "santai",
                        "nyaman",
                        "terang",
                        "minimalis",
                        "estetis",
                        "modern",
                        "industrial",
                        "indoor",
                        "outdoor",
                        "romantis",
                        "ramah keluarga",
                        "cocok untuk bekerja",
                        "cocok untuk aktivitas sosial",
                        "hening",
                        "alam",
                        "instagrammable",
                        "colorful"
                    };
                    for(String o : opsi) {
                %>
                    <option value="<%= o %>" <%= curS.contains(o) ? "selected" : "" %>><%= o %></option>
                <% } %>
            </select>
        </div>
            <div>
    <label class="label-custom">
        Tambah Foto Café (opsional)
        <span style="font-weight:400; font-size:0.85rem; color:#64748b;">
            (boleh dikosongkan)
        </span>
    </label>

    <input
        type="file"
        name="foto"
        multiple
        accept="image/*"
        class="input-custom"
    >
</div>


        <div class="flex gap-3 pt-4">
            <button type="submit" name="submit" class="btn-save">Simpan Perubahan</button>
            <a href="kelolacafe.jsp" class="btn-cancel">Batal</a>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    $(document).ready(function() {
        $('#suasana-select').select2({
            placeholder: " Pilih suasana...",
            width: '100%'
        });
    });
</script>

</body>
</html>