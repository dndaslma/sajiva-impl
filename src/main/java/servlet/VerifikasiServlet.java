/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.VerifikasiDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/VerifikasiServlet")
public class VerifikasiServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            res.sendRedirect("login.jsp");
            return;
        }

        int id = Integer.parseInt(req.getParameter("id"));
        String aksi = req.getParameter("aksi");

        System.out.println("AKSI = " + aksi);
        System.out.println("ID = " + id);

        VerifikasiDAO dao = new VerifikasiDAO();

        if ("approved".equalsIgnoreCase(aksi)) {
            dao.approve(id);
        } else if ("rejected".equalsIgnoreCase(aksi)) {
            dao.reject(id);
        }

        res.sendRedirect(req.getContextPath() + "/AdminServlet");
    }
}

