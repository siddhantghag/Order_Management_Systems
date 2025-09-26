package com.yash.OrderMangementSystemServlet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yash.OrderMangementSystemServlet.pojo.Order;
import com.yash.OrderMangementSystemServlet.pojo.Product;
import com.yash.OrderMangementSystemServlet.service.OrderService;
import com.yash.OrderMangementSystemServlet.serviceimpl.OrderServiceImpl;


/**
 * PlaceOrderController is a servlet responsible for handling the placement of new orders.
 * Author: Siddhant Ghag
 */

@WebServlet("/PlaceOrderController")
public class PlaceOrderController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	private static final Logger logger = LoggerFactory.getLogger(PlaceOrderController.class);
	
	private OrderService orderService = null;

	public PlaceOrderController() {
		super();
		orderService = new OrderServiceImpl();
	}
	
	/**
     * Handles POST requests to place a new order.
     */

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Read the form data
		// Prepare the model object

		Order order = new Order();
		int loggedUserId = (int)request.getSession().getAttribute("userId");
		order.setCustomerName(request.getParameter("productName"));
		order.setOrderId(Integer.parseInt(request.getParameter("productId")));

        String priceStr = request.getParameter("price");
        int  price = Integer.parseInt(priceStr);
        order.setOrderAmount(price);
		//order.setOrderAmount(Integer.parseInt(request.getParameter("productPrise")));
		order.setStatus("OrderPlace");
		order.setUserId(loggedUserId);
		System.out.println("Place order -: " + order);
		// Share with service and redirect
		orderService.placeNewOrder(order);
		
		// Redirecting
		response.sendRedirect("orderList.jsp");
		try {
			// need to share the contactmodel with service
			// redirect to listContact.jsp page with success message
		} catch (Exception e) {
			// in case of exception redirect on contact paga with error message).
		}
	}
}