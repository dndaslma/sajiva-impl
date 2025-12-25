package model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author dinda salma
 */
public class DatabaseConnection {

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url =
                "jdbc:mysql://switchback.proxy.rlwy.net:27992/railway"
              + "?useSSL=false"
              + "&allowPublicKeyRetrieval=true"
              + "&serverTimezone=UTC";

            String user = "root";
            String password = "sCpCUcshJHBChgyXFkHZvczcafbGKFzZ";

            return DriverManager.getConnection(url, user, password);

        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver tidak ditemukan", e);
        }
    }
}



