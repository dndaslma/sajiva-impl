package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import model.DatabaseConnection;

@WebServlet("/UlasanServlet")
public class UlasanServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nama = request.getParameter("nama");
        String pesan = request.getParameter("pesan");
        String cafe = request.getParameter("cafe");

        try (Connection conn = DatabaseConnection.getConnection()) {

            System.out.println("DB Connected: " + conn.getCatalog());

            String sql = "INSERT INTO kritik_saran (cafe, nama, pesan) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cafe);
            ps.setString(2, nama);
            ps.setString(3, pesan);

            ps.executeUpdate();

            response.sendRedirect(
                "DetailCafeServlet?nama=" + java.net.URLEncoder.encode(cafe, "UTF-8")
            );

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Gagal menyimpan ulasan: " + e.getMessage());
        }
    }
}
