/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.AkunDAO;
import dao.VerifikasiDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            AkunDAO akunDAO = new AkunDAO();
            ResultSet rs = akunDAO.login(username, password);

            if (!rs.next()) {
                response.sendRedirect("login.jsp?error=1");
                return;
            }

            int idAkun = rs.getInt("id");
            String nama = rs.getString("nama");
            String role = rs.getString("role");

            if ("super_user".equalsIgnoreCase(role)) {
                VerifikasiDAO vDao = new VerifikasiDAO();
                String status = vDao.getStatusByAkun(idAkun);

                if (status == null || "pending".equalsIgnoreCase(status)) {
                    response.sendRedirect("login.jsp?error=pending");
                    return;
                }

                if ("rejected".equalsIgnoreCase(status)) {
                    response.sendRedirect("login.jsp?error=rejected");
                    return;
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("idAkun", idAkun);
            session.setAttribute("nama", nama);
            session.setAttribute("role", role);

            if ("admin".equalsIgnoreCase(role)) {
                response.sendRedirect("AdminServlet");
            } else if ("super_user".equalsIgnoreCase(role)) {
                response.sendRedirect("superuser.jsp");
            } else {
                response.sendRedirect("user.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
