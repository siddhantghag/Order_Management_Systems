
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
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

        .container {
            max-width: 330px;
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

        form {
            width: 100%;
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
        .back_form
        {
        	padding: 18px;
        }
        
    </style>
</head>
<body>

<header>Add Product</header>

<div class="container" style="margin-top: 20px;">
    <h2>Add Product</h2>
    <form action="addProductServlet" method="post">
        <label for="productId">Product ID:</label>
        <input type="text" id="productId" name="productId" required>

        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" required>

        <label for="productPrice">Product Price:</label>
        <input type="text" id="productPrice" name="productPrice" required>

        <input type="submit" value="Add Product">
    </form>
    <form  class ="back_form" action="showAllProduct.jsp">
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
 