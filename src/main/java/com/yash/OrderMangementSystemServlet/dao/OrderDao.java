package com.yash.OrderMangementSystemServlet.dao;

import java.util.List;

import com.yash.OrderMangementSystemServlet.pojo.Order;
import com.yash.OrderMangementSystemServlet.pojo.Product;


/**
 * OrderDao is a Data Access Object interface that defines methods for performing
 * CRUD operations related to orders in the system.
 * Author: Siddhant Ghag
 */
public interface OrderDao 
{
	public void placeNewOrder(Order order);
	public List<Order> cancelOrder(int orderId);
	public List<Order> getAllOrder();
	public void exitOrder();
	public List<Order> getAllOrderByUserId(int userId);
	public boolean updateOrder(Order order);
	public Product getProductByOrderId(int orderId);
}
