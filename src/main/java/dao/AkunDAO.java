/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Akun;
import model.DatabaseConnection;
import model.SuperUser;

/**
 *
 * @author dinda salma
 */

public class AkunDAO {
    public int saveAndReturnId(Akun akun) {
        int id = 0;
        String sql = "INSERT INTO akun (nama, no_hp, username, password, role) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, akun.getNama());
            ps.setString(2, akun.getNoHp());
            ps.setString(3, akun.getUsername());
            ps.setString(4, akun.getPassword());
            ps.setString(5, akun.getRole());
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                id = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    public void insertApproval(int idAkun) {
        String sql = "INSERT INTO admin_approval (id_akun) VALUES (?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idAkun);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ResultSet login(String username, String password) throws SQLException {
        String sql = "SELECT a.*, ap.status "
                   + "FROM akun a "
                   + "LEFT JOIN admin_approval ap ON a.id = ap.id_akun "
                   + "WHERE a.username = ? AND a.password = ?";

        Connection conn = DatabaseConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);

        return ps.executeQuery();
    }

    public List<Akun> getSuperUserPending() {
        List<Akun> list = new ArrayList<>();
        String sql = "SELECT a.id, a.nama, a.no_hp, a.username "
                   + "FROM akun a "
                   + "JOIN admin_approval ap ON a.id = ap.id_akun "
                   + "WHERE ap.status = 'pending'";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new SuperUser(
                    rs.getInt("id"),
                    rs.getString("nama"),
                    rs.getString("no_hp"),
                    rs.getString("username"),
                    ""
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateStatus(int idAkun, String status) {
        String sql = "UPDATE admin_approval "
                   + "SET status = ?, approved_at = NOW() "
                   + "WHERE id_akun = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, idAkun);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean isUsernameExist(String username) {
    String sql = "SELECT COUNT(*) FROM akun WHERE username = ?";
    try (Connection conn = DatabaseConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

    
}