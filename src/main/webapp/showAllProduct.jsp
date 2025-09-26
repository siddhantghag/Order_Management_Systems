<%@page import="com.yash.OrderMangementSystemServlet.pojo.Product"%>
<%@page import="com.yash.OrderMangementSystemServlet.serviceimpl.ProductServiceImpl"%>
<%@page import="com.yash.OrderMangementSystemServlet.serviceimpl.OrderServiceImpl"%>
<%@page import="com.yash.OrderMangementSystemServlet.service.OrderService"%>
<%@page import="java.util.*, com.yash.OrderMangementSystemServlet.pojo.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    OrderServiceImpl impl = new OrderServiceImpl();
    List<Order> orderList = impl.getAllOrder();
    
    ProductServiceImpl impl1 = new ProductServiceImpl();
    List<Product> productList = impl1.getAllProduct();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 40px;
        }

        header {
            text-align: center;
            padding: 1px;
            background-color: #3498db;
            color: white;
            font-size: 28px;
        }

        h3 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 24px;
        }

        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        th, td {
            padding: 14px 18px;
            border-bottom: 1px solid #eee;
            text-align: center;
            font-size: 15px;
            color: #555;
        }

        th {
            background-color: #3498db;
            color: white;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>

<header>Order Management System

<nav style="text-align: center; margin: 20px 0;">
    <form action="addProduct.jsp" method="post">
        <button class="form-button" style="background-color: #f9f9f9; color: black; border: none; padding: 10px 20px; border-radius: 5px; margin-left: 1000px;">
            Add Product
        </button>
    </form>

   <form action="editProduct.jsp" method="post"> 
        <button class="form-button" style="background-color: #f9f9f9; color: black; border: none; padding: 10px 20px; border-radius: 5px; margin-left: 1000px;">
            Edit Product
        </button>
    </form>

</header>

<h3>Product List</h3>

<table>
    <tr>
        <!-- <th>Order ID</th>
        <th>Customer Name</th>
        <th>Product</th>
        <th>Quantity</th>
        <th>Total Price</th> -->
        
        <th>productId</th>
        <th>productName</th>
        <th>productPrise</th>
    </tr>
    <%
        /* for (Order order : orderList) { */
        	for (Product p : productList) {
    %>
    <tr>
        <%-- <td><%= order.getOrderId() %></td>
        <td><%= order.getCustomerName() %></td>
        <td><%= order.getOrderAmount() %></td>
        <td><%= order.getStatus() %></td>
        <td><%= order.getUserId() %></td> --%>
        
         <td><%= p.getProductId() %></td>
        <td><%= p.getProductName() %></td>
        <td><%= p.getProductPrise() %></td>
    </tr>
    <%
        }
    %>
</table>
<form  class ="back_form" action="adminDashBoard.jsp">
				<button type="submit"
					style="background-color: #007BFF; color: white; border: none; padding: 10px 20px; border-radius: 5px; ">
					Back</button>
			</form>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
 
<%-- <%@page import="com.yash.OrderMangementSystemServlet.serviceimpl.OrderServiceImpl"%>
<%@page import="com.yash.OrderMangementSystemServlet.service.OrderService"%>
<%@page import="java.util.*, com.yash.OrderMangementSystemServlet.pojo.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    OrderServiceImpl impl = new OrderServiceImpl();
    List<Order> orderList = impl.getAllOrder();

    String selectedOrderId = request.getParameter("selectedOrderId");
    Order selectedOrder = null;

    if (selectedOrderId != null) {
        for (Order order : orderList) {
            if (String.valueOf(order.getOrderId()).equals(selectedOrderId)) {
                selectedOrder = order;
                break;
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Product</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 40px;
        }

        header {
            text-align: center;
            padding: 20px;
            background-color: #3498db;
            color: white;
            font-size: 28px;
        }

        h3 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 24px;
        }

        .form-container {
            text-align: center;
            margin-top: 40px;
        }

        select, button {
            padding: 12px;
            font-size: 16px;
            margin: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .details {
            margin-top: 40px;
            text-align: center;
            font-size: 18px;
            color: #333;
        }

        footer {
            margin-top: 60px;
            text-align: center;
        }
    </style>
</head>
<body>

<header>Order Management System</header>

<h3>Select a Product</h3>

<div class="form-container">
    <form method="get">
        <select name="selectedOrderId">
            <option value="">-- Select Product --</option>
            <%
                for (Order order : orderList) {
            %>
                <option value="<%= order.getOrderId() %>" <%= (selectedOrderId != null && selectedOrderId.equals(String.valueOf(order.getOrderId()))) ? "selected" : "" %>>
                    <%= order.getOrderAmount() %> - <%= order.getCustomerName() %>
                </option>
            <%
                }
            %>
        </select>
        <button type="submit">Show Details</button>
    </form>
</div>

<%
    if (selectedOrder != null) {
%>
    <div class="details">
        <h4>Product Details</h4>
        <p><strong>Order ID:</strong> <%= selectedOrder.getOrderId() %></p>
        <p><strong>Customer Name:</strong> <%= selectedOrder.getCustomerName() %></p>
        <p><strong>Product:</strong> <%= selectedOrder.getOrderAmount() %></p>
        <p><strong>Status:</strong> <%= selectedOrder.getStatus() %></p>
        <p><strong>User ID:</strong> <%= selectedOrder.getUserId() %></p>
    </div>
<%
    }
%>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
   --%>