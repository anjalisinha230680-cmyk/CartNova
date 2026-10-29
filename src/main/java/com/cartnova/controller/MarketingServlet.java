package com.cartnova.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/marketing")
public class MarketingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("marketing.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String productName =
                request.getParameter("productName");

        String productDetails =
                request.getParameter("productDetails");

        if (productName == null ||
            productName.trim().isEmpty()) {

            request.setAttribute(
                    "errorMessage",
                    "Please enter a product name.");

            request.getRequestDispatcher("marketing.jsp")
                   .forward(request, response);

            return;
        }

        if (productDetails == null ||
            productDetails.trim().isEmpty()) {

            request.setAttribute(
                    "errorMessage",
                    "Please enter product details.");

            request.getRequestDispatcher("marketing.jsp")
                   .forward(request, response);

            return;
        }

        /*
         * Temporary AI-style marketing generator.
         * We will connect a real AI API later.
         */

        String description =
                productName
                + " is designed to make your everyday life "
                + "easier, smarter and more convenient. "
                + productDetails
                + " Perfect for customers looking for "
                + "quality and value.";

        String caption =
                "Discover "
                + productName
                + " - smart, useful and made for you! "
                + "Upgrade your everyday experience today.";

        String headline =
                "Upgrade Your Everyday Life with "
                + productName;

        String hashtags =
                "#CartNova #"
                + productName.replace(" ", "")
                + " #Shopping #BestDeal #Trending";

        request.setAttribute(
                "productName",
                productName);

        request.setAttribute(
                "description",
                description);

        request.setAttribute(
                "caption",
                caption);

        request.setAttribute(
                "headline",
                headline);

        request.setAttribute(
                "hashtags",
                hashtags);

        request.setAttribute(
                "generated",
                true);

        request.getRequestDispatcher("marketing.jsp")
               .forward(request, response);
    }
}