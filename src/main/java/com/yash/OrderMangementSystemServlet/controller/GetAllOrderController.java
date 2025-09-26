package com.yash.OrderMangementSystemServlet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yash.OrderMangementSystemServlet.pojo.Order;
import com.yash.OrderMangementSystemServlet.service.OrderService;
import com.yash.OrderMangementSystemServlet.serviceimpl.OrderServiceImpl;


/**
 * GetAllOrderController is a servlet responsible for retrieving all orders
 * from the system regardless of user. 
 */

@WebServlet("/GetAllOrderController")
public class GetAllOrderController extends HttpServlet 
{
	private static final Logger logger = LoggerFactory.getLogger(GetAllOrderController.class);
	
	private static final long serialVersionUID = 1L;

	private OrderService orderService = null;

	public GetAllOrderController() {
		super();
		orderService = new OrderServiceImpl();
	}
	/**
     * Handles both GET and POST requests to retrieve all orders in the system.
     */
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		// Call the method to fetch and print orders
		List<Order> orders =orderService.getAllOrder();

        logger.info("Processing GET request");
        logger.debug("Request parameters: {}", request.getParameterMap());
        logger.error("An error occurred", new Exception("Sample exception"));

		//Prepare list of contact , preserve it in request object
		request.setAttribute("orderList", orders);
		
		//redirect on listContact.jsp page
		request.getRequestDispatcher("orderList.jsp").forward(request, response);
		
	}

}
