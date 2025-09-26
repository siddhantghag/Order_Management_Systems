package com.yash.OrderMangementSystemServlet.service;

import java.util.List;

import com.yash.OrderMangementSystemServlet.pojo.Order;

/**
 * OrderService is a service layer interface that defines business operations
 * related to order management. 
 * Author: Siddhant Pravin Ghag
 */

public interface OrderService {

	/**
	 * Places a new order in the system.
	 * 
	 * @param order the Order object containing order details.
	 */

	public void placeNewOrder(Order order);

	/**
	 * Cancels an existing order based on the provided order ID.
	 * 
	 * @param orderId the ID of the order to be cancelled.
	 * @return a list of remaining orders after cancellation.
	 */

	public List<Order> cancelOrder(int orderId);

	/**
	 * Retrieves all orders from the system.
	 * 
	 * @return a list of all orders.
	 */

	public List<Order> getAllOrder();

	/**
	 * Performs cleanup or shutdown operations related to order management.
	 */

	public void exitOrder();

	/**
	 * Retrieves all orders placed by a specific user.
	 * 
	 * @param userId the ID of the user whose orders are to be fetched.
	 * @return a list of orders placed by the user.
	 */

	public List<Order> getAllOrderByUserId(int userId);
	
	public boolean updateOrder(Order order);
}
