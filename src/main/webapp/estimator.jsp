<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    Boolean calculated =
            (Boolean) request.getAttribute("calculated");

    Object revenueObj =
            request.getAttribute("revenue");

    Object productCostObj =
            request.getAttribute("totalProductCost");

    Object expensesObj =
            request.getAttribute("totalExpenses");

    Object profitObj =
            request.getAttribute("profit");

    Object marginObj =
            request.getAttribute("profitMargin");

    String errorMessage =
            (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Earnings & Profit Estimator - CartNova</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">

<style>

.estimator-container {
    max-width: 1000px;
    margin: 45px auto;
    padding: 20px;
}

.estimator-header {
    text-align: center;
    margin-bottom: 35px;
}

.estimator-header h1 {
    font-size: 34px;
    margin-bottom: 10px;
}

.estimator-header p {
    color: #64748b;
    font-size: 16px;
}

.estimator-card {
    background: white;
    border-radius: 18px;
    padding: 30px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.07);
}

.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 22px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

.form-group label {
    font-weight: 600;
    margin-bottom: 8px;
}

.form-group input {
    padding: 13px;
    border: 1px solid #cbd5e1;
    border-radius: 9px;
    font-size: 15px;
}

.form-group input:focus {
    outline: none;
    border-color: #2563eb;
}

.full-width {
    grid-column: 1 / -1;
}

.calculate-btn {
    width: 100%;
    margin-top: 25px;
    padding: 14px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.results {
    margin-top: 35px;
}

.results h2 {
    text-align: center;
    margin-bottom: 20px;
}

.result-grid {
    display: grid;
    grid-template-columns:
        repeat(2, 1fr);
    gap: 18px;
}

.result-box {
    background: #f8fafc;
    border-radius: 14px;
    padding: 22px;
    text-align: center;
    border: 1px solid #e2e8f0;
}

.result-box h3 {
    margin-bottom: 10px;
    font-size: 15px;
    color: #64748b;
}

.result-value {
    font-size: 25px;
    font-weight: bold;
}

.profit-box {
    grid-column: 1 / -1;
    background: #eff6ff;
}

.profit-value {
    color: #2563eb;
    font-size: 32px;
}

.margin-box {
    grid-column: 1 / -1;
}

.error-message {
    margin-top: 20px;
    padding: 12px;
    background: #fee2e2;
    color: #b91c1c;
    border-radius: 8px;
    text-align: center;
}

@media (max-width: 700px) {

    .form-grid,
    .result-grid {
        grid-template-columns: 1fr;
    }

    .full-width,
    .profit-box,
    .margin-box {
        grid-column: auto;
    }

    .estimator-card {
        padding: 20px;
    }

}

</style>

</head>


<body>


<!-- NAVBAR -->

<nav class="navbar">

    <div class="container nav-container">

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

            <a href="${pageContext.request.contextPath}/estimator">
                Earnings Estimator
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


<!-- MAIN CONTENT -->

<div class="estimator-container">


    <div class="estimator-header">

        <h1>
            Earnings & Profit Estimator
        </h1>

        <p>
            Calculate your expected revenue, expenses,
            profit and profit margin.
        </p>

    </div>


    <div class="estimator-card">


        <!-- CALCULATOR FORM -->

        <form action="${pageContext.request.contextPath}/estimator"
              method="post">


            <div class="form-grid">


                <div class="form-group">

                    <label>
                        Product Cost (per unit)
                    </label>

                    <input type="number"
                           name="productCost"
                           step="0.01"
                           min="0"
                           placeholder="Example: 500"
                           required>

                </div>


                <div class="form-group">

                    <label>
                        Selling Price (per unit)
                    </label>

                    <input type="number"
                           name="sellingPrice"
                           step="0.01"
                           min="0"
                           placeholder="Example: 1000"
                           required>

                </div>


                <div class="form-group">

                    <label>
                        Quantity Sold
                    </label>

                    <input type="number"
                           name="quantity"
                           min="1"
                           placeholder="Example: 10"
                           required>

                </div>


                <div class="form-group">

                    <label>
                        Advertising Cost
                    </label>

                    <input type="number"
                           name="advertisingCost"
                           step="0.01"
                           min="0"
                           placeholder="Example: 1000"
                           required>

                </div>


                <div class="form-group full-width">

                    <label>
                        Other Expenses
                    </label>

                    <input type="number"
                           name="otherExpenses"
                           step="0.01"
                           min="0"
                           placeholder="Example: 500"
                           required>

                </div>


            </div>


            <button type="submit"
                    class="btn btn-primary calculate-btn">

                Calculate Earnings

            </button>


        </form>


        <!-- ERROR -->

        <%
            if (errorMessage != null) {
        %>

            <div class="error-message">
                <%= errorMessage %>
            </div>

        <%
            }
        %>


        <!-- RESULTS -->

        <%
            if (Boolean.TRUE.equals(calculated)) {
        %>

        <div class="results">

            <h2>
                Estimated Results
            </h2>


            <div class="result-grid">


                <div class="result-box">

                    <h3>
                        Total Revenue
                    </h3>

                    <div class="result-value">
                        Rs. <%= String.format("%.2f", revenueObj) %>
                    </div>

                </div>


                <div class="result-box">

                    <h3>
                        Product Cost
                    </h3>

                    <div class="result-value">
                        Rs. <%= String.format("%.2f", productCostObj) %>
                    </div>

                </div>


                <div class="result-box">

                    <h3>
                        Total Expenses
                    </h3>

                    <div class="result-value">
                        Rs. <%= String.format("%.2f", expensesObj) %>
                    </div>

                </div>


                <div class="result-box profit-box">

                    <h3>
                        Estimated Profit
                    </h3>

                    <div class="result-value profit-value">

                        Rs. <%= String.format("%.2f", profitObj) %>

                    </div>

                </div>


                <div class="result-box margin-box">

                    <h3>
                        Profit Margin
                    </h3>

                    <div class="result-value">

                        <%= String.format("%.2f", marginObj) %>%

                    </div>

                </div>


            </div>

        </div>

        <%
            }
        %>


    </div>

</div>


</body>

</html>