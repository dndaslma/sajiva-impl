package servlet;

import dao.CafeDAO;
import dao.CafeGalleryDAO;
import model.Cafe;
import java.io.*;
import java.nio.file.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;


@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class TambahCafeServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads/cafe";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Integer idAkun = (Integer) session.getAttribute("idAkun");
        String role = (String) session.getAttribute("role");

        if (idAkun == null || role == null || 
            !role.equalsIgnoreCase("super_user")) {
            response.sendRedirect("login.jsp");
            return;
        }

        String nama = request.getParameter("nama");
        String alamat = request.getParameter("alamat");
        String jamOperasional = request.getParameter("jam_operasional");
        String menu = request.getParameter("menu");
        String harga = request.getParameter("harga");
        String fasilitas = request.getParameter("fasilitas");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");

        String[] suasanaArray = request.getParameterValues("suasana[]");
        if (suasanaArray == null) {
            suasanaArray = request.getParameterValues("suasana");
        }

        String suasana = (suasanaArray != null && suasanaArray.length > 0)
                ? String.join(", ", suasanaArray)
                : "-";

        Cafe cafe = new Cafe(
                nama,
                alamat,
                jamOperasional,
                menu,
                harga,
                fasilitas,
                suasana,
                latitude,
                longitude,
                idAkun        
        );

        int idCafe = CafeDAO.saveAndGetId(cafe);

        if (idCafe <= 0) {
            request.setAttribute("message", "Gagal menambahkan café.");
            request.getRequestDispatcher("superuser.jsp").forward(request, response);
            return;
        }

        String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        for (Part part : request.getParts()) {
            if (part.getContentType() != null && part.getSubmittedFileName() != null) {

                String fileName = Paths.get(part.getSubmittedFileName())
                        .getFileName().toString()
                        .replaceAll("[^a-zA-Z0-9\\.\\-_]", "_");

                if (fileName.isEmpty()) continue;

                String filePath = uploadPath + File.separator + fileName;
                part.write(filePath);

                String dbPath = UPLOAD_DIR + "/" + fileName;
                CafeGalleryDAO.savePhoto(idCafe, dbPath);
            }
        }

        request.setAttribute("message", "Café berhasil ditambahkan!");
        request.getRequestDispatcher("superuser.jsp").forward(request, response);
    }
}
