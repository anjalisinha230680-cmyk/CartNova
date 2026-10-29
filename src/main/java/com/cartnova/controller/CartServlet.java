package com.cartnova.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // =========================
    // ADD / REMOVE PRODUCT
    // =========================

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String productId = request.getParameter("productId");

        HttpSession session = request.getSession();

        // Get cart from session
        List<Integer> cart =
                (List<Integer>) session.getAttribute("cart");

        // Create new cart if it doesn't exist
        if (cart == null) {
            cart = new ArrayList<>();
        }


        // =========================
        // ADD PRODUCT
        // =========================

        if ("add".equals(action)) {

            if (productId != null && !productId.isEmpty()) {

                try {

                    int id = Integer.parseInt(productId);

                    // Add only if product is not already in cart
                    if (!cart.contains(id)) {

                        cart.add(id);

                        System.out.println(
                            "Product added to cart: " + id
                        );

                    } else {

                        System.out.println(
                            "Product already exists in cart: " + id
                        );
                    }

                } catch (NumberFormatException e) {

                    e.printStackTrace();
                }
            }
        }


        // =========================
        // REMOVE PRODUCT
        // =========================

        else if ("remove".equals(action)) {

            if (productId != null && !productId.isEmpty()) {

                try {

                    int id = Integer.parseInt(productId);

                    // Remove product
                    if (cart.remove(Integer.valueOf(id))) {

                        System.out.println(
                            "Product removed from cart: " + id
                        );

                    } else {

                        System.out.println(
                            "Product was not found in cart: " + id
                        );
                    }

                } catch (NumberFormatException e) {

                    e.printStackTrace();
                }
            }
        }


        // =========================
        // INVALID ACTION
        // =========================

        else {

            System.out.println(
                "Invalid cart action: " + action
            );
        }


        // Save updated cart
        session.setAttribute("cart", cart);


        // Go back to cart page
        response.sendRedirect(
            request.getContextPath() + "/cart"
        );
    }


    // =========================
    // DISPLAY CART
    // =========================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Get cart
        List<Integer> cart =
                (List<Integer>) session.getAttribute("cart");

        // Create empty cart if needed
        if (cart == null) {

            cart = new ArrayList<>();
        }

        // Send cart to cart.jsp
        request.setAttribute("cart", cart);

        // Open cart page
        request.getRequestDispatcher("cart.jsp")
               .forward(request, response);
    }
}