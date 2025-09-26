<%-- 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f4f4;
        }

        header {
            text-align: center;
            padding: 20px;
            background-color: #3498db;
            color: white;
            font-size: 24px;
        }

        .container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            padding-top: 55px;
        }

        .main-content {
            width: 97%;
            background-color: #fff;
            padding: 48px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .sidebar {
            width: 97%;
            background-color: #ecf0f1;
            padding: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .sucessMsg {
            color: green;
            font-weight: bold;
        }

        .errMsg {
            color: red;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
        }

        button {
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #2980b9;
        }

        a {
            color: #3498db;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
    <div class="sidebar">
           <jsp:include page="menu_top.jsp"></jsp:include>
        </div>
    </header>
	
    <div class="container">
        <div class="main-content">
            <h2>Login Form</h2>
            <span class="sucessMsg">${param.msg}</span>
            <span class="errMsg">${param.err}</span>
            <form action="${pageContext.request.contextPath}/loginController" method="post">
                <table cellpadding="5" cellspacing="3">
                    <tr>
                        <td>LoginName</td>
                        <td><input type="text" name="loginname" /></td>
                    </tr>
                    <tr>
                        <td>Role</td>
                        <td>
                            <select name="rolename">
                            	<option value="select">--select--</option>
                                <option value="admin">admin</option>
                                <option value="user">user</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <a href="regform.jsp">Sign Up</a>
                            <button type="submit">Login</button>
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
 
 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Management System</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f4f4f4;
            color: #333;
        }

        header {
            background-color: #2c3e50;
            /* padding: 10px; */
            color: white;
        }

        .sidebar {
            background-color: #34495e;
            padding: 15px;
            color: white;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }

        .main-content {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .main-content h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        .sucessMsg {
            display: block;
            color: green;
            text-align: center;
            margin-bottom: 10px;
        }

        .errMsg {
            display: block;
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }

        form table {
            width: 100%;
        }

        form td {
            padding: 10px 0;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button[type="submit"] {
            background-color: #2980b9;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #3498db;
        }

        a {
            margin-right: 10px;
            text-decoration: none;
            color: #2980b9;
        }

        a:hover {
            text-decoration: underline;
        }

        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            /* padding: 15px; */
        }
    </style>
</head>
<body>
    <header>
    <div class="sidebar">
           <jsp:include page="menu_top.jsp"></jsp:include>
        </div>
    </header>
	
    <div class="container">
        <div class="main-content">
            <h2>Login Form</h2>
            <span class="sucessMsg">${param.msg}</span>
            <span class="errMsg">${param.err}</span>
            <form action="${pageContext.request.contextPath}/loginController" method="post">
                <table cellpadding="5" cellspacing="3">
                    <tr>
                        <td>LoginName</td>
                        <td><input type="text" name="loginname" /></td>
                    </tr>
                    <tr>
                        <td>Role</td>
                        <td>
                            <select name="rolename">
                            	<option value="select">--select--</option>
                                <option value="admin">admin</option>
                                <option value="user">user</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <a href="regform.jsp">Sign Up</a>
                            <button type="submit">Login</button>
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