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
        String jdbcURL = "jdbc:mysql://localhost:3306/sajivaa_impl";
        String dbUser = "root";
        String dbPassword = "123";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            return DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver tidak ditemukan.", e);
        }
    }
}

