<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Products - CartNova</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .products-page {
            padding: 45px 30px 70px;
        }

        .products-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .products-header h1 {
            font-size: 34px;
            margin-bottom: 8px;
        }

        .products-header p {
            color: var(--text-muted);
        }

        .product-grid {
            width: 100%;
            max-width: 1200px;
            margin: auto;
            display: grid;
            grid-template-columns:
                repeat(3, minmax(0, 1fr));
            gap: 24px;
        }

        .product-card {
            background: white;
            border: 1px solid var(--border);
            border-radius: 16px;
            overflow: hidden;
            box-shadow:
                0 5px 15px rgba(0,0,0,.05);
            transition:
                transform .2s ease,
                box-shadow .2s ease;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow:
                0 12px 28px rgba(0,0,0,.10);
        }

        .product-image {
            height: 190px;
            background:
                linear-gradient(
                    135deg,
                    #eff6ff,
                    #dbeafe
                );
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 65px;
        }

        .product-content {
            padding: 22px;
        }

        .stock-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            background: #dcfce7;
            color: #15803d;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .product-content h2 {
            font-size: 19px;
            margin-bottom: 8px;
        }

        .product-description {
            color: var(--text-muted);
            font-size: 14px;
            line-height: 1.6;
            min-height: 65px;
            margin-bottom: 18px;
        }

        .product-bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
        }

        .product-price {
            font-size: 21px;
            font-weight: 700;
        }

        .add-button {
            padding: 10px 15px;
        }

        .no-products {
            text-align: center;
            padding: 60px;
            color: var(--text-muted);
        }

        @media (max-width: 900px) {

            .product-grid {
                grid-template-columns:
                    repeat(2, minmax(0, 1fr));
            }

        }

        @media (max-width: 600px) {

            .products-page {
                padding: 30px 18px;
            }

            .product-grid {
                grid-template-columns: 1fr;
            }

        }

    </style>

</head>

<body>


<nav class="navbar">

    <a href="${pageContext.request.contextPath}/"
       class="nav-brand">

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

            String userName =
                (String) session.getAttribute("userName");

            if (userName != null) {

        %>

            <a href="${pageContext.request.contextPath}/logout"
               class="btn btn-primary">

                Logout

            </a>

        <%

            } else {

        %>

            <a href="${pageContext.request.contextPath}/login.jsp"
               class="btn btn-primary">

                Login

            </a>

        <%

            }

        %>

    </div>

</nav>



<div class="products-page">


    <div class="products-header">

        <h1>
            Explore Our Products
        </h1>

        <p>
            Discover quality products available on CartNova.
        </p>

    </div>



    <div class="product-grid">


        <%

            List<Map<String, Object>> products =

                (List<Map<String, Object>>)
                request.getAttribute("products");


            if (products != null && !products.isEmpty()) {


                for (Map<String, Object> product : products) {


                    int id =
                        (Integer) product.get("id");


                    String name =
                        (String) product.get("name");


                    String description =
                        (String) product.get("description");


                    Object price =
                        product.get("price");


                    int stock =
                        (Integer) product.get("stock");


                    String image =
                        (String) product.get("image");

        %>


        <div class="product-card">


            <div class="product-image">

                <%= image %>

            </div>



            <div class="product-content">


                <span class="stock-badge">

                    <%= stock > 0
                        ? "In Stock"
                        : "Out of Stock" %>

                </span>



                <h2>

                    <%= name %>

                </h2>



                <p class="product-description">

                    <%= description %>

                </p>



                <div class="product-bottom">


                    <span class="product-price">

                        Rs. <%= price %>

                    </span>



                    <%

                        if (stock > 0) {

                    %>


                        <form
                            action="${pageContext.request.contextPath}/cart"
                            method="post">


                            <!-- IMPORTANT: tells CartServlet to ADD -->

                            <input
                                type="hidden"
                                name="action"
                                value="add">


                            <input
                                type="hidden"
                                name="productId"
                                value="<%= id %>">


                            <button
                                type="submit"
                                class="btn btn-primary add-button">

                                Add to Cart

                            </button>


                        </form>


                    <%

                        } else {

                    %>


                        <button
                            class="btn"
                            disabled
                            style="
                                background:#e2e8f0;
                                color:#64748b;
                            ">

                            Out of Stock

                        </button>


                    <%

                        }

                    %>


                </div>


            </div>


        </div>


        <%

                }

            } else {

        %>


            <div class="no-products">

                <h2>
                    No products available
                </h2>

                <p>
                    Please check the database connection.
                </p>

            </div>


        <%

            }

        %>


    </div>


</div>


</body>

</html>