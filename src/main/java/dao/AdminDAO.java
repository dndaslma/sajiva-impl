/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.*;
import java.sql.*;
import java.util.*;

public class AdminDAO {
    public List<VerifikasiCafe> getPendingVerifikasi() {
    List<VerifikasiCafe> list = new ArrayList<>();

    String sql =
        "SELECT id, nama, nama_cafe, email, file_name, tanggal_submit " +
        "FROM verifikasi_cafe " +
        "ORDER BY tanggal_submit DESC";

    try (Connection c = DatabaseConnection.getConnection();
         PreparedStatement ps = c.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            list.add(new VerifikasiCafe(
                rs.getInt("id"), rs.getInt("id_akun"),
                rs.getString("nama"),
                rs.getString("nama_cafe"),
                rs.getString("email"),
                rs.getString("file_name"),
                rs.getString("status"),
                rs.getTimestamp("tanggal_submit")));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}

public List<CafeAdmin> getCafeTerdaftar() {
    List<CafeAdmin> list = new ArrayList<>();

    String sql =
        "SELECT c.id, c.nama AS nama_cafe, a.nama AS pemilik, " +
        "a.username AS email, c.alamat " +
        "FROM cafe c " +
        "JOIN akun a ON c.id_akun = a.id";

    try (Connection c = DatabaseConnection.getConnection();
         PreparedStatement ps = c.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            list.add(new CafeAdmin(
                rs.getInt("id"),
                rs.getString("nama_cafe"),
                rs.getString("pemilik"),
                rs.getString("email"),
                rs.getString("alamat")
            ));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}

    public List<VerifikasiCafe> getAllVerifikasi() {
    List<VerifikasiCafe> list = new ArrayList<>();

    String sql =
        "SELECT id, nama, nama_cafe, email, file_name, tanggal_submit " +
        "FROM verifikasi_cafe ORDER BY tanggal_submit DESC";

    try (Connection c = DatabaseConnection.getConnection();
         PreparedStatement ps = c.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            list.add(new VerifikasiCafe(
                rs.getInt("id"), rs.getInt("id_akun"),
                rs.getString("nama"),
                rs.getString("nama_cafe"),
                rs.getString("email"),
                rs.getString("file_name"),
                rs.getString("status"),
                rs.getTimestamp("tanggal_submit")));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}


}
