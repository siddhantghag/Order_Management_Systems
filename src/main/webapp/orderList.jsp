<%@page
	import="com.yash.OrderMangementSystemServlet.serviceimpl.OrderServiceImpl"%>
<%@page
	import="java.util.*, com.yash.OrderMangementSystemServlet.pojo.Order"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%
    int userId  = (int) request.getSession().getAttribute("userId");
    OrderServiceImpl orderServiceImpl = new OrderServiceImpl();
    List<Order> orders = orderServiceImpl.getAllOrderByUserId(userId);
    request.setAttribute("orderList", orders);
%> --%>

<%
Integer userIdObj = (Integer) request.getSession().getAttribute("userId");
if (userIdObj != null) {
	int userId = userIdObj;
	OrderServiceImpl orderServiceImpl = new OrderServiceImpl();
	List<Order> orders = orderServiceImpl.getAllOrderByUserId(userId);
	request.setAttribute("orderList", orders);
} else {
	// Handle the case where userId is not in session
	response.sendRedirect("login.jsp"); // or show an error message
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f0f8ff;
}

header {
	text-align: center;
	/* padding: 20px; */
	background-color: #3498db;
	color: white;
	font-size: 28px;
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
	width: 100%;
	padding: 9px;
	background-color: #ecf0f1;
	box-shadow: -2px 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #2c3e50;
	margin-bottom: 20px;
	font-size: 26px;
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: #ffffff;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
	border-radius: 12px;
	overflow: hidden;
}

th, td {
	padding: 14px 18px;
	border-bottom: 1px solid #eee;
	text-align: center;
	font-size: 15px;
}

th {
	background-color: #3498db;
	color: white;
	font-weight: 600;
}

tr:hover {
	background-color: #f9f9f9;
}

td {
	color: #555;
}

button {
	background-color: #e74c3c;
	color: white;
	padding: 8px 14px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-weight: bold;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #c0392b;
}

form {
	padding-left: 43px;
}
</style>
</head>
<body>

	<header>
		<div class="sidebar">
			<jsp:include page="menu_top.jsp" />
		</div>
	</header>

	<div class="container">
		<div class="main-content">
			<h2>Order List</h2>
			<table>
				<tr>
					<th>Sr#</th>
					<th>Order ID</th>
					<th>Customer Name</th>
					<th>Order Amount</th>
					<th>Status</th>
					<th>Action Delete</th>
					<th>Action Edit</th>
				</tr>
				<c:forEach items="${orderList}" var="order" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${order.orderId}</td>
						<td>${order.customerName}</td>
						<td>${order.orderAmount}</td>
						<td>${order.status}</td>
						<td>
							<form action="CancelOrderController" method="post"
								style="margin: 0;">
								<input type="hidden" name="orderId" value="${order.orderId}" />

								<input type="hidden" name="customerName"
									value="${order.customerName}" />
								<%-- <input type="hidden" name="productId" value="${order.productId}" /> --%>
								<input type="hidden" name="orderAmount"
									value="${order.orderAmount}" />

								<button type="submit"
									onclick="return confirm('Are you sure you want to delete this order?');">
									Delete Order</button>

							</form>
						</td>
						<td>
							<%-- <form action="OrderEditController" method="post"
								style="margin: 0;">
								<input type="hidden" name="orderId" value="${order.orderId}" />
								<button type="submit">Edit Order</button>
							</form> --%>

							<a href="${pageContext.request.contextPath}/editOrder.jsp?orderId=${order.orderId}">Edit Order</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</die page="footer.jsp" />
	</footer>

</body>
</html>
