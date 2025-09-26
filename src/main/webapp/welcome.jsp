<%-- <%@page import="org.apache.tomcat.util.http.parser.HttpHeaderParser.HeaderParsePosition"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
</head>

<body>
	<table border="1" width="80%" align="center">
		<tr>
			<td><h2>Welcome to my CMS App</h2></td>
		</tr>
		<tr>
			<td height="20">
			<jsp:include page="menu_top.jsp"></jsp:include>
			</td>
			<td> <a href="productList.jsp" class="nav-link">Products</a>
			  <a href="orderList.jsp" class="nav-link">My Orders</a></td>
		</tr>
		<tr>
			<td height="400" valign="top">
				<h2>Welcome Page</h2>
				<h1>Welcome : <%= session.getAttribute("userName") %></h1>
			</td>
		</tr>
		<tr>
			<td><jsp:include page="footer.jsp"></jsp:include></td>
		</tr>
	</table>
</body>
</html> --%>

<%-- <%@ page import="org.apache.tomcat.util.http.parser.HttpHeaderParser.HeaderParsePosition" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #3498db;
            color: white;
            font-size: 24px;
        }

        .container {
            display: flex;
            justify-content: center;
            padding: 20px;
            padding-top: 55px;
        }

        .main-content {
            width: 97%;
            background-color: #fff;
            padding: 48px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .nav-link {
            margin-right: 15px;
            text-decoration: none;
        }

        .nav-link:hover {
            text-decoration: underline;
        }

        table {
            width: 100%;
        }

        h2, h1 {
            margin: 10px 0;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="main-content">
            <jsp:include page="menu_top.jsp" />
            <div>
              
            </div>
            <h1>Welcome : <%= session.getAttribute("userName") %></h1>
        </div>
    </div>
	
    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</body>
</html> --%>

<body>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .main-content {
            text-align: center;
        }

        h1 {
            color: #2c3e50;
            margin-top: 20px;
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
                padding: 20px;
                margin: 20px;
            }

            h1 {
                font-size: 20px;
            }
        }
    </style>

    <div class="container">
        <div class="main-content">
            <jsp:include page="menu_top.jsp" />
            <h1>Welcome : <%= session.getAttribute("userName") %></h1>
        </div>
    </div>

    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</body>