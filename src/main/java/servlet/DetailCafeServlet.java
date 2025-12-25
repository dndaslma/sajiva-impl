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
import model.Cafe;

/**
 *
 * @author dinda salma
 */
@WebServlet("/DetailCafeServlet")
public class DetailCafeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nama = request.getParameter("nama");

        CafeDAO dao = new CafeDAO();
        Cafe cafe = dao.getCafeByNama(nama);

        if (cafe == null) {
            response.sendRedirect("CariCafeServlet");
            return;
        }

        request.setAttribute("cafe", cafe);
        request.getRequestDispatcher("detailCafe.jsp").forward(request, response);
    }
}
