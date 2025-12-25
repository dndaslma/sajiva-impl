/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.DatabaseConnection;
import model.GaleriCafe;

/**
 *
 * @author dinda salma
 */
public class CafeGalleryDAO {
    public static void savePhoto(int idCafe, String foto) {
        String sql = "INSERT INTO galeri_cafe (id_cafe, foto) VALUES (?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idCafe);
            ps.setString(2, foto);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static List<GaleriCafe> getPhotosByCafeId(int idCafe) {
        List<GaleriCafe> list = new ArrayList<>();
        String sql = "SELECT * FROM galeri_cafe WHERE id_cafe = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idCafe);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                GaleriCafe g = new GaleriCafe();
                g.setId(rs.getInt("id"));
                g.setIdCafe(rs.getInt("id_cafe"));
                g.setFoto(rs.getString("foto"));
                list.add(g);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}