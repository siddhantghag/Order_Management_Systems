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
 * GetAllOrderByUserIdController is a servlet responsible for retrieving all orders.
 */
@WebServlet("/GetAllOrderByUserIdController")
public class GetAllOrderByUserIdController extends HttpServlet 
{
	private static final Logger logger = LoggerFactory.getLogger(GetAllOrderByUserIdController.class);
	
	private static final long serialVersionUID = 1L;
       
	private OrderService orderService = null;
	
	
	public GetAllOrderByUserIdController() {
		super();
		orderService = new OrderServiceImpl();
	}



    /**
     * Handles both GET and POST requests to retrieve all orders for the logged-in user.
     */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int userId  = (int) request.getSession().getAttribute("userId");
		logger.info("userId -: " + userId);
		
		// Call the method to fetch and print orders
		List<Order> orders =orderService.getAllOrderByUserId(userId);
		
		//Prepare list of contact , preserve it in request object
		request.setAttribute("orderList", orders);
		
		//redirect on listContact.jsp page
		request.getRequestDispatcher("orderList.jsp").forward(request, response);
		
	}
}
