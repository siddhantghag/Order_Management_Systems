<%@page import="com.yash.OrderMangementSystemServlet.daoimpl.ProductDaoImpl"%>
<%@page import="com.yash.OrderMangementSystemServlet.pojo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
    String productId = request.getParameter("productId");
    String productName = request.getParameter("productName");

    int productIdInt = Integer.parseInt(productId);
    ProductDaoImpl dao = new ProductDaoImpl();
    int price = dao.getPrise(productIdInt, productName);
%> --%>

<%
    String productId = request.getParameter("productId");
    String productName = request.getParameter("productName");

     int price = 0; // Declare price in outer scope

    if (productId != null && productId.matches("\\d+")) {
        int productIdInt = Integer.parseInt(productId);
        ProductDaoImpl dao = new ProductDaoImpl();
        price = dao.getPrise(productIdInt, productName);
        request.setAttribute("price", price);
    } else {
        // Handle invalid or missing productId
        request.setAttribute("error", "Invalid product ID.");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Place Order</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
        }

        header {
            text-align: center;
           /*  padding: 20px; */
            background-color: #3498db;
            color: white;
            font-size: 14px;
        }

        .container {
            display: flex;
            padding: 20px;
            justify-content: center;
        }

        .main-content {
            width: 70%;
            padding: 20px;
        }

        .sidebar {
            width: 97%;
            padding: 13px;
            background-color: #ecf0f1;
            box-shadow: -2px 0 10px rgba(0,0,0,0.1);
        }

        form {
            width: 30%;
            /* max-width: 420px; */
            margin: auto;
            background-color: #ffffff;
            padding: 24px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
           /*  display: flex;  */
            justify-content: center;
            
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #555;
            font-size: 15px;
        }

        input[type="text"] {
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
    </style>
</head>
<body>

<header>
<%-- <div class="sidebar">
        <jsp:include page="menu_top.jsp" />
    </div> --%>
   <h2>Place New Order</h2>
 </header>

<div class="container">
    <div class="main-content">
      <!-- <h2 style="text-align: center; color: #349;">Place New Order</h2> -->
        <form action="PlaceOrderController" method="post">
            <label>Product ID:</label>
            <input type="text" name="productId" value="<%= productId %>" readonly>

            <label>Product Name:</label>
            <input type="text" name="productName" value="<%= productName %>" readonly>

            <label>Price:</label>
            <input type="text" name="price" value="<%= price %>">

            <input type="submit" value="Place Order">
        </form>
    </div>
</div>

</body>
</html>
 