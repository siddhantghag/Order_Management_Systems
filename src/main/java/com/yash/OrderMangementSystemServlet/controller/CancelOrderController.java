package com.yash.OrderMangementSystemServlet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yash.OrderMangementSystemServlet.service.OrderService;
import com.yash.OrderMangementSystemServlet.serviceimpl.OrderServiceImpl;

/**
 * CancelOrderController is a servlet responsible for handling the cancellation of orders.
 * 
 * -related operations.
 * - OrderServiceImpl: Implementation of OrderService. 
 * Author: Siddhant Ghag
 */
@WebServlet("/CancelOrderController")
public class CancelOrderController extends HttpServlet 
{
	private static final Logger logger = LoggerFactory.getLogger(CancelOrderController.class);
	
	private static final long serialVersionUID = 1L;
       
    private OrderService orderService =null;
    
    public CancelOrderController() {
        super();
        orderService = new OrderServiceImpl();
    }

    /**
     * Handles POST requests to cancel an order.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderIdStr = request.getParameter("orderId");
        logger.info("OrderId -: " + orderIdStr);
        try {
            int orderId = Integer.parseInt(orderIdStr);
            orderService.cancelOrder(orderId);
            response.sendRedirect("orderList.jsp?msg=Order+Cancelled+Successfully");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=Invalid+Order+ID");
        }
    }

}
