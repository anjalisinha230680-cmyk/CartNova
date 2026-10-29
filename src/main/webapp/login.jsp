<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login - CartNova</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .login-page {
            min-height: calc(100vh - 72px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 45px 20px;
            background:
                radial-gradient(circle at top right,
                rgba(37, 99, 235, 0.10),
                transparent 35%),
                var(--bg-main);
        }

        .login-card {
            width: 100%;
            max-width: 430px;
            background: white;
            border: 1px solid var(--border);
            border-radius: 18px;
            padding: 40px;
            box-shadow: 0 15px 40px rgba(15, 23, 42, 0.10);
        }

        .login-icon {
            width: 65px;
            height: 65px;
            margin: 0 auto 20px;
            border-radius: 50%;
            background: #eff6ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
        }

        .login-card h1 {
            text-align: center;
            font-size: 28px;
            margin-bottom: 8px;
        }

        .login-subtitle {
            text-align: center;
            color: var(--text-muted);
            font-size: 14px;
            margin-bottom: 28px;
        }

        .login-card .form-group {
            margin-bottom: 18px;
        }

        .login-card label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 7px;
        }

        .login-card input {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid var(--border);
            border-radius: 7px;
            font-size: 14px;
            outline: none;
        }

        .login-card input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
        }

        .login-button {
            width: 100%;
            padding: 13px;
            margin-top: 7px;
            font-size: 15px;
        }

        .register-link {
            text-align: center;
            margin-top: 22px;
            color: var(--text-muted);
            font-size: 14px;
        }

        .register-link a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .success-message {
            background: #dcfce7;
            color: #166534;
            padding: 12px;
            border-radius: 7px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 14px;
        }

        .error-message {
            background: #fee2e2;
            color: #991b1b;
            padding: 12px;
            border-radius: 7px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 14px;
        }

    </style>

</head>

<body>

<nav class="navbar">

    <a href="${pageContext.request.contextPath}/"
       class="nav-brand">
        ⚡ CartNova
    </a>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/register.jsp">
            Register
        </a>

    </div>

</nav>


<div class="login-page">

    <div class="login-card">

        <div class="login-icon">
            🔐
        </div>

        <h1>
            Welcome Back
        </h1>

        <p class="login-subtitle">
            Sign in to continue to CartNova
        </p>


        <%
            String registered = request.getParameter("registered");

            if ("true".equals(registered)) {
        %>

            <div class="success-message">
                Account created successfully! Please login.
            </div>

        <%
            }
        %>


        <%
            String errorMessage =
                (String) request.getAttribute("errorMessage");

            if (errorMessage != null && !errorMessage.isEmpty()) {
        %>

            <div class="error-message">
                <%= errorMessage %>
            </div>

        <%
            }
        %>


        <form action="${pageContext.request.contextPath}/login"
              method="post">

            <div class="form-group">

                <label for="email">
                    Email Address
                </label>

                <input
                    type="email"
                    id="email"
                    name="email"
                    placeholder="Enter your email"
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
                    placeholder="Enter your password"
                    required>

            </div>


            <button
                type="submit"
                class="btn btn-primary login-button">

                Login

            </button>

        </form>


        <p class="register-link">

            Don't have an account?

            <a href="${pageContext.request.contextPath}/register.jsp">
                Create Account
            </a>

        </p>

    </div>

</div>

</body>
</html>