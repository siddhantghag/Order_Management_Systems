
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userName = (String) session.getAttribute("userName");
%>
<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 40px;
            color: #2c3e50;
        }

        header {
            text-align: center;
            padding: 20px;
            background-color: #3498db;
            color: white;
            font-size: 28px;
        }

        h2, h3 {
            color: #3498db;
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
        }

        p {
            font-size: 16px;
            line-height: 1.6;
            text-align: center;
            margin-bottom: 30px;
            background-color: #ffffff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        ul {
            max-width: 800px;
            margin: auto;
            padding-left: 20px;
            font-size: 15px;
            line-height: 1.8;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            padding: 20px;
        }

        li {
            margin-bottom: 10px;
            color: #555;
        }
    </style>
</head>
<body>

<header>About Our Order Management System</header>

<p>Welcome<% if (userName != null) { %>, <%= userName %><% } %>!</p>
<p>This system helps manage products and orders efficiently using JSP and Servlets.</p>

<h3>Key Features</h3>
<ul>
    <li>User Registration and Login: Secure authentication for customers and admins.</li>
    <li>Product Catalog: Browse and manage products with detailed info.</li>
    <li>Place Orders: Customers can order products directly from the catalog.</li>
    <li>Order History: Users can view and track their past orders.</li>
    <li>Admin Panel: Admins can manage products, users, and orders.</li>
    <li>Session Management: Personalized experience based on login status.</li>
</ul>

<h3>Technologies Used</h3>
<ul>
    <li>Java (JSP and Servlets)</li>
    <li>HTML, CSS for frontend</li>
    <li>JDBC for database connectivity</li>
    <li>MySQL for data storage</li>
    <li>Apache Tomcat as the web server</li>
</ul>

<h3>User Roles</h3>
<ul>
    <li>Guest: Can view products and public pages.</li>
    <li>Registered User: Can place orders and view history.</li>
    <li>Administrator: Full access to manage everything.</li>
</ul>

<h3>Benefits</h3>
<ul>
    <li>Efficient order processing</li>
    <li>Centralized management</li>
    <li>Enhanced customer experience</li>
    <li>Scalable and secure architecture</li>
</ul>
</body>
</html>
 