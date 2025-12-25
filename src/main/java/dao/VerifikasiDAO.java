/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.VerifikasiCafe;
import model.DatabaseConnection;

import java.sql.*;
import java.util.*;

public class VerifikasiDAO {
    public void createPending(int idAkun) {
        String sql = "INSERT INTO verifikasi_cafe (id_akun, status) VALUES (?, 'pending')";
        try (Connection c = DatabaseConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idAkun);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<VerifikasiCafe> getPending() {
        List<VerifikasiCafe> list = new ArrayList<>();
        String sql =
            "SELECT id, id_akun, nama_pemilik, nama_cafe, email, file_path, status, tanggal_pengajuan " +
            "FROM verifikasi_cafe WHERE status='pending' ORDER BY tanggal_pengajuan DESC";

        try (Connection c = DatabaseConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new VerifikasiCafe(
                    rs.getInt("id"),
                    rs.getInt("id_akun"),
                    rs.getString("nama"),
                    rs.getString("nama_cafe"),
                    rs.getString("email"),
                    rs.getString("file_path"),
                    rs.getString("status"),
                    rs.getTimestamp("tanggal_pengajuan")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getStatusByAkun(int idAkun) {
        String status = null;
        String sql = "SELECT status FROM verifikasi_cafe WHERE id_akun=? ORDER BY tanggal_pengajuan DESC\n" +
"        LIMIT 1";

        try (Connection c = DatabaseConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, idAkun);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) status = rs.getString("status");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public void approve(int idVerifikasi) {
        String sql1 = "UPDATE verifikasi_cafe SET status='approved' WHERE id=?";
        String sql2 =
            "UPDATE akun SET status='approved' " +
            "WHERE id = (SELECT id_akun FROM verifikasi_cafe WHERE id=?)";

        try (Connection conn = DatabaseConnection.getConnection()) {

            try (PreparedStatement ps1 = conn.prepareStatement(sql1)) {
                ps1.setInt(1, idVerifikasi);
                ps1.executeUpdate();
            }

            try (PreparedStatement ps2 = conn.prepareStatement(sql2)) {
                ps2.setInt(1, idVerifikasi);
                ps2.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void reject(int id) {
        String sql = "UPDATE verifikasi_cafe SET status='rejected' WHERE id=?";
        try (Connection c = DatabaseConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<VerifikasiCafe> getAllPengajuan() {
        List<VerifikasiCafe> list = new ArrayList<>();

        String sql =
            "SELECT id, id_akun, nama, nama_cafe, email, file_path, status, tanggal_pengajuan " +
            "FROM verifikasi_cafe ORDER BY tanggal_pengajuan DESC";

        try (Connection c = DatabaseConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new VerifikasiCafe(
                    rs.getInt("id"),
                    rs.getInt("id_akun"),
                    rs.getString("nama"),
                    rs.getString("nama_cafe"),
                    rs.getString("email"),
                    rs.getString("file_path"),
                    rs.getString("status"),
                    rs.getTimestamp("tanggal_pengajuan")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}

