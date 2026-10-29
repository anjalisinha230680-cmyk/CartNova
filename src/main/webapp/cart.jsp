<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Cart - CartNova</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .cart-page {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
        }

        .cart-title {
            font-size: 34px;
            color: #1e293b;
            margin-bottom: 30px;
        }

        .cart-item {
            display: flex;
            align-items: center;
            gap: 22px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 18px;
            margin-bottom: 18px;
            box-shadow: 0 5px 18px rgba(15, 23, 42, 0.06);
        }

        .cart-image {
            width: 110px;
            height: 90px;
            border-radius: 12px;
            overflow: hidden;
            background: #f1f5f9;
            flex-shrink: 0;
        }

        .cart-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .cart-info {
            flex: 1;
        }

        .cart-info h3 {
            margin: 0 0 8px;
            color: #1e293b;
            font-size: 19px;
        }

        .cart-price {
            color: #2563eb;
            font-size: 17px;
            font-weight: bold;
        }

        .remove-btn {
            border: none;
            background: transparent;
            color: #dc2626;
            font-weight: 600;
            cursor: pointer;
            padding: 10px;
        }

        .remove-btn:hover {
            color: #991b1b;
        }

        .cart-summary {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 25px;
            margin-top: 25px;
            text-align: right;
        }

        .cart-total {
            font-size: 24px;
            font-weight: bold;
            color: #1e293b;
            margin-bottom: 20px;
        }

        .cart-actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            flex-wrap: wrap;
        }

        .empty-cart {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 60px 20px;
            text-align: center;
        }

        .empty-cart h2 {
            color: #1e293b;
            margin-bottom: 10px;
        }

        .empty-cart p {
            color: #64748b;
            margin-bottom: 25px;
        }

        @media (max-width: 600px) {

            .cart-item {
                align-items: flex-start;
            }

            .cart-image {
                width: 85px;
                height: 75px;
            }

            .cart-info h3 {
                font-size: 16px;
            }

            .cart-actions {
                justify-content: center;
            }

        }

    </style>

</head>

<body>


<!-- ==============================
     NAVBAR
     ============================== -->

<nav class="navbar">

    <div class="nav-container">

        <a href="${pageContext.request.contextPath}/"
           class="nav-logo">

            CartNova

        </a>

        <div class="nav-links">

            <a href="${pageContext.request.contextPath}/">
                Home
            </a>

            <a href="${pageContext.request.contextPath}/products">
                Products
            </a>

            <a href="${pageContext.request.contextPath}/estimator">
                Earnings Estimator
            </a>

            <a href="${pageContext.request.contextPath}/marketing">
                AI Marketing
            </a>

            <a href="${pageContext.request.contextPath}/cart">
                Cart
            </a>


            <%
                Object userName =
                    session.getAttribute("userName");

                if (userName != null) {
            %>

                <a href="${pageContext.request.contextPath}/logout">
                    Logout
                </a>

            <%
                } else {
            %>

                <a href="${pageContext.request.contextPath}/login.jsp">
                    Login
                </a>

            <%
                }
            %>

        </div>

    </div>

</nav>


<!-- ==============================
     CART
     ============================== -->

<div class="cart-page">

    <h1 class="cart-title">
        Your Cart
    </h1>


    <%

        List<Integer> cart =
            (List<Integer>) request.getAttribute("cart");

        if (cart == null) {

            cart = new ArrayList<>();

        }


        double total = 0;


        if (cart.isEmpty()) {

    %>


        <div class="empty-cart">

            <h2>
                Your cart is empty
            </h2>

            <p>
                Add some products to your cart to get started.
            </p>

            <a href="${pageContext.request.contextPath}/products"
               class="btn btn-primary">

                Browse Products

            </a>

        </div>


    <%

        } else {

            for (Integer productId : cart) {

                String productName = "";
                String imageUrl = "";
                double price = 0;


                if (productId == 1) {

                    productName =
                        "Ergonomic Wireless Keyboard";

                    price = 4199;

                    imageUrl =
                        "https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&w=500&q=80";

                }

                else if (productId == 2) {

                    productName =
                        "Advanced Java Web Blueprint";

                    price = 2499;

                    imageUrl =
                        "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=500&q=80";

                }

                else if (productId == 3) {

                    productName =
                        "Wireless Noise-Canceling Earbuds";

                    price = 2999;

                    imageUrl =
                        "https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?auto=format&fit=crop&w=500&q=80";

                }

                else if (productId == 4) {

                    productName =
                        "Smart Fitness Watch";

                    price = 3499;

                    imageUrl =
                        "https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=500&q=80";

                }

                else if (productId == 5) {

                    productName =
                        "Travel Backpack";

                    price = 1499;

                    imageUrl =
                        "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=500&q=80";

                }

                else if (productId == 6) {

                    productName =
                        "Social Media Marketing Guide";

                    price = 999;

                    imageUrl =
                        "https://images.unsplash.com/photo-1556761175-b413da4baf72?auto=format&fit=crop&w=500&q=80";

                }


                total += price;

    %>


        <!-- CART ITEM -->

        <div class="cart-item">


            <div class="cart-image">

                <img src="<%= imageUrl %>"
                     alt="<%= productName %>">

            </div>


            <div class="cart-info">

                <h3>
                    <%= productName %>
                </h3>

                <div class="cart-price">
                    Rs. <%= String.format("%.2f", price) %>
                </div>

            </div>


            <form action="${pageContext.request.contextPath}/cart"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="remove">

                <input type="hidden"
                       name="productId"
                       value="<%= productId %>">

                <button type="submit"
                        class="remove-btn">

                    Remove

                </button>

            </form>


        </div>


    <%

            }

    %>


        <!-- CART SUMMARY -->

        <div class="cart-summary">

            <div class="cart-total">

                Total:
                Rs. <%= String.format("%.2f", total) %>

            </div>


            <div class="cart-actions">

                <a href="${pageContext.request.contextPath}/products"
                   class="btn btn-secondary">

                    Continue Shopping

                </a>


                <a href="${pageContext.request.contextPath}/checkout"
                   class="btn btn-primary">

                    Checkout

                </a>

            </div>

        </div>


    <%

        }

    %>

</div>


<!-- ==============================
     FOOTER
     ============================== -->

<footer class="footer">

    <p>
        © 2026 CartNova. Smart E-Commerce Platform.
    </p>

</footer>


</body>

</html>