package com.cartnova.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.cartnova.util.DBConnection;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check if all fields are filled
        if (name == null || email == null || password == null ||
            name.trim().isEmpty() ||
            email.trim().isEmpty() ||
            password.trim().isEmpty()) {

            request.setAttribute(
                "errorMessage",
                "Please fill in all fields."
            );

            request.getRequestDispatcher("register.jsp")
                   .forward(request, response);

            return;
        }

        String sql =
            "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";

        Connection con = null;

        try {

            // Connect to database
            con = DBConnection.getConnection();

            // Check connection
            if (con == null) {

                System.out.println(
                    "ERROR: Database connection is null."
                );

                request.setAttribute(
                    "errorMessage",
                    "Database connection failed. Check MySQL and DBConnection settings."
                );

                request.getRequestDispatcher("register.jsp")
                       .forward(request, response);

                return;
            }

            // Prepare SQL statement
            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setString(1, name.trim());
            ps.setString(2, email.trim());
            ps.setString(3, password);

            // Insert user
            ps.executeUpdate();

            ps.close();
            con.close();

            System.out.println(
                "User registered successfully!"
            );

            // Go to login page
            response.sendRedirect(
                request.getContextPath()
                + "/login.jsp?registered=true"
            );

        } catch (SQLException e) {

            e.printStackTrace();

            if (e.getErrorCode() == 1062) {

                request.setAttribute(
                    "errorMessage",
                    "An account with this email already exists."
                );

            } else {

                request.setAttribute(
                    "errorMessage",
                    "Registration failed. Please try again."
                );
            }

            request.getRequestDispatcher("register.jsp")
                   .forward(request, response);

        } finally {

            try {

                if (con != null && !con.isClosed()) {
                    con.close();
                }

            } catch (SQLException e) {

                e.printStackTrace();
            }
        }
    }
}