/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DatabaseConnection;

/**
 *
 * @author dinda salma
 */
@WebServlet("/SubmitVerifikasiServlet")
@MultipartConfig
public class SubmitVerifikasiServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null) {
            System.out.println("SESSION NULL");
            res.sendRedirect("login.jsp");
            return;
        }

        Integer idAkun = (Integer) session.getAttribute("idAkun");
        System.out.println("ID AKUN = " + idAkun);

        if (idAkun == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        String namaPemilik = req.getParameter("nama");
        String namaCafe = req.getParameter("nama_cafe");
        String email = req.getParameter("email");

        System.out.println(namaPemilik + " | " + namaCafe + " | " + email);

        Part filePart = req.getPart("berkas");
        if (filePart == null || filePart.getSize() == 0) {
            System.out.println("FILE KOSONG");
            res.sendRedirect("verifikasi.jsp?error=file");
            return;
        }

        String fileName = System.currentTimeMillis() + "_" +
                Paths.get(filePart.getSubmittedFileName()).getFileName();

        String uploadDir = getServletContext().getRealPath("/") + "uploads/verifikasi";
        new File(uploadDir).mkdirs();
        filePart.write(uploadDir + File.separator + fileName);

        try (Connection conn = DatabaseConnection.getConnection()) {

            String sql =
                "UPDATE verifikasi_cafe SET " +
                "nama=?, nama_cafe=?, email=?, file_path=?, " +
                "status='pending', tanggal_pengajuan=NOW() " +
                "WHERE id_akun=?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, namaPemilik);
            ps.setString(2, namaCafe);
            ps.setString(3, email);
            ps.setString(4, fileName);
            ps.setInt(5, idAkun);

            int affected = ps.executeUpdate();
            System.out.println("ROW UPDATED = " + affected);

        } catch (Exception e) {
            e.printStackTrace();
        }

        res.sendRedirect("halamantunggu.jsp");
    }
}
