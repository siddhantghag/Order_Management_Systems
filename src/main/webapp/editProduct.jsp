
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.yash.OrderMangementSystemServlet.serviceimpl.ProductServiceImpl"%>
<%@ page
	import="com.yash.OrderMangementSystemServlet.service.ProductService"%>
<%@ page
	import="java.util.*, com.yash.OrderMangementSystemServlet.pojo.Product"%>

<%
	ProductServiceImpl impl = new ProductServiceImpl();
	List<Product> productList = impl.getAllProduct();
	
	String selectedProductId = request.getParameter("selectedProductId");
	Product selectedProduct = null;
	
	if (selectedProductId != null) {
		for (Product product : productList) {
			if (String.valueOf(product.getProductId()).equals(selectedProductId)) {
		selectedProduct = product;
		break;
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f0f8ff;
	margin: 0;
	/* padding: 40px; */
}

header {
	text-align: center;
	padding: 1px;
	background-color: #3498db;
	color: white;
	font-size: 16px;
}

.container {
	display: flex;
	padding: 20px;
}

.main-content {
	width: 102%;
	/* padding: 20px; */
	/* display: flex;
	justify-content: center; */
}

.sidebar {
	padding: 11px;
	background-color: #ecf0f1;
	box-shadow: -2px 0 10px rgba(0, 0, 0, 0.1);
}

h2, h3 {
	text-align: center;
	color: #2c3e50;
	margin-bottom: 30px;
}

form {
	width: 100%;
	max-width: 370px;
	margin: auto;
	background-color: #ffffff;
	padding: 10px;
	border-radius: 12px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: 600;
	color: #555;
}

input[type="text"], select {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 6px;
	box-sizing: border-box;
	font-size: 14px;
}

input[type="submit"], button {
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

input[type="submit"]:hover, button:hover {
	background-color: #2980b9;
}

footer {
	margin-top: 60px;
	text-align: center;
}
.back_form
{
	width: 69px;
	padding: 0px
}

</style>
</head>
<body>

	<header>
		Product Management System
		 <div class="sidebar">
			<jsp:include page="menu_top.jsp" />
		</div>  
		<!--  <a href="logout.jsp" class="nav-link">Logout</a>  -->
	</header>

	<div class="container">
		<div class="main-content">
			<h3>Select a Product</h3>
			<form method="get">
				<select name="selectedProductId">
					<option value="">-- Select Product --</option>
					<%
					for (Product product : productList) {
					%>
					<option value="<%=product.getProductId()%>"
						<%=(selectedProductId != null && selectedProductId.equals(String.valueOf(product.getProductId()))) ? "selected"
		: ""%>>
						<%=product.getProductName()%> - ₹<%=product.getProductPrise()%>
					</option>
					<%
					}
					%>
				</select>
				<button type="submit">Show Details</button>
			</form>

			<%
			if (selectedProduct != null) {
			%>
			<h2>Edit Product</h2>
			<form action="updateProductServlet" method="post">
				<input type="hidden" name="productId"
					value="<%=selectedProduct.getProductId()%>"> <label
					for="productName">Product Name:</label> <input type="text"
					name="productName" value="<%=selectedProduct.getProductName()%>"
					required> <label for="productPrice">Product Price:</label>
				<input type="text" name="productPrice"
					value="<%=selectedProduct.getProductPrise()%>" required> <input
					type="submit" value="Update Product">
			</form>
			<%
			}
			%>
		</div>
	</div>
	<form  class ="back_form" action="showAllProduct.jsp">
				<button type="submit"
					style="background-color: #007BFF; color: white; border: none; padding: 10px 20px; border-radius: 5px; ">
					Back</button>
			</form>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

</body>
</html>










<%-- 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
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
            display: flex;
            padding: 20px;
        }

        .main-content {
            width: 70%;
            padding: 20px;
        }

        .sidebar {
                       padding: 20px;
            background-color: #ecf0f1;
            box-shadow: -2px 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 26px;
        }

        form {
            width: 100%;
            max-width: 500px;
            margin: auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
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

<header><div class="sidebar">
        <jsp:include page="menu_top.jsp" />
    </div></header>

<div class="container">
    <div class="main-content">
    <h2>Edit Product</h2>
        <form action="updateProductServlet" method="post">
            <label for="productId">Product ID:</label>
            <input type="text" id="productId" name="productId" value="${product.productId}" required>

            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" value="${product.productName}" required>

            <label for="productPrice">Product Price:</label>
            <input type="text" id="productPrice" name="productPrice" value="${product.productPrice}" required>

            <input type="submit" value="Update Product">
        </form>
    </div>
</div>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
  --%>
