# Order_Management_Systems

📦 Order Management System
This project demonstrates how to build a simple Order Management System using Core Java, Servlets, JSP, and MySQL. It allows users to manage products, place orders, and view order history through a web interface.

🔧 Technologies Used
Core Java
Servlets
JSP (JavaServer Pages)
MySQL Database
JDBC (Java Database Connectivity)
HTML/CSS (for UI)

1. Project Overview
The Order Management System (OMS) manages User, their Orders, and Products.
The system supports User (Customer).
•	Customer: logs in, views available products, places orders with selected products.
2. Objectives
•	Introduce Product manage items that can be ordered.
•	Maintain 1-to-1 mapping of User < > Order
•	Orders reference Product(s) instead of only storing raw amounts.
•	Ensure session-based authentication and role-based access control.
3. Functional Requirements
•	Authentication
o	Login & session handling for Users.
o	Role-based redirection.
•	User/Customer
o	Register as User.
o	Browse product catalog.
o	Place an order by selecting product(s) and quantity.
o	View/cancel their orders.
•	Admin
o	Manage (CRUD) Users.
o	Manage (CRUD) products.
o	View all User and all orders.
•	Order Management
o	Each Order has: orderId, customerName productId(s), quantity, totalAmount, status.
o	Orders update stock (if inventory tracking is enabled).
4. Non-Functional Requirements
•	Web-based interface using Servlet + JSP.
•	Session management with cookies.
•	Database persistence (MySQL).
•	Scalability for adding more modules later.
5. Actors
•	User
6. Business Rules
•	A Customer must be linked to a User account.
•	An Order must have at least one Product.
•	Only Admins can add /delete Products.
•	Customers can only browse products and place/cancel their own orders.
SRS (Software Requirements Specification) for OMS with Product Module
1. Introduction
•	Scope: Admins manage User and products; User place orders based on products.
•	Audience: Developers, testers, and stakeholders.
2. Functional Requirements
•	Login/Authentication Module
o	Validates credentials against User table.
o	Redirects based on role (Admin → Admin dashboard, User→ User dashboard).
•	User Module
o	CRUD operations (Admin only).
o	Mapping to User entity (1:1).
•	Product Module
o	Admin can: add, edit, delete products (productId, name, description, price, stock).
o	Customers can: view product list.
•	Order Module
o	Place order: select product(s) + quantity → calculates total amount.
o	Cancel order: allowed until shipped (status = CANCELLED).
o	View orders (Admin sees all, Customer sees own).
3. Data Model (Entities & Relationships)
•	User (user_id, username, password, role)
•	Product (product_id, name, description, price, stock)
•	Order (order_id, customer_id [FK], order_date, status, total_amount)
4. Non-Functional Requirements
•	Performance: Optimized queries for orders/products.
•	Usability: Simple JSP UI for admin and users.
•	Maintainability: Modular DAO/Service/Controller packages.
