package com.cartnova.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/estimator")
public class EarningsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("estimator.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        try {

            double productCost =
                    Double.parseDouble(
                            request.getParameter("productCost"));

            double sellingPrice =
                    Double.parseDouble(
                            request.getParameter("sellingPrice"));

            int quantity =
                    Integer.parseInt(
                            request.getParameter("quantity"));

            double advertisingCost =
                    Double.parseDouble(
                            request.getParameter("advertisingCost"));

            double otherExpenses =
                    Double.parseDouble(
                            request.getParameter("otherExpenses"));

            // Total revenue
            double revenue =
                    sellingPrice * quantity;

            // Total product cost
            double totalProductCost =
                    productCost * quantity;

            // Total expenses
            double totalExpenses =
                    totalProductCost
                    + advertisingCost
                    + otherExpenses;

            // Profit
            double profit =
                    revenue - totalExpenses;

            // Profit margin
            double profitMargin = 0;

            if (revenue > 0) {
                profitMargin =
                        (profit / revenue) * 100;
            }

            request.setAttribute(
                    "revenue",
                    revenue);

            request.setAttribute(
                    "totalProductCost",
                    totalProductCost);

            request.setAttribute(
                    "totalExpenses",
                    totalExpenses);

            request.setAttribute(
                    "profit",
                    profit);

            request.setAttribute(
                    "profitMargin",
                    profitMargin);

            request.setAttribute(
                    "calculated",
                    true);

        } catch (Exception e) {

            request.setAttribute(
                    "errorMessage",
                    "Please enter valid numbers in all fields.");

            e.printStackTrace();
        }

        request.getRequestDispatcher("estimator.jsp")
               .forward(request, response);
    }
}