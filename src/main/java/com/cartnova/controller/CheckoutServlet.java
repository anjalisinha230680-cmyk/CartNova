package com.cartnova.controller;

import java.io.IOException;
import java.math.BigDecimal;
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
import jakarta.servlet.http.HttpSession;

import com.cartnova.util.DBConnection;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // =========================================
    // SHOW CHECKOUT PAGE
    // =========================================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Check if user is logged in
        Integer userId =
                (Integer) session.getAttribute("userId");

        if (userId == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );

            return;
        }

        // Get cart
        List<Integer> cart =
                (List<Integer>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/cart"
            );

            return;
        }

        List<Map<String, Object>> products =
                new ArrayList<>();

        BigDecimal total =
                BigDecimal.ZERO;

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getConnection();

            if (con == null) {

                request.setAttribute(
                        "errorMessage",
                        "Database connection failed."
                );

                request.getRequestDispatcher(
                        "checkout.jsp"
                ).forward(request, response);

                return;
            }

            String sql =
                    "SELECT id, name, price "
                    + "FROM products "
                    + "WHERE id = ?";

            ps = con.prepareStatement(sql);

            for (Integer productId : cart) {

                ps.setInt(1, productId);

                rs = ps.executeQuery();

                if (rs.next()) {

                    Map<String, Object> product =
                            new HashMap<>();

                    BigDecimal price =
                            rs.getBigDecimal("price");

                    product.put(
                            "id",
                            rs.getInt("id")
                    );

                    product.put(
                            "name",
                            rs.getString("name")
                    );

                    product.put(
                            "price",
                            price
                    );

                    products.add(product);

                    total = total.add(price);
                }

                rs.close();
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to load checkout details."
            );

        } finally {

            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (ps != null) ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        request.setAttribute(
                "checkoutProducts",
                products
        );

        request.setAttribute(
                "total",
                total
        );

        request.getRequestDispatcher(
                "checkout.jsp"
        ).forward(request, response);
    }


    // =========================================
    // PLACE ORDER
    // =========================================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer userId =
                (Integer) session.getAttribute("userId");

        // User must be logged in
        if (userId == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );

            return;
        }

        // Get cart
        List<Integer> cart =
                (List<Integer>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/cart"
            );

            return;
        }

        Connection con = null;

        try {

            con = DBConnection.getConnection();

            if (con == null) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/cart"
                );

                return;
            }

            // Start transaction
            con.setAutoCommit(false);


            // =========================================
            // CALCULATE TOTAL
            // =========================================

            BigDecimal total =
                    BigDecimal.ZERO;

            Map<Integer, BigDecimal> prices =
                    new HashMap<>();

            String productSql =
                    "SELECT price FROM products "
                    + "WHERE id = ?";

            try (PreparedStatement ps =
                         con.prepareStatement(productSql)) {

                for (Integer productId : cart) {

                    ps.setInt(1, productId);

                    try (ResultSet rs =
                                 ps.executeQuery()) {

                        if (rs.next()) {

                            BigDecimal price =
                                    rs.getBigDecimal("price");

                            prices.put(
                                    productId,
                                    price
                            );

                            total =
                                    total.add(price);
                        }
                    }
                }
            }


            // =========================================
            // CREATE ORDER
            // =========================================

            int orderId;

            String orderSql =
                    "INSERT INTO orders "
                    + "(user_id, total_amount, status) "
                    + "VALUES (?, ?, ?)";

            try (PreparedStatement ps =
                         con.prepareStatement(
                                 orderSql,
                                 PreparedStatement.RETURN_GENERATED_KEYS
                         )) {

                ps.setInt(1, userId);

                ps.setBigDecimal(2, total);

                ps.setString(3, "Pending");

                ps.executeUpdate();

                try (ResultSet rs =
                             ps.getGeneratedKeys()) {

                    if (rs.next()) {

                        orderId =
                                rs.getInt(1);

                    } else {

                        throw new Exception(
                                "Order ID could not be generated."
                        );
                    }
                }
            }


            // =========================================
            // SAVE ORDER ITEMS
            // =========================================

            String itemSql =
                    "INSERT INTO order_items "
                    + "(order_id, product_id, quantity, price) "
                    + "VALUES (?, ?, ?, ?)";

            try (PreparedStatement ps =
                         con.prepareStatement(itemSql)) {

                for (Integer productId : cart) {

                    BigDecimal price =
                            prices.get(productId);

                    if (price != null) {

                        ps.setInt(1, orderId);

                        ps.setInt(2, productId);

                        ps.setInt(3, 1);

                        ps.setBigDecimal(4, price);

                        ps.addBatch();
                    }
                }

                ps.executeBatch();
            }


            // Commit transaction
            con.commit();


            // Empty cart after successful order
            session.removeAttribute("cart");


            // Send order ID to success page
            session.setAttribute(
                    "lastOrderId",
                    orderId
            );

            response.sendRedirect(
                    request.getContextPath()
                    + "/order-success.jsp"
            );

        } catch (Exception e) {

            e.printStackTrace();

            try {

                if (con != null) {
                    con.rollback();
                }

            } catch (Exception rollbackError) {

                rollbackError.printStackTrace();
            }

            response.sendRedirect(
                    request.getContextPath()
                    + "/cart"
            );

        } finally {

            try {

                if (con != null) {
                    con.close();
                }

            } catch (Exception e) {

                e.printStackTrace();
            }
        }
    }
}
