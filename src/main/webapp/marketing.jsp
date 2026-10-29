<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    Boolean generated =
            (Boolean) request.getAttribute("generated");

    String productName =
            (String) request.getAttribute("productName");

    String description =
            (String) request.getAttribute("description");

    String caption =
            (String) request.getAttribute("caption");

    String headline =
            (String) request.getAttribute("headline");

    String hashtags =
            (String) request.getAttribute("hashtags");

    String errorMessage =
            (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>AI Marketing Assistant - CartNova</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">

<style>

.marketing-container {
    max-width: 1050px;
    margin: 45px auto;
    padding: 20px;
}

.marketing-header {
    text-align: center;
    margin-bottom: 35px;
}

.marketing-header h1 {
    font-size: 34px;
    margin-bottom: 10px;
}

.marketing-header p {
    color: #64748b;
    font-size: 16px;
}

.marketing-card {
    background: white;
    border-radius: 18px;
    padding: 30px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.07);
}

.form-group {
    margin-bottom: 22px;
}

.form-group label {
    display: block;
    font-weight: 600;
    margin-bottom: 8px;
}

.form-group input,
.form-group textarea {
    width: 100%;
    box-sizing: border-box;
    padding: 13px;
    border: 1px solid #cbd5e1;
    border-radius: 9px;
    font-size: 15px;
    font-family: inherit;
}

.form-group textarea {
    min-height: 130px;
    resize: vertical;
}

.form-group input:focus,
.form-group textarea:focus {
    outline: none;
    border-color: #2563eb;
}

.generate-btn {
    width: 100%;
    padding: 14px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.error-message {
    margin-bottom: 20px;
    padding: 12px;
    background: #fee2e2;
    color: #b91c1c;
    border-radius: 8px;
    text-align: center;
}

.results {
    margin-top: 35px;
}

.results h2 {
    text-align: center;
    margin-bottom: 25px;
}

.result-card {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 14px;
    padding: 22px;
    margin-bottom: 18px;
}

.result-card h3 {
    margin-top: 0;
    color: #2563eb;
}

.result-content {
    color: #334155;
    line-height: 1.7;
}

@media (max-width: 700px) {

    .marketing-container {
        margin: 25px auto;
    }

    .marketing-card {
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


<!-- MAIN CONTENT -->

<div class="marketing-container">


    <div class="marketing-header">

        <h1>
            AI Marketing Assistant
        </h1>

        <p>
            Generate product marketing content
            for your CartNova store.
        </p>

    </div>


    <div class="marketing-card">


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


        <!-- FORM -->

        <form action="${pageContext.request.contextPath}/marketing"
              method="post">


            <div class="form-group">

                <label>
                    Product Name
                </label>

                <input type="text"
                       name="productName"
                       placeholder="Example: Smart Fitness Watch"
                       required>

            </div>


            <div class="form-group">

                <label>
                    Product Details
                </label>

                <textarea
                    name="productDetails"
                    placeholder="Enter features, benefits, target customers, etc."
                    required></textarea>

            </div>


            <button type="submit"
                    class="btn btn-primary generate-btn">

                Generate Marketing Content

            </button>


        </form>


        <!-- GENERATED RESULTS -->

        <%
            if (Boolean.TRUE.equals(generated)) {
        %>

        <div class="results">

            <h2>
                Generated Marketing Content
            </h2>


            <div class="result-card">

                <h3>
                    Product Description
                </h3>

                <div class="result-content">
                    <%= description %>
                </div>

            </div>


            <div class="result-card">

                <h3>
                    Advertisement Headline
                </h3>

                <div class="result-content">
                    <%= headline %>
                </div>

            </div>


            <div class="result-card">

                <h3>
                    Social Media Caption
                </h3>

                <div class="result-content">
                    <%= caption %>
                </div>

            </div>


            <div class="result-card">

                <h3>
                    Hashtags
                </h3>

                <div class="result-content">
                    <%= hashtags %>
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