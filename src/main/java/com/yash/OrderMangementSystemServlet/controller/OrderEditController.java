
package com.yash.OrderMangementSystemServlet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yash.OrderMangementSystemServlet.dao.OrderDao;
import com.yash.OrderMangementSystemServlet.daoimpl.OrderDaoImpl;
import com.yash.OrderMangementSystemServlet.pojo.Order;
import com.yash.OrderMangementSystemServlet.pojo.Product;


@WebServlet("/OrderEditController")
public class OrderEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderDao dao;

    public OrderEditController() {
        super();
        dao = new OrderDaoImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        	Order order = new Order();
            int orderId = Integer.parseInt(req.getParameter("orderId"));
            String pname = req.getParameter("productName");
            int price = (int) Double.parseDouble(req.getParameter("orderAmount"));

            System.out.println("Order ID: " + orderId);
            System.out.println("Product Name: " + pname);
            System.out.println("Product Price: " + price);

            
            order.setCustomerName(pname);
            order.setOrderAmount(price);
            order.setOrderId(orderId);
             
            dao.updateOrder(order);
            
            req.getRequestDispatcher("orderList.jsp").forward(req, resp);
           
            // Proceed with update logic...
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // You can keep this for form submissions
    }
}
            
          
