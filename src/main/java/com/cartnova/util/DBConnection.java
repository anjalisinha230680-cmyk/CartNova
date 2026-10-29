package com.cartnova.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3307/cartnova";

    private static final String USER = "root";

    private static final String PASSWORD =
            "Anjali2019@";

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            System.out.println("================================");
            System.out.println("DATABASE CONNECTED SUCCESSFULLY");
            System.out.println("================================");

            return con;

        } catch (ClassNotFoundException e) {

            System.out.println("MYSQL DRIVER NOT FOUND!");
            e.printStackTrace();

        } catch (SQLException e) {

            System.out.println("DATABASE CONNECTION FAILED!");
            e.printStackTrace();

        }

        return null;
    }
}