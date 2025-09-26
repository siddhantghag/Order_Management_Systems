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
            padding: 0;
        }

        header {
            background-color: #3498db;
            color: white;
            /* padding: 20px; */
            text-align: center;
            font-size: 28px;
        }

        nav {
            background-color: #2980b9;
           -content: center;
            padding: 10px 0;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            font-size: 16px;
            padding: 8px 16px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        nav a:hover {
            background-color: #1f6391;
        }

        .container {
            max-width: 500px;
            margin: 40px auto;
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

<nav>
     <a href="showAllProduct.jsp" class="nav-link">Products</a>
      <a href="showAllOrder.jsp" class="nav-link">Orders</a>
      <a href="logout.jsp" class="nav-link">Logout</a>
</nav>

<div class="container">
    <h2>Welcome to Admin Dashboard</h2>
    <!-- You can keep additional content here if needed -->
</div>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>