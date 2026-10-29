package com.cartnova.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.cartnova.util.DBConnection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check empty fields
        if (email == null || password == null ||
            email.trim().isEmpty() ||
            password.trim().isEmpty()) {

            request.setAttribute(
                "errorMessage",
                "Please enter email and password."
            );

            request.getRequestDispatcher("login.jsp")
                   .forward(request, response);

            return;
        }

        String sql =
            "SELECT id, name, email, password FROM users WHERE email = ?";

        try (Connection con = DBConnection.getConnection()) {

            if (con == null) {

                request.setAttribute(
                    "errorMessage",
                    "Database connection failed."
                );

                request.getRequestDispatcher("login.jsp")
                       .forward(request, response);

                return;
            }

            try (PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, email.trim());

                try (ResultSet rs = ps.executeQuery()) {

                    if (rs.next()) {

                        String storedPassword =
                            rs.getString("password");

                        if (password.equals(storedPassword)) {

                            // Create login session
                            HttpSession session =
                                request.getSession();

                            session.setAttribute(
                                "userId",
                                rs.getInt("id")
                            );

                            session.setAttribute(
                                "userName",
                                rs.getString("name")
                            );

                            session.setAttribute(
                                "userEmail",
                                rs.getString("email")
                            );

                            // Login successful
                            response.sendRedirect(
                                request.getContextPath() + "/"
                            );

                        } else {

                            request.setAttribute(
                                "errorMessage",
                                "Invalid email or password."
                            );

                            request.getRequestDispatcher("login.jsp")
                                   .forward(request, response);
                        }

                    } else {

                        request.setAttribute(
                            "errorMessage",
                            "Invalid email or password."
                        );

                        request.getRequestDispatcher("login.jsp")
                               .forward(request, response);
                    }
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();

            request.setAttribute(
                "errorMessage",
                "Something went wrong. Please try again."
            );

            request.getRequestDispatcher("login.jsp")
                   .forward(request, response);
        }
    }
}