<%@page
	import="org.apache.tomcat.util.http.parser.HttpHeaderParser.HeaderParsePosition"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(to right, #74ebd5, #9face6);
    margin: 0;
    padding: 40px;
}

h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 30px;
    font-size: 26px;
}

table {
    width: 500px;
    margin: auto;
    background-color: #ffffff;
    border-collapse: collapse;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    border-radius: 12px;
    overflow: hidden;
}

td {
    padding: 14px 18px;
    border-bottom: 1px solid #eee;
    font-size: 15px;
    color: #555;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 6px;
    box-sizing: border-box;
    font-size: 14px;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
}

button[type="submit"] {
    padding: 10px 20px;
    background: linear-gradient(to right, #00b09b, #96c93d);
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    font-weight: bold;
    transition: background 0.3s ease;
}

button[type="submit"]:hover {
    background: linear-gradient(to right, #96c93d, #00b09b);
}
</style>

</head>

<body>
	<table border="1" width="40%" align="center">
		<tr>
			<td align="center"><h2>Welcome To Order Management System</h2></td>
		</tr>
		<%-- <tr>
			<td height="20"></td>
			<!-- Top Navigation -->
			<jsp:include page="menu_top.jsp"></jsp:include>
		</tr> --%>
		<%-- <tr>
			<td height="400" valign="top">
				<h2>Welcome Page</h2>
				<h1>
					Welcome :
					<%=session.getAttribute("userName")%></h1>
			</td>
		</tr> --%>
		<tr>
			<td height="350" align="center">
				<h2>Registration Form</h2>
				<form action="UserRegistrationController" method="post">
					<table border="1" cellpadding="5" cellspacing="3">
						<tr>
							<td>Name</td>
							<td><input type="text" name="name" /></td>
						</tr>
						<tr>
							<td>Phone</td>
							<td><input type="text" name="phone" /></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input type="text" name="email" /></td>
						</tr>
						<tr>
							<td>Address</td>
							<td><input type="text" name="address" /></td>
						</tr>
						<tr>
							<td>LoginName</td>
							<td><input type="text" name="loginname" /></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="password" name="password" /></td>
						</tr>
						<tr>
							<td colspan="2" align="right">
						    <button type="submit">Save User</button></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<!-- Footer Area --> <jsp:include page="footer.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>