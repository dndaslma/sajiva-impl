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

        String host = System.getenv("mysql.railway.internal");
        String port = System.getenv("3306");
        String database = System.getenv("railway");
        String user = System.getenv("root");
        String password = System.getenv("sCpCUcshJHBChgyXFkHZvczcafbGKFzZ");

        String jdbcURL =
            "jdbc:mysql://" + host + ":" + port + "/" + database +
            "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(jdbcURL, user, password);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found", e);
        }
    }
}


