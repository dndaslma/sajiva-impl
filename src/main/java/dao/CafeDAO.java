/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author dinda salma
 */

import model.Cafe;
import model.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CafeDAO {
    public static int saveAndGetId(Cafe cafe) {
        int id = -1;
        String sql = "INSERT INTO cafe (nama, alamat, jam_operasional, menu, harga, fasilitas, suasana, latitude, longitude, id_akun) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, cafe.getNama());
            ps.setString(2, cafe.getAlamat());
            ps.setString(3, cafe.getJamOperasional());
            ps.setString(4, cafe.getMenu());
            ps.setString(5, cafe.getHarga());
            ps.setString(6, cafe.getFasilitas());
            ps.setString(7, cafe.getSuasana());
            ps.setString(8, cafe.getLatitude());
            ps.setString(9, cafe.getLongitude());
            ps.setInt(10, cafe.getIdAkun());
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }
    
    public List<Cafe> getAllCafe() {
        List<Cafe> cafes = new ArrayList<>();
        try {
            Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM cafe ORDER BY nama");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Cafe cafe = new Cafe(
                    rs.getInt("id"),
                    rs.getString("nama"),
                    rs.getString("alamat"),
                    rs.getString("jam_operasional"),
                    rs.getString("menu"),
                    rs.getString("harga"),
                    rs.getString("fasilitas"),
                    rs.getString("suasana"),
                    rs.getString("latitude"),
                    rs.getString("longitude"), rs.getInt("id_akun")
                       
                );
                cafes.add(cafe);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cafes;
    }
    
    public void deleteByNama(String nama) {
        String sql = "DELETE FROM cafe WHERE nama = ?";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, nama);
            stmt.executeUpdate();
            System.out.println("Berhasil menghapus café: " + nama);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Cafe> searchCafe(String keyword, String filterJam, String filterSuasana) {
        List<Cafe> cafes = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM cafe WHERE 1=1 ");
        boolean hasKeyword = keyword != null && !keyword.trim().isEmpty();
        boolean hasJam = filterJam != null && !filterJam.trim().isEmpty();
        boolean hasSuasana = filterSuasana != null && !filterSuasana.trim().isEmpty();

        if (hasKeyword) {
            sql.append("AND (nama LIKE ? OR alamat LIKE ? OR menu LIKE ?) ");
        }
        if (hasJam) {
            sql.append("AND jam_operasional = ? ");
        }
        if (hasSuasana) {
            sql.append("AND suasana = ? ");
        }

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            int idx = 1;
            if (hasKeyword) {
                String kw = "%" + keyword.trim() + "%";
                ps.setString(idx++, kw);
                ps.setString(idx++, kw);
                ps.setString(idx++, kw);
            }
            if (hasJam) {
                ps.setString(idx++, filterJam);
            }
            if (hasSuasana) {
                ps.setString(idx++, filterSuasana);
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Cafe c = new Cafe(
                        rs.getInt("id"),
                        rs.getString("nama"),
                        rs.getString("alamat"),
                        rs.getString("jam_operasional"),
                        rs.getString("menu"),
                        rs.getString("harga"),
                        rs.getString("fasilitas"),
                        rs.getString("suasana"),
                        rs.getString("latitude"),
                        rs.getString("longitude"), rs.getInt("id_akun")
                    );
                    cafes.add(c);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return cafes;
    }
    
    public boolean updateCafe(Cafe cafe) {

    String sql =
        "UPDATE cafe SET " +
        "nama = ?, " +
        "alamat = ?, " +
        "jam_operasional = ?, " +
        "menu = ?, " +
        "harga = ?, " +
        "fasilitas = ?, " +
        "suasana = ?, " +
        "latitude = ?, " +
        "longitude = ? " +
        "WHERE id = ?";

    try (Connection conn = DatabaseConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, cafe.getNama());
        stmt.setString(2, cafe.getAlamat());
        stmt.setString(3, cafe.getJamOperasional());
        stmt.setString(4, cafe.getMenu());
        stmt.setString(5, cafe.getHarga());
        stmt.setString(6, cafe.getFasilitas());
        stmt.setString(7, cafe.getSuasana());
        stmt.setString(8, cafe.getLatitude());
        stmt.setString(9, cafe.getLongitude());
        stmt.setInt(10, cafe.getId());

        return stmt.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

    
    public Cafe getCafeByNama(String nama) {
        String sql = "SELECT * FROM cafe WHERE nama = ?";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, nama);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Cafe(
                    rs.getInt("id"),
                    rs.getString("nama"),
                    rs.getString("alamat"),
                    rs.getString("jam_operasional"),
                    rs.getString("menu"),
                    rs.getString("harga"),
                    rs.getString("fasilitas"),
                    rs.getString("suasana"),
                    rs.getString("latitude"),
                    rs.getString("longitude"), rs.getInt("id_akun")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public Cafe getCafeById(int id) {
        String sql = "SELECT * FROM cafe WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Cafe(
                    rs.getInt("id"),
                    rs.getString("nama"),
                    rs.getString("alamat"),
                    rs.getString("jam_operasional"),
                    rs.getString("menu"),
                    rs.getString("harga"),
                    rs.getString("fasilitas"),
                    rs.getString("suasana"),
                    rs.getString("latitude"),
                    rs.getString("longitude"), rs.getInt("id_akun")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean updateCafeById(int id, Cafe cafe) {
        String sql = "UPDATE cafe SET nama=?, alamat=?, jam_operasional=?, menu=?, harga=?, fasilitas=?, suasana=?, latitude=?, longitude=? WHERE id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, cafe.getNama());
            stmt.setString(2, cafe.getAlamat());
            stmt.setString(3, cafe.getJamOperasional());
            stmt.setString(4, cafe.getMenu());
            stmt.setString(5, cafe.getHarga());
            stmt.setString(6, cafe.getFasilitas());
            stmt.setString(7, cafe.getSuasana());
            stmt.setString(8, cafe.getLatitude());
            stmt.setString(9, cafe.getLongitude());
            stmt.setInt(10, id);

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<Cafe> getCafeByUserId(int idAkun) {
        List<Cafe> daftarCafe = new ArrayList<>();
        String sql = "SELECT * FROM cafe WHERE id_akun = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idAkun);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cafe c = new Cafe(
                    rs.getInt("id"),
                    rs.getString("nama"),
                    rs.getString("alamat"),
                    rs.getString("jam_operasional"),
                    rs.getString("menu"),
                    rs.getString("harga"),
                    rs.getString("fasilitas"),
                    rs.getString("suasana"),
                    rs.getString("latitude"),
                    rs.getString("longitude"), rs.getInt("id_akun")
                );
                daftarCafe.add(c);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return daftarCafe;
    }
    public List<Cafe> getCafeByAkun(int idAkun) {
        List<Cafe> list = new ArrayList<>();
        String sql = "SELECT * FROM cafe WHERE id_akun = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idAkun);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Cafe cafe = new Cafe();
                cafe.setId(rs.getInt("id"));
                cafe.setNama(rs.getString("nama"));
                cafe.setAlamat(rs.getString("alamat"));
                cafe.setJamOperasional(rs.getString("jam_operasional"));
                cafe.setMenu(rs.getString("menu"));
                cafe.setHarga(rs.getString("harga"));
                cafe.setFasilitas(rs.getString("fasilitas"));
                cafe.setSuasana(rs.getString("suasana"));
                cafe.setLatitude(rs.getString("latitude"));
                cafe.setLongitude(rs.getString("longitude"));
                cafe.setIdAkun(rs.getInt("id_akun")); // PENTING
                list.add(cafe);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Cafe> getAllCafeAdmin() {
        List<Cafe> cafes = new ArrayList<>();

        String sql =
            "SELECT c.*, a.nama AS nama_pemilik " +
            "FROM cafe c " +
            "JOIN akun a ON c.id_akun = a.id " +
            "ORDER BY c.nama";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Cafe cafe = new Cafe(
                    rs.getInt("id"),
                    rs.getString("nama"),
                    rs.getString("alamat"),
                    rs.getString("jam_operasional"),
                    rs.getString("menu"),
                    rs.getString("harga"),
                    rs.getString("fasilitas"),
                    rs.getString("suasana"),
                    rs.getString("latitude"),
                    rs.getString("longitude"),
                    rs.getInt("id_akun"),
                    rs.getString("nama_pemilik") // ⬅️ BARU
                );
                cafes.add(cafe);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cafes;
    }
    public boolean deleteById(int id) {
        String sql = "DELETE FROM cafe WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}