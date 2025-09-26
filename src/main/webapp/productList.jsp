<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.yash.OrderMangementSystemServlet.pojo.Product"%>
<%
    List<Product> products = (List<Product>) request.getAttribute("productList");
    Integer currentPageObj = (Integer) request.getAttribute("currentPage");
    Integer totalPagesObj = (Integer) request.getAttribute("totalPages");

    int currentPage = currentPageObj != null ? currentPageObj : 1;
    int totalPages = totalPagesObj != null ? totalPagesObj : 1;

    if (products == null) {
        products = new ArrayList<>();
    }

    if (request.getAttribute("productList") == null) {
        response.sendRedirect("ListOfProductController");
        return;
    }
%>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
        }

        header {
            background-color: #3498db;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 26px;
            font-weight: bold;
        }

        .container {
            max-width: 593px;
            margin: 25px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        a {
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            color: #21618c;
            text-decoration: underline;
        }

        .pagination {
            text-align: center;
            margin-top: 20px;
        }

        .pagination a, .pagination span {
            margin: 0 5px;
            padding: 8px 14px;
            background-color: #007bff;
            color: white;
            border-radius: 4px;
            text-decoration: none;
        }

        .pagination span {
            background-color: #6c757d;
        }

        form {
            text-align: center;
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 40px;
        }

        @media screen and (max-width: 600px) {
            .container {
                padding: 15px;
            }

            th, td {
                font-size: 14px;
                padding: 10px;
            }

            button {
                width: 100%;
            }
        }
    </style>
<!-- <style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f0f8ff;
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
	width: 97%;
	padding: 20px;
}

.sidebar {
	width: 96%;
	padding: 18px;
	background-color: #ecf0f1;
	box-shadow: -2px 0 10px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: #ffffff;
	border-radius: 12px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

th, td {
	padding: 16px;
	border-bottom: 1px solid #eee;
	text-align: center;
}

th {
	background-color: #3498db;
	color: white;
}

tr:hover {
	background-color: #f9f9f9;
}

a {
	color: #3498db;
	text-decoration: none;
	font-weight: bold;
}

a:hover {
	color: #21618c;
	text-decoration: underline;
}

.pagination {
	text-align: center;
	margin-top: 20px;
}

.pagination a, .pagination span {
	margin: 0 5px;
	padding: 8px 12px;
	background-color: #007bff;
	color: white;
	border-radius: 4px;
	text-decoration: none;
}

.pagination span {
	background-color: #6c757d;
}

.print-button, form {
	text-align: center;
	margin-top: 20px;
}

button {
	padding: 10px 20px;
	font-size: 16px;
	background-color: #28a745;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #218838;
}


</style> -->
</head>
<body>

	<header>
		<div class="sidebar">
			<jsp:include page="menu_top.jsp" />
		</div>
	</header>

	<div class="container">
		<div class="main-content">
			<table>
			<h2 style="text-align: center; color: #349;">Product List</h2>
				<tr>
					<th>ID</th>
					<th>Product Name</th>
					<th>Price</th>
				</tr>
				<%
                if (!products.isEmpty()) {
                    for (Product p : products) {
            %>
				<tr>
					<td><%= p.getProductId() %></td>
					<td><a
						href="placeOrder.jsp?productId=<%= p.getProductId() %>&productName=<%= java.net.URLEncoder.encode(p.getProductName(), "UTF-8") %>">
							<%= p.getProductName() %>
					</a></td>
					<td>₹<%= String.format("%.2f", p.getProductPrise()) %></td>
				</tr>
				<%
                    }
                } else {
            %>
				<tr>
					<td colspan="3">No products available.</td>
				</tr>
				<%
                }
            %>
			</table>

			<div class="pagination">
				<%
                if (currentPage > 1) {
            %>
				<a href="ListOfProductController?page=<%= currentPage - 1 %>">Previous</a>
				<%
                }

                for (int i = 1; i <= totalPages; i++) {
                    if (i == currentPage) {
            %>
				<span><%= i %></span>
				<%
                    } else {
            %>
				<a href="ListOfProductController?page=<%= i %>"><%= i %></a>
				<%
                    }
                }

                if (currentPage < totalPages) {
            %>
				<a href="ListOfProductController?page=<%= currentPage + 1 %>">Next</a>
				<%
                }
            %>
			</div>

			<!-- <div class="print-button">
            <button onclick="window.print()">🖨️ Print Product List</button>
        </div> -->

			<form action="welcome.jsp">
				<button type="submit"
					style="background-color: #007BFF; color: white; border: none; padding: 10px 20px; border-radius: 5px;">
					Back</button>
			</form>

		</div>
	</div>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

</body>
</html>
