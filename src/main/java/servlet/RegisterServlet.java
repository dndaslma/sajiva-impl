/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.AkunDAO;
import dao.VerifikasiDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Akun;
import model.SuperUser;
import model.User;

/**
 *
 * @author dinda salma
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String nama = req.getParameter("nama");
        String noHp = req.getParameter("no_hp");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        AkunDAO akunDAO = new AkunDAO();

        if (akunDAO.isUsernameExist(username)) {
            HttpSession session = req.getSession();
            session.setAttribute("error", "Username sudah digunakan, silakan pilih yang lain.");
            res.sendRedirect("register.jsp");
            return;
        }

        Akun akun = role.equals("super_user")
                ? new SuperUser(nama, noHp, username, password)
                : new User(nama, noHp, username, password);

        int idAkun = akunDAO.saveAndReturnId(akun);

        if ("super_user".equals(role)) {
            HttpSession session = req.getSession();
            session.setAttribute("idAkun", idAkun);

            VerifikasiDAO vDao = new VerifikasiDAO();
            vDao.createPending(idAkun);

            res.sendRedirect("verifikasi.jsp");
            return;
        }

        HttpSession session = req.getSession();
        session.setAttribute("notif", "Akun berhasil didaftarkan. Silakan login.");
        res.sendRedirect("persetujuan.jsp");
    }
}
