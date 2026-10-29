package com.cartnova.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.cartnova.util.DBConnection;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("====================================");
        System.out.println("PRODUCT SERVLET STARTED");
        System.out.println("====================================");

        List<Map<String, Object>> products = new ArrayList<>();

        String sql = "SELECT id, name, description, price, stock, image_url FROM products";

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            // Connect to database
            con = DBConnection.getConnection();

            if (con == null) {
                System.out.println("ERROR: DATABASE CONNECTION IS NULL!");

                request.setAttribute(
                    "errorMessage",
                    "Database connection failed. Please check MySQL and DBConnection.java."
                );

                request.setAttribute("products", products);

                request.getRequestDispatcher("products.jsp")
                       .forward(request, response);

                return;
            }

            System.out.println("DATABASE CONNECTION SUCCESSFUL");

            // Prepare SQL query
            ps = con.prepareStatement(sql);

            System.out.println("EXECUTING PRODUCT QUERY...");

            // Execute query
            rs = ps.executeQuery();

            // Read products
            while (rs.next()) {

                Map<String, Object> product = new HashMap<>();

                product.put("id", rs.getInt("id"));
                product.put("name", rs.getString("name"));
                product.put("description", rs.getString("description"));
                product.put("price", rs.getBigDecimal("price"));
                product.put("stock", rs.getInt("stock"));
                product.put("image", rs.getString("image_url"));

                products.add(product);

                System.out.println(
                    "PRODUCT FOUND: "
                    + rs.getInt("id")
                    + " - "
                    + rs.getString("name")
                );
            }

            System.out.println("------------------------------------");
            System.out.println("PRODUCT COUNT = " + products.size());
            System.out.println("------------------------------------");

        } catch (Exception e) {

            System.out.println("====================================");
            System.out.println("ERROR LOADING PRODUCTS");
            System.out.println("====================================");

            e.printStackTrace();

            request.setAttribute(
                "errorMessage",
                "Unable to load products from database."
            );

        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Send products to JSP
        request.setAttribute("products", products);

        // Open products.jsp
        request.getRequestDispatcher("products.jsp")
               .forward(request, response);
    }
}