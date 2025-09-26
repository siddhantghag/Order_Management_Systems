<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .gradient-banner {
        text-align: center;
        font-size: 22px;
        font-weight: 600;
        color: #ffffff;
        padding: 20px;
        margin: 0 auto 20px;
        max-width: 100%;
        background: linear-gradient(to right, #3498db, #2980b9);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        border-bottom: 2px solid #21618c;
    }

    .nav-container {
        display: flex;
        justify-content: flex-end;
        flex-wrap: wrap;
        gap: 15px;
        padding: 10px 20px;
        background-color: #ecf0f1;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
    }

    .nav-link {
        text-decoration: none;
        color: white;
        background-color: #3498db;
        padding: 10px 18px;
        border-radius: 6px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        font-size: 16px;
        font-weight: 500;
        transition: background-color 0.3s ease;
    }

    .nav-link:hover {
        background-color: #21618c;
        color: #ffffff;
    }

    @media screen and (max-width: 600px) {
        .gradient-banner {
            font-size: 18px;
            padding: 15px;
        }

        .nav-container {
            justify-content: center;
            padding: 10px;
        }

        .nav-link {
            font-size: 14px;
            padding: 8px 14px;
        }
    }
</style>

<div class="gradient-banner">
    <h2>Welcome To Order Management System</h2>
</div>

<div class="nav-container">
    <c:if test="${sessionScope.userId != null}">
        <a href="logout.jsp" class="nav-link logout-link">LOGOUT</a>
        <a href="productList.jsp" class="nav-link">Products</a>
			  <a href="orderList.jsp" class="nav-link">Orders</a>
     
    </c:if>

    <c:if test="${sessionScope.userId == null}">
        <a href="regform.jsp" class="nav-link">REGISTRATION</a>
        <a href="about.jsp" class="nav-link">ABOUT</a>
        <a href="adminLogin.jsp" class="nav-link">ADMIN</a>
    </c:if>
</div>

 --%>
 
<%--  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .gradient-banner {
        text-align: center;
        font-size: 16px; 
        font-weight: 500;
        color: #fff;
        padding: 10px;
        margin: 0 auto 10px;
        background: linear-gradient(to right, #3498db, #2980b9);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
        border-bottom: 1px solid #21618c;
    }

    .nav-container {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 6px;
        padding: 8px 10px;
        background-color: #ecf0f1;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.04);
    }

    .nav-link {
        text-decoration: none;
        color: white;
        background-color: #3498db;
        padding: 6px 10px;
        border-radius: 4px;
        font-size: 13px;
        font-weight: 500;
        transition: background-color 0.2s ease;
    }

    .nav-link:hover {
        background-color: #21618c;
        color: #fff;
    }

    @media screen and (max-width: 600px) {
        .gradient-banner {
            font-size: 14px;
            padding: 8px;
        }

        .nav-container {
            flex-direction: column;
            align-items: center;
            padding: 6px;
        }

        .nav-link {
            font-size: 12px;
            padding: 6px 10px;
            width: 100%;
            text-align: center;
        }
    }
</style>

<div class="gradient-banner">
    <h2>Welcome To Order Management System</h2>
</div>

<div class="nav-container">
    <c:if test="${sessionScope.userId != null}">
        <a href="logout.jsp" class="nav-link logout-link">LOGOUT</a>
        <a href="productList.jsp" class="nav-link">Products</a>
			  <a href="orderList.jsp" class="nav-link">Orders</a>
     
    </c:if>

    <c:if test="${sessionScope.userId == null}">
        <a href="regform.jsp" class="nav-link">REGISTRATION</a>
        <a href="about.jsp" class="nav-link">ABOUT</a>
        <!-- <a href="adminLogin.jsp" class="nav-link">ADMIN</a> -->
    </c:if>
</div> --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .gradient-banner {
        text-align: center;
        font-size: 15px;
        font-weight: 500;
        color: #fff;
        padding: 6px 10px;
        margin-bottom: 8px;
        background: linear-gradient(to right, #3498db, #2980b9);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.06);
        border-bottom: 1px solid #21618c;
    }

    .gradient-banner h2 {
        margin: 0;
        font-size: 18px;
    }

    .nav-container {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 5px;
        padding: 6px 10px;
        background-color: #ecf0f1;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.03);
    }

    .nav-link {
        text-decoration: none;
        color: white;
        background-color: #3498db;
        padding: 5px 8px;
        border-radius: 3px;
        font-size: 12px;
        font-weight: 500;
        transition: background-color 0.2s ease;
    }

    .nav-link:hover {
        background-color: #21618c;
    }

    @media screen and (max-width: 600px) {
        .gradient-banner {
            font-size: 13px;
            padding: 5px;
        }

        .gradient-banner h2 {
            font-size: 16px;
        }

        .nav-container {
            flex-direction: column;
            align-items: center;
            padding: 5px;
        }

        .nav-link {
            font-size: 11px;
            padding: 5px 8px;
            width: 100%;
            text-align: center;
        }
    }
</style>

<div class="gradient-banner">
    <h2>Welcome To Order Management System</h2>
</div>

<div class="nav-container">
    <c:if test="${sessionScope.userId != null}">
        <a href="logout.jsp" class="nav-link logout-link">LOGOUT</a>
        <a href="productList.jsp" class="nav-link">Products</a>
			  <a href="orderList.jsp" class="nav-link">Orders</a>
     
    </c:if>

    <c:if test="${sessionScope.userId == null}">
        <a href="regform.jsp" class="nav-link">REGISTRATION</a>
        <a href="about.jsp" class="nav-link">ABOUT</a>
        <!-- <a href="adminLogin.jsp" class="nav-link">ADMIN</a> -->
    </c:if>
</div>