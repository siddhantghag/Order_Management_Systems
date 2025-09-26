<%-- <%@page import="org.apache.tomcat.util.http.parser.HttpHeaderParser.HeaderParsePosition"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration Form</title>
     <script>
        function validateForm() {
            const form = document.forms[0];
            const phone = form["phone"].value;
            const password = form["password"].value;

            if (!/^\d{10}$/.test(phone)) {
                alert("Phone number must be exactly 10 digits.");
                return false;
            }

            if (password.length < 6) {
                alert("Password must be at least 6 characters long.");
                return false;
            }

            return true;
        }
    </script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: -72px;
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
            /* padding: 20px; */
                justify-content: center;
        }

        .main-content {
           %;
            padding: 20px;
        }

        .sidebar {
            width: 97%;
            padding: 13px;
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

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 14px 18px;
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
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
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
        <h2>Registration Form</h2>
       <form action="UserRegistrationController" method="post" onsubmit="return validateForm()">
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" required /></td>
            </tr>
            <tr>
                <td>Phone</td>
                <td><input type="text" name="phone" pattern="\d{10}" title="Enter a 10-digit phone number" required /></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="email" required /></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><input type="text" name="address" required /></td>
            </tr>
                 <td>LoginName</td>
                <td><input type="text" name="loginname" required /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password" minlength="6" required /></td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <button type="submit">Save User</button>
                </td>
            </tr>
        </table>
    </form>
    </div>
</div>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
 --%>
 
<%@page import="org.apache.tomcat.util.http.parser.HttpHeaderParser.HeaderParsePosition"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration Form</title>
     <script>
        function validateForm() {
            const form = document.forms[0];
            const phone = form["phone"].value;
            const password = form["password"].value;

            if (!/^\d{10}$/.test(phone)) {
                alert("Phone number must be exactly 10 digits.");
                return false;
            }

            if (password.length < 6) {
                alert("Password must be at least 6 characters long.");
                return false;
            }

            return true;
        }
    </script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: -72px;
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
           /*  padding: 20px; */
           justify-content: center;
        }

        .main-content {
           %;
            padding: 20px;
        }

        .sidebar {
            width: 97%;
            padding: 13px;
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

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 14px 18px;
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
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
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
        <h2>Registration Form</h2>
       <form action="UserRegistrationController" method="post" onsubmit="return validateForm()">
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" required /></td>
            </tr>
            <tr>
                <td>Phone</td>
                <td><input type="text" name="phone" pattern="\d{10}" title="Enter a 10-digit phone number" required /></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="email" required /></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><input type="text" name="address" required /></td>
            </tr>
            <tr>
                 <td>LoginName</td>
                <td><input type="text" name="loginname" required /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password" minlength="6" required /></td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <button type="submit">Save User</button>
                </td>
            </tr>
        </table>
    </form>
    </div>
</div>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
 