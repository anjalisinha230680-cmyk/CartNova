<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Create Account - CartNova</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        /* ==============================
           REGISTRATION PAGE
           ============================== */

        .register-page {
            min-height: calc(100vh - 72px);

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 45px 20px;

            background:
                radial-gradient(circle at top left,
                rgba(37, 99, 235, 0.10),
                transparent 35%),
                radial-gradient(circle at bottom right,
                rgba(16, 185, 129, 0.08),
                transparent 35%),
                var(--bg-main);
        }


        .register-wrapper {
            width: 100%;
            max-width: 950px;

            display: grid;
            grid-template-columns: 0.9fr 1.1fr;

            background: white;

            border: 1px solid var(--border);

            border-radius: 18px;

            overflow: hidden;

            box-shadow:
                0 15px 40px rgba(15, 23, 42, 0.10);
        }


        /* LEFT SIDE */

        .register-info {
            padding: 45px 38px;

            background:
                linear-gradient(145deg,
                #2563eb,
                #1d4ed8);

            color: white;

            display: flex;
            flex-direction: column;
            justify-content: center;
        }


        .register-logo {
            font-size: 28px;

            font-weight: 800;

            margin-bottom: 35px;
        }


        .register-info h1 {
            font-size: 32px;

            line-height: 1.2;

            margin-bottom: 15px;
        }


        .register-info > p {
            color: rgba(255,255,255,0.85);

            font-size: 15px;

            line-height: 1.7;

            margin-bottom: 30px;
        }


        .benefit {
            display: flex;

            align-items: center;

            gap: 12px;

            margin-bottom: 18px;

            font-size: 14px;

            color: rgba(255,255,255,0.95);
        }


        .benefit-icon {
            width: 34px;
            height: 34px;

            flex-shrink: 0;

            border-radius: 50%;

            background: rgba(255,255,255,0.15);

            display: flex;

            align-items: center;
            justify-content: center;

            font-size: 16px;
        }


        /* RIGHT SIDE */

        .register-form {
            padding: 45px 45px;
        }


        .register-form h2 {
            font-size: 26px;

            margin-bottom: 7px;

            color: var(--text-main);
        }


        .register-subtitle {
            color: var(--text-muted);

            font-size: 14px;

            margin-bottom: 25px;
        }


        .register-form .form-group {
            margin-bottom: 17px;
        }


        .register-form label {
            display: block;

            font-size: 14px;

            font-weight: 600;

            margin-bottom: 7px;
        }


        .register-form input {
            width: 100%;

            padding: 12px 13px;

            border: 1px solid var(--border);

            border-radius: 7px;

            font-size: 14px;

            outline: none;

            transition: 0.2s;
        }


        .register-form input:focus {
            border-color: var(--primary);

            box-shadow:
                0 0 0 3px rgba(37,99,235,0.10);
        }


        .register-button {
            width: 100%;

            margin-top: 7px;

            padding: 13px;

            font-size: 15px;
        }


        .login-link {
            text-align: center;

            margin-top: 22px;

            color: var(--text-muted);

            font-size: 14px;
        }


        .login-link a {
            color: var(--primary);

            text-decoration: none;

            font-weight: 600;
        }


        .login-link a:hover {
            text-decoration: underline;
        }


        /* MOBILE */

        @media (max-width: 750px) {

            .register-wrapper {
                grid-template-columns: 1fr;
            }

            .register-info {
                padding: 30px;
            }

            .register-info h1 {
                font-size: 27px;
            }

            .register-form {
                padding: 35px 28px;
            }

        }

    </style>
</head>

<body>


<!-- Navigation -->

<nav class="navbar">

    <a href="${pageContext.request.contextPath}/"
       class="nav-brand">

        ⚡ CartNova

    </a>


    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/login.jsp">
            Login
        </a>

    </div>

</nav>


<!-- Registration -->

<div class="register-page">

    <div class="register-wrapper">


        <!-- LEFT INFORMATION PANEL -->

        <div class="register-info">

            <div class="register-logo">
                ⚡ CartNova
            </div>


            <h1>
                Start Your Shopping Journey
            </h1>


            <p>
                Create your CartNova account and discover
                products, manage your orders and enjoy a
                simple online shopping experience.
            </p>


            <div class="benefit">

                <div class="benefit-icon">
                    🛍️
                </div>

                <span>
                    Explore a wide range of products
                </span>

            </div>


            <div class="benefit">

                <div class="benefit-icon">
                    🔒
                </div>

                <span>
                    Secure account and data management
                </span>

            </div>


            <div class="benefit">

                <div class="benefit-icon">
                    📦
                </div>

                <span>
                    Easily manage your orders
                </span>

            </div>


            <div class="benefit">

                <div class="benefit-icon">
                    ⚡
                </div>

                <span>
                    Fast and simple shopping experience
                </span>

            </div>

        </div>


        <!-- REGISTRATION FORM -->

        <div class="register-form">

            <h2>
                Create Your Account
            </h2>


            <p class="register-subtitle">
                Fill in your details to get started.
            </p>


            <%
                String errorMessage =
                    (String) request.getAttribute("errorMessage");

                if (errorMessage != null && !errorMessage.isEmpty()) {
            %>

                <div class="alert alert-error">
                    <%= errorMessage %>
                </div>

            <%
                }
            %>


            <form action="${pageContext.request.contextPath}/register"
                  method="post">


                <div class="form-group">

                    <label for="name">
                        Full Name
                    </label>

                    <input
                        type="text"
                        id="name"
                        name="name"
                        placeholder="Enter your full name"
                        required>

                </div>


                <div class="form-group">

                    <label for="email">
                        Email Address
                    </label>

                    <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="Enter your email address"
                        required>

                </div>


                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Create a password"
                        required>

                </div>


                <button
                    type="submit"
                    class="btn btn-primary register-button">

                    Create Account

                </button>

            </form>


            <p class="login-link">

                Already have an account?

                <a href="${pageContext.request.contextPath}/login.jsp">
                    Sign In
                </a>

            </p>

        </div>

    </div>

</div>

</body>
</html>