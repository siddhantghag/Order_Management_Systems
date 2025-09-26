<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
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

        .container {
            max-width: 500px;
            margin: auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 26px;
        }

        .form-button {
            display: block;
            width: 100%;
            margin: 10px 0;
            padding: 12px;
            font-size: 16px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .form-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<header>Admin Panel</header>

<div class="container">
    <h2>Admin Dashboard</h2>

    <form action="addProduct.jsp" method="post">
        <button class="form-button">Add Product</button>
    </form>

    <form action="editProduct.jsp" method="post">
        <button class="form-button">Edit Product</button>
    </form>

    <!-- <form action="productList.jsp" method="get">
        <button class="form-button">Show All Products</button>
    </form> -->
    <form action="showAllProduct.jsp" method="get">
        <button class="form-button">Show All Products</button>
    </form>
    
    <form action="showAllOrder.jsp" method="get">
        <button class="form-button">Show All Order</button>
    </form>
    <form action="index.jsp">
				<button type="submit"
					style="background-color: #007BFF; color: white; border: none; padding: 10px 20px; border-radius: 5px; ">
					Back</button>
   </form>
</div>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
   --%>