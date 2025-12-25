/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author dinda salma
 */
public class Admin extends Akun{

    public Admin(int id, String nama, String noHp, String username, String password) {
        super(id, nama, noHp, username, password, "admin");
    }
    
    @Override
    public void register() {
        try {
            Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO akun (nama, no_hp, username, password, role) VALUES (?, ?, ?, ?, ?)"
            );
            stmt.setString(1, nama);
            stmt.setString(2, noHp);
            stmt.setString(3, username);
            stmt.setString(4, password);
            stmt.setString(5, role);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Akun login(String username, String password) {
    try {
        Connection conn = DatabaseConnection.getConnection();
        PreparedStatement stmt = conn.prepareStatement(
            "SELECT * FROM akun WHERE username = ? AND password = ? AND role = 'admin'"
        );
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return new Admin(
                rs.getInt("id"),
                rs.getString("nama"),
                rs.getString("no_hp"),
                rs.getString("username"),
                rs.getString("password")
            );
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return null;
}
    
}
