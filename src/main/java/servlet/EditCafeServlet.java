/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.CafeDAO;
import dao.CafeGalleryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.Collection;
import model.Cafe;

/**
 *
 * @author dinda salma
 */
@WebServlet("/EditCafeServlet")
@MultipartConfig
public class EditCafeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        int idCafe = Integer.parseInt(request.getParameter("id"));

        String[] suasanaArr = request.getParameterValues("suasana[]");
        String suasana = (suasanaArr != null) ? String.join(", ", suasanaArr) : "";

        Cafe cafe = new Cafe(
            idCafe,
            request.getParameter("nama"),
            request.getParameter("alamat"),
            request.getParameter("jam_operasional"),
            request.getParameter("menu"),
            request.getParameter("harga"),
            request.getParameter("fasilitas"),
            suasana,
            request.getParameter("latitude"),
            request.getParameter("longitude")
        );

        new CafeDAO().updateCafe(cafe);

        String uploadPath = getServletContext().getRealPath("/uploads");
        File dir = new File(uploadPath);
        if (!dir.exists()) dir.mkdir();

        for (Part part : request.getParts()) {
            if ("foto".equals(part.getName()) && part.getSize() > 0) {

                String fileName = Paths.get(part.getSubmittedFileName())
                        .getFileName().toString();

                part.write(uploadPath + File.separator + fileName);

                CafeGalleryDAO.savePhoto(idCafe, "uploads/" + fileName);
            }
        }

        response.sendRedirect("kelolacafe.jsp");
    }
}
