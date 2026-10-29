<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.math.BigDecimal" %>

<%
    List<Map<String, Object>> products =
        (List<Map<String, Object>>)
        request.getAttribute("checkoutProducts");

    BigDecimal total =
        (BigDecimal) request.getAttribute("total");

    if (total == null) {
        total = BigDecimal.ZERO;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="ISO-8859-1">

    <title>Checkout - CartNova</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .checkout-page {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
        }

        .checkout-title {
            font-size: 32px;
            color: #111827;
            margin-bottom: 25px;
        }

        .checkout-card {
            background: white;
            border-radius: 14px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
        }

        .checkout-card h2 {
            margin-bottom: 20px;
            color: #111827;
        }

        .checkout-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #e5e7eb;
        }

        .checkout-item:last-child {
            border-bottom: none;
        }

        .item-name {
            font-weight: 600;
            color: #111827;
        }

        .item-price {
            font-weight: 600;
            color: #2563eb;
        }

        .checkout-total {
            display: flex;
            justify-content: space-between;
            font-size: 22px;
            font-weight: 700;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 2px solid #e5e7eb;
        }

        .place-order {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 8px;
            background: #2563eb;
            color: white;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
        }

        .place-order:hover {
            background: #1d4ed8;
        }

        .back-link {
            display: inline-block;
            margin-top: 15px;
            color: #2563eb;
            text-decoration: none;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

    </style>

</head>

<body>


<!-- NAVBAR -->

<nav class="navbar">

    <div class="nav-container">

        <a href="${pageContext.request.contextPath}/"
           class="logo">
            CartNova
        </a>

        <div class="nav-links">

            <a href="${pageContext.request.contextPath}/">
                Home
            </a>

            <a href="${pageContext.request.contextPath}/products">
                Products
            </a>

            <a href="${pageContext.request.contextPath}/cart">
                Cart
            </a>

            <a href="${pageContext.request.contextPath}/logout">
                Logout
            </a>

        </div>

    </div>

</nav>


<div class="checkout-page">

    <h1 class="checkout-title">
        Checkout
    </h1>


    <%
        String errorMessage =
            (String) request.getAttribute("errorMessage");

        if (errorMessage != null) {
    %>

        <div class="error">
            <%= errorMessage %>
        </div>

    <%
        }
    %>


    <!-- ORDER SUMMARY -->

    <div class="checkout-card">

        <h2>
            Order Summary
        </h2>


        <%
            if (products != null) {

                for (Map<String, Object> product : products) {

                    String name =
                        (String) product.get("name");

                    BigDecimal price =
                        (BigDecimal) product.get("price");
        %>


            <div class="checkout-item">

                <span class="item-name">
                    <%= name %>
                </span>

                <span class="item-price">
                    Rs. <%= price %>
                </span>

            </div>


        <%
                }
            }
        %>


        <div class="checkout-total">

            <span>
                Total
            </span>

            <span>
                Rs. <%= total %>
            </span>

        </div>

    </div>


    <!-- PLACE ORDER -->

    <div class="checkout-card">

        <h2>
            Confirm Order
        </h2>

        <p>
            Review your order and click the button below
            to place your order.
        </p>

        <br>

        <form action="${pageContext.request.contextPath}/checkout"
              method="post">

            <button type="submit"
                    class="place-order">

                Place Order

            </button>

        </form>


        <a href="${pageContext.request.contextPath}/cart"
           class="back-link">

            Back to Cart

        </a>

    </div>

</div>

</body>

</html>