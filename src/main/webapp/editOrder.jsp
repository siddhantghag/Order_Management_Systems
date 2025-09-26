<%@page import="com.yash.OrderMangementSystemServlet.serviceimpl.ProductServiceImpl"%>
<%@page import="com.yash.OrderMangementSystemServlet.daoimpl.OrderDaoImpl"%>
<%@page import="com.yash.OrderMangementSystemServlet.pojo.Product"%>
<%@page import="java.util.*, com.yash.OrderMangementSystemServlet.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    int orderId = Integer.parseInt(request.getParameter("orderId"));
    String error = null;

    String selectedProductId = request.getParameter("selectedProductId");
    String productName = "";
    String orderAmount = "";

    ProductServiceImpl impl = new ProductServiceImpl();
    List<Product> productList = impl.getAllProduct();

    Product selectedProduct = null;

    if (selectedProductId != null) {
        for (Product product : productList) {
            if (String.valueOf(product.getProductId()).equals(selectedProductId)) {
                selectedProduct = product;
                break;
            }
        }
    }

    if (selectedProduct != null) {
        productName = selectedProduct.getProductName();
        orderAmount = String.valueOf(selectedProduct.getProductPrise());
    } else {
        OrderDaoImpl dao = new OrderDaoImpl();
        Product p = dao.getProductByOrderId(orderId);

        if (p != null) {
            productName = p.getProductName();
            orderAmount = String.valueOf(p.getProductPrise());
            selectedProductId = String.valueOf(p.getProductId());
        } else {
            error = "Product not found for the given Order ID.";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Order</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
        }

        header {
            text-align: center;
            background-color: #3498db;
            color: white;
            font-size: 16px;
        }

        .container {
            display: flex;
            justify-content: center;
        }

        .main-content {
            width: 60%;
            
        }

        form {
            width: 37%;
            margin: auto;
            background-color: #ffffff;
            padding: 18px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }
        
        .one
        { 
           width: 37%;
            margin: auto;
            background-color: #ffffff;
            padding: 18px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            margin: 20px;
            
        }
        
		.first-form
		{
			padding-left: 4px;
			display: flex;
			justify-content: center;
		}
		
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #555;
            font-size: 15px;
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 14px;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<header>
    <h2>Edit Order</h2>
</header>

<div class="container">
    <div class="main-content">
        <div class="first-form">
        <form class="one" method="get">
            <input type="hidden" name="orderId" value="<%= orderId %>">
            <label>Product Name:</label>
            <select name="selectedProductId" onchange="this.form.submit()">
                <option value="">-- Select Product --</option>
                <% for (Product product : productList) { %>
                    <option value="<%= product.getProductId() %>"
                        <%= (selectedProductId != null && selectedProductId.equals(String.valueOf(product.getProductId()))) ? "selected" : "" %>>
                        <%= product.getProductName() %> - ₹<%= product.getProductPrise() %>
                    </option>
                <% } %>
            </select>
        </form>
        </div>
        <form action="OrderEditController" method="post">
            <% if (error != null) { %>
                <div class="error"><%= error %></div>
            <% } %>

            <label>Order ID:</label>
            <input type="text" name="orderId" value="<%= orderId %>" readonly>

            <label>Product Name:</label>
            <input type="text" name="productName" value="<%= productName %>" readonly>

            <label>Price:</label>
            <input type="text" name="orderAmount" value="<%= orderAmount %>">

            <input type="submit" value="Update Order">
        </form>
    </div>
</div>

</body>
</html>