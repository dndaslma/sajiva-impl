/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.CafeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Cafe;

/**
 *
 * @author dinda salma
 */
@WebServlet("/CariCafeServlet")
public class CariCafeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        String jamFilter = request.getParameter("jam_operasional");
        String suasanaFilter = request.getParameter("suasana");

        try {
            CafeDAO cafeDAO = new CafeDAO();
            List<Cafe> hasilCari = cafeDAO.searchCafe(keyword, jamFilter, suasanaFilter);

            request.setAttribute("daftarCafe", hasilCari);
            request.getRequestDispatcher("user.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Terjadi kesalahan pada server.");
        }
    }

}
