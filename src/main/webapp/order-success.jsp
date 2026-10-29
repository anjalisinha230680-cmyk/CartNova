<%
    Integer orderId =
        (Integer) session.getAttribute("lastOrderId");

    session.removeAttribute("lastOrderId");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="ISO-8859-1">

    <title>Order Successful - CartNova</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .success-page {
            max-width: 650px;
            margin: 80px auto;
            padding: 20px;
            text-align: center;
        }

        .success-card {
            background: white;
            padding: 45px;
            border-radius: 16px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .success-icon {
            font-size: 50px;
            color: #16a34a;
            margin-bottom: 20px;
        }

        .success-card h1 {
            color: #111827;
            margin-bottom: 15px;
        }

        .success-card p {
            color: #6b7280;
            margin-bottom: 10px;
        }

        .order-number {
            font-size: 20px;
            font-weight: 700;
            color: #2563eb;
            margin: 20px 0;
        }

        .btn {
            display: inline-block;
            padding: 12px 22px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
        }

    </style>

</head>

<body>

<div class="success-page">

    <div class="success-card">

        <div class="success-icon">
            Order Placed
        </div>

        <h1>
            Thank You!
        </h1>

        <p>
            Your order has been successfully placed.
        </p>

        <%
            if (orderId != null) {
        %>

            <div class="order-number">
                Order ID: #<%= orderId %>
            </div>

        <%
            }
        %>

        <a href="${pageContext.request.contextPath}/products"
           class="btn">

            Continue Shopping

        </a>

    </div>

</div>

</body>

</html>