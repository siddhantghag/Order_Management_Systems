package com.yash.OrderMangementSystemServlet.serviceimpl;

import java.util.List;

import com.yash.OrderMangementSystemServlet.dao.OrderDao;
import com.yash.OrderMangementSystemServlet.daoimpl.OrderDaoImpl;
import com.yash.OrderMangementSystemServlet.pojo.Order;
import com.yash.OrderMangementSystemServlet.service.OrderService;
import com.yash.OrderMangementSystemServlet.util.JdbcUtilConnection;

/**
 * OrderServiceImpl provides the implementation of the OrderService interface.
 * It acts as a bridge between the controller layer and the DAO layer, handling
 * business logic related to order operations.
 * 
 * Author: Siddhant Pravin Ghag
 */

public class OrderServiceImpl extends JdbcUtilConnection implements OrderService {

	private OrderDao orderDao;

	public OrderServiceImpl() {
		orderDao = new OrderDaoImpl();
	}

	/**
	 * Places a new order by delegating to the DAO layer.
	 * 
	 * @param order the Order object containing order details.
	 */

	@Override
	public void placeNewOrder(Order order) {
		orderDao.placeNewOrder(order);
	}

	/**
	 * Cancels an order and returns the updated list of orders.
	 * 
	 * @param orderId the ID of the order to cancel.
	 * @return list of remaining orders.
	 */

	@Override
	public List<Order> cancelOrder(int orderId) {
		List<Order> orders = orderDao.cancelOrder(orderId);
		return orders;
	}

	/**
	 * Retrieves all orders from the system.
	 * 
	 * @return list of all orders.
	 */

	@Override
	public List<Order> getAllOrder() {
		List<Order> listOrder = orderDao.getAllOrder();
		return listOrder;
	}

	/**
	 * Performs cleanup or shutdown operations related to order management.
	 */

	@Override
	public void exitOrder() {
		orderDao.exitOrder();
	}

	/**
	 * Retrieves all orders placed by a specific user.
	 * 
	 * @param userId the ID of the user.
	 * @return list of orders placed by the user.
	 */

	@Override
	public List<Order> getAllOrderByUserId(int userId) {
		List<Order> orders = orderDao.getAllOrderByUserId(userId);
		return orders;
	}

	@Override
	public boolean updateOrder(Order order) {

		orderDao.updateOrder(order);
		return true;
	}

}
