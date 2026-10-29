<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>CartNova - Smart E-Commerce Platform</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        /* ==============================
           HOME PAGE
           ============================== */

        .home-section {
            padding: 70px 20px;
        }

        .home-container {
            max-width: 1150px;
            margin: auto;
        }

        /* Hero */

        .hero-section {
            background: linear-gradient(
                135deg,
                #eff6ff,
                #ffffff
            );

            padding: 90px 30px;
            text-align: center;
        }

        .hero-section h1 {
            font-size: 48px;
            margin-bottom: 20px;
            color: #1e293b;
        }

        .hero-section p {
            font-size: 19px;
            color: #64748b;
            max-width: 700px;
            margin: 0 auto 30px;
        }

        .hero-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        /* Feature cards */

        .feature-grid {
            display: grid;
            grid-template-columns:
                repeat(4, 1fr);

            gap: 22px;
            margin-top: 40px;
        }

        .feature-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 28px 20px;
            text-align: center;
            transition: 0.25s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow:
                0 12px 30px
                rgba(15, 23, 42, 0.10);
        }

        .feature-icon {
            width: 100%;
            height: 150px;
            border-radius: 12px;
            overflow: hidden;
            margin-bottom: 20px;
            background: #eff6ff;
        }

        .feature-icon img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .feature-card h3 {
            margin-bottom: 10px;
            color: #1e293b;
        }

        .feature-card p {
            color: #64748b;
            line-height: 1.6;
        }

        /* Popular products */

        .section-title {
            text-align: center;
            margin-bottom: 10px;
            font-size: 34px;
            color: #1e293b;
        }

        .section-subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 40px;
        }

        .product-showcase {
            display: grid;
            grid-template-columns:
                repeat(3, 1fr);

            gap: 25px;
        }

        .showcase-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 18px;
            overflow: hidden;
            text-align: center;
            transition: 0.25s;
        }

        .showcase-card:hover {
            transform: translateY(-6px);
            box-shadow:
                0 15px 35px
                rgba(15, 23, 42, 0.12);
        }

        .showcase-image {
            width: 100%;
            height: 220px;
            overflow: hidden;
            background: #f1f5f9;
        }

        .showcase-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .showcase-content {
            padding: 25px;
        }

        .showcase-content h3 {
            color: #1e293b;
            margin-bottom: 10px;
        }

        .showcase-price {
            font-size: 22px;
            font-weight: bold;
            color: #2563eb;
            margin: 15px 0;
        }

        /* CTA */

        .cta-section {
            background: #2563eb;
            color: white;
            text-align: center;
            border-radius: 20px;
            padding: 60px 25px;
            margin: 40px auto 70px;
            max-width: 1100px;
        }

        .cta-section h2 {
            font-size: 34px;
            margin-bottom: 15px;
        }

        .cta-section p {
            margin-bottom: 25px;
            opacity: 0.9;
        }

        .cta-section .btn {
            background: white;
            color: #2563eb;
        }

        /* Responsive */

        @media (max-width: 900px) {

            .feature-grid {
                grid-template-columns:
                    repeat(2, 1fr);
            }

            .product-showcase {
                grid-template-columns:
                    1fr;
            }

            .hero-section h1 {
                font-size: 38px;
            }
        }

        @media (max-width: 600px) {

            .feature-grid {
                grid-template-columns:
                    1fr;
            }

            .hero-section {
                padding: 60px 20px;
            }

            .hero-section h1 {
                font-size: 32px;
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
     HERO SECTION
     ============================== -->

<section class="hero-section">

    <div class="home-container">

        <h1>
            Build Your Store. Grow Your Business.
        </h1>

        <p>
            CartNova combines e-commerce,
            order management, profit analysis
            and AI-powered marketing tools
            in one simple platform.
        </p>


        <div class="hero-buttons">

            <a href="${pageContext.request.contextPath}/products"
               class="btn btn-primary">

                Explore Products

            </a>


            <a href="${pageContext.request.contextPath}/estimator"
               class="btn btn-secondary">

                Calculate Profit

            </a>

        </div>

    </div>

</section>


<!-- ==============================
     FEATURES
     ============================== -->

<section class="home-section">

    <div class="home-container">

        <h2 class="section-title">
            Everything You Need in One Place
        </h2>

        <p class="section-subtitle">
            CartNova combines essential e-commerce
            and business tools into a simple platform.
        </p>


        <div class="feature-grid">


            <!-- Product Store -->

            <div class="feature-card">

                <div class="feature-icon">

                    <img
                        src="https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?auto=format&fit=crop&w=700&q=80"
                        alt="Online shopping">

                </div>

                <h3>
                    Product Store
                </h3>

                <p>
                    Browse and manage products
                    through a simple online catalogue.
                </p>

            </div>


            <!-- Order Management -->

            <div class="feature-card">

                <div class="feature-icon">

                    <img
                        src="https://images.unsplash.com/photo-1586880244406-556ebe35f282?auto=format&fit=crop&w=700&q=80"
                        alt="Order management">

                </div>

                <h3>
                    Order Management
                </h3>

                <p>
                    Add products to your cart,
                    checkout and place orders.
                </p>

            </div>


            <!-- Profit -->

            <div class="feature-card">

                <div class="feature-icon">

                    <img
                        src="https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=700&q=80"
                        alt="Profit analytics">

                </div>

                <h3>
                    Profit Estimator
                </h3>

                <p>
                    Estimate revenue, expenses,
                    profit and profit margin.
                </p>

            </div>


            <!-- AI Marketing -->

            <div class="feature-card">

                <div class="feature-icon">

                    <img
                        src="https://images.unsplash.com/photo-1677442136019-21780ecad995?auto=format&fit=crop&w=700&q=80"
                        alt="AI marketing">

                </div>

                <h3>
                    AI Marketing
                </h3>

                <p>
                    Create product descriptions,
                    captions and promotional content.
                </p>

            </div>

        </div>

    </div>

</section>


<!-- ==============================
     HOW CARTNOVA WORKS
     ============================== -->

<section class="home-section">

    <div class="home-container">

        <h2 class="section-title">
            How CartNova Works
        </h2>

        <p class="section-subtitle">
            A simple workflow for running your online business.
        </p>


        <div class="feature-grid">


            <div class="feature-card">

                <div class="feature-icon">

                    <img
                        src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=700&q=80"
                        alt="Explore products">

                </div>

                <h3>
                    Explore
                </h3>

                <p>
                    Discover products available
                    in your CartNova store.
                </p>

            </div>


            <div class="feature-card">

                <div class="feature-icon">

                    <img
                        src="https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=700&q=80"
                        alt="Shopping online">

                </div>

                <h3>
                    Shop
                </h3>

                <p>
                    Select products and
                    add them to your cart.
                </p>

            </div>


            <div class="feature-card">

                <div class="feature-icon">

                    <img
                        src="https://images.unsplash.com/photo-1554224155-6726b3ff858f?auto=format&fit=crop&w=700&q=80"
                        alt="Business analysis">

                </div>

                <h3>
                    Analyze
                </h3>

                <p>
                    Calculate your revenue,
                    expenses and expected profit.
                </p>

            </div>


            <div class="feature-card">

                <div class="feature-icon">

                    <img
                        src="https://images.unsplash.com/photo-1557838923-2985c318be48?auto=format&fit=crop&w=700&q=80"
                        alt="Digital marketing">

                </div>

                <h3>
                    Promote
                </h3>

                <p>
                    Generate promotional
                    content for your products.
                </p>

            </div>

        </div>

    </div>

</section>


<!-- ==============================
     POPULAR PRODUCTS
     ============================== -->

<section class="home-section">

    <div class="home-container">

        <h2 class="section-title">
            Popular Products
        </h2>

        <p class="section-subtitle">
            Explore some of the products available on CartNova.
        </p>


        <div class="product-showcase">


            <!-- Smart Watch -->

            <div class="showcase-card">

                <div class="showcase-image">

                    <img
                        src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=800&q=80"
                        alt="Smart Fitness Watch">

                </div>

                <div class="showcase-content">

                    <h3>
                        Smart Fitness Watch
                    </h3>

                    <p>
                        Track fitness activities,
                        health metrics and everyday notifications.
                    </p>

                    <div class="showcase-price">
                        Rs. 3499
                    </div>

                    <a href="${pageContext.request.contextPath}/products"
                       class="btn btn-primary">

                        View Product

                    </a>

                </div>

            </div>


            <!-- Java Course -->

            <div class="showcase-card">

                <div class="showcase-image">

                    <img
                        src="https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=800&q=80"
                        alt="Java Web Course">

                </div>

                <div class="showcase-content">

                    <h3>
                        Advanced Java Web Blueprint
                    </h3>

                    <p>
                        Learn concepts and techniques
                        for building Java web applications.
                    </p>

                    <div class="showcase-price">
                        Rs. 2499
                    </div>

                    <a href="${pageContext.request.contextPath}/products"
                       class="btn btn-primary">

                        View Product

                    </a>

                </div>

            </div>


            <!-- Earbuds -->

            <div class="showcase-card">

                <div class="showcase-image">

                    <img
                        src="https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?auto=format&fit=crop&w=800&q=80"
                        alt="Wireless Earbuds">

                </div>

                <div class="showcase-content">

                    <h3>
                        Wireless Noise-Canceling Earbuds
                    </h3>

                    <p>
                        Enjoy a convenient listening
                        experience for work and everyday use.
                    </p>

                    <div class="showcase-price">
                        Rs. 2999
                    </div>

                    <a href="${pageContext.request.contextPath}/products"
                       class="btn btn-primary">

                        View Product

                    </a>

                </div>

            </div>


        </div>


        <div style="text-align:center; margin-top:35px;">

            <a href="${pageContext.request.contextPath}/products"
               class="btn btn-primary">

                View All Products

            </a>

        </div>

    </div>

</section>


<!-- ==============================
     BUSINESS TOOLS
     ============================== -->

<section class="home-section">

    <div class="home-container">

        <h2 class="section-title">
            Business Tools
        </h2>

        <p class="section-subtitle">
            Tools designed to help you understand
            and promote your online business.
        </p>


        <div class="product-showcase">


            <!-- Earnings -->

            <div class="showcase-card">

                <div class="showcase-image">

                    <img
                        src="https://images.unsplash.com/photo-1554224155-6726b3ff858f?auto=format&fit=crop&w=800&q=80"
                        alt="Earnings and profit">

                </div>

                <div class="showcase-content">

                    <h3>
                        Earnings & Profit Estimator
                    </h3>

                    <p>
                        Calculate revenue,
                        expenses, profit and margin.
                    </p>

                    <a href="${pageContext.request.contextPath}/estimator"
                       class="btn btn-primary">

                        Open Estimator

                    </a>

                </div>

            </div>


            <!-- Marketing -->

            <div class="showcase-card">

                <div class="showcase-image">

                    <img
                        src="https://images.unsplash.com/photo-1557838923-2985c318be48?auto=format&fit=crop&w=800&q=80"
                        alt="Marketing">

                </div>

                <div class="showcase-content">

                    <h3>
                        AI Marketing Assistant
                    </h3>

                    <p>
                        Generate product descriptions,
                        headlines, captions and hashtags.
                    </p>

                    <a href="${pageContext.request.contextPath}/marketing"
                       class="btn btn-primary">

                        Open AI Marketing

                    </a>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ==============================
     CALL TO ACTION
     ============================== -->

<section class="cta-section">

    <h2>
        Ready to Grow Your Online Business?
    </h2>

    <p>
        Explore products, calculate your profit
        and create marketing content with CartNova.
    </p>

    <a href="${pageContext.request.contextPath}/products"
       class="btn">

        Start Shopping

    </a>

</section>


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