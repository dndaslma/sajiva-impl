/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.CafeDAO;
import dao.VerifikasiDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        VerifikasiDAO verifikasiDAO = new VerifikasiDAO();
        CafeDAO cafeDAO = new CafeDAO();

        request.setAttribute("verifikasiList", verifikasiDAO.getAllPengajuan());
        request.setAttribute("cafeList", cafeDAO.getAllCafeAdmin());

        request.getRequestDispatcher("admin.jsp")
               .forward(request, response);
    }
}




