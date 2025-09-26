package com.yash.OrderMangementSystemServlet.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yash.OrderMangementSystemServlet.dao.OrderDao;
import com.yash.OrderMangementSystemServlet.pojo.Order;
import com.yash.OrderMangementSystemServlet.pojo.Product;
import com.yash.OrderMangementSystemServlet.pojo.orderDto;
import com.yash.OrderMangementSystemServlet.util.JdbcUtilConnection;

/**
 * OrderDaoImpl provides the implementation of OrderDao interface. It handles
 * database operations related to orders such as placing, cancelling, retrieving
 * all orders, and retrieving orders by user ID.
 * 
 * Author: Siddhant Ghag
 */
public class OrderDaoImpl extends JdbcUtilConnection implements OrderDao {
	private static final Logger logger = LoggerFactory.getLogger(OrderDaoImpl.class);

	/**
	 * Places a new order in the database.
	 * 
	 * @param order the Order object containing order details.
	 */

	@Override
	public void placeNewOrder(Order order) {
		// String query = "INSERT INTO `ordermangement`.`orders` (`orderId`,
		// `customerName`, `orderAmount`, `status`) VALUES (?,?,?,?)";
		String query = "INSERT INTO ordermangement.orders (customerName, orderAmount, status, userId) VALUES (?,?,?,?)";
		PreparedStatement preparedStatement = super.crePreparedStatement(query);
		try {
			// preparedStatement.setLong(1, order.getOrderId());
			preparedStatement.setString(1, order.getCustomerName());
			preparedStatement.setLong(2, order.getOrderAmount());
			preparedStatement.setString(3, order.getStatus());
			preparedStatement.setInt(4, order.getUserId());
			// preparedStatement.setString(5, order.get);
			preparedStatement.executeUpdate();
			logger.info("SUCESS : User Inserted Sucessfully...!");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closePreparedStatement(preparedStatement);
			super.closeConnection();
		}
	}

	/**
	 * Cancels an order by its ID and returns the updated list of orders.
	 * 
	 * @param orderId the ID of the order to cancel.
	 * @return list of remaining orders after cancellation.
	 */

	/*
	 * @Override public List<Order> cancelOrder(int orderId) { List<Order> orders =
	 * new ArrayList<>(); String query1 =
	 * "DELETE FROM ordermangement.orders WHERE orderId = ?"; PreparedStatement
	 * preparedStatement1 = super.crePreparedStatement(query1);
	 * 
	 * try {
	 * 
	 * // Delete from child tables first preparedStatement1.setInt(1, orderId);
	 * preparedStatement1.executeUpdate();
	 * 
	 * // Now delete the order String query2 =
	 * "DELETE FROM orders WHERE orderId = ?"; PreparedStatement preparedStatement2
	 * = super.crePreparedStatement(query2); preparedStatement1.setInt(1, orderId);
	 * preparedStatement1.executeUpdate();
	 * 
	 * // return fetch all record String fatchAllOrders = "select * from Order";
	 * PreparedStatement preparedStatement =
	 * super.crePreparedStatement(fatchAllOrders); preparedStatement.setInt(1,
	 * orderId); preparedStatement.executeUpdate(); ResultSet rs =
	 * preparedStatement.executeQuery(fatchAllOrders); while (rs.next()) { Order
	 * order = new Order(); order.setOrderId(rs.getInt("orderId"));
	 * order.setCustomerName(rs.getString("customerName"));
	 * order.setOrderAmount(rs.getInt("orderAmount"));
	 * order.setStatus(rs.getString("status"));
	 * order.setUserId(rs.getInt("userId"));
	 * 
	 * orders.add(order); } logger.info("SUCESS : User deleted Sucessfully...!");
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally {
	 * super.closePreparedStatement(preparedStatement1); super.closeConnection(); }
	 * return orders; }
	 */
	@Override
	public List<Order> cancelOrder(int orderId) {
		List<Order> orders = new ArrayList<>();
		String query1 = "DELETE FROM ordermangement.orders WHERE orderId = ?";
		String query2 = "DELETE FROM orders WHERE orderId = ?";
		String fetchAllOrders = "SELECT * FROM orders"; // assuming table name is 'orders'

		PreparedStatement preparedStatement1 = null;
		PreparedStatement preparedStatement2 = null;
		PreparedStatement preparedStatement3 = null;

		try {
			// Delete from child table
			preparedStatement1 = super.crePreparedStatement(query1);
			preparedStatement1.setInt(1, orderId);
			preparedStatement1.executeUpdate();

			// Delete from main table
			preparedStatement2 = super.crePreparedStatement(query2);
			preparedStatement2.setInt(1, orderId);
			preparedStatement2.executeUpdate();

			// Fetch all remaining orders
			preparedStatement3 = super.crePreparedStatement(fetchAllOrders);
			ResultSet rs = preparedStatement3.executeQuery();

			while (rs.next()) {
				Order order = new Order();
				order.setOrderId(rs.getInt("orderId"));
				order.setCustomerName(rs.getString("customerName"));
				order.setOrderAmount(rs.getInt("orderAmount"));
				order.setStatus(rs.getString("status"));
				order.setUserId(rs.getInt("userId"));
				orders.add(order);
			}

			logger.info("SUCCESS: Order deleted successfully.");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closePreparedStatement(preparedStatement1);
			super.closePreparedStatement(preparedStatement2);
			super.closePreparedStatement(preparedStatement3);
			super.closeConnection();
		}

		return orders;
	}

	/**
	 * Retrieves all orders from the database.
	 * 
	 * @return list of all orders.
	 */
	public List<Order> getAllOrder() {
		List<Order> orders = new ArrayList<>();
		String query = "SELECT orderId, customerName, orderAmount, status, userId FROM ordermangement.orders";
		PreparedStatement preparedStatement = super.crePreparedStatement(query);
		try {
			// preparedStatement.setString(1, "orderPlaced");

			ResultSet rs = preparedStatement.executeQuery();

			// boolean hasOrders = false;

			while (rs.next()) {
				Order order = new Order();
				order.setOrderId(rs.getInt("orderId"));
				order.setCustomerName(rs.getString("customerName"));
				order.setOrderAmount(rs.getInt("orderAmount"));
				order.setStatus(rs.getString("status"));
				order.setUserId(rs.getInt("userId"));

				orders.add(order);
			}

			/*
			 * if (!hasOrders) { System.out.println("No any order.....!"); }
			 */

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

	/**
	 * Retrieves all orders placed by a specific user.
	 * 
	 * @param userId the ID of the user.
	 * @return list of orders placed by the user.
	 */

	public List<Order> getAllOrderByUserId(int userId) {
		List<Order> orders = new ArrayList<>();
		String query = "SELECT orderId, customerName, orderAmount, status, userId FROM ordermangement.orders WHERE userId = ?";

		try (PreparedStatement preparedStatement = super.crePreparedStatement(query)) {
			preparedStatement.setInt(1, userId); // ✅ Set the value for parameter 1

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setOrderId(rs.getInt("orderId"));
				order.setCustomerName(rs.getString("customerName"));
				order.setOrderAmount(rs.getInt("orderAmount"));
				order.setStatus(rs.getString("status"));
				order.setUserId(rs.getInt("userId"));

				orders.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orders;
	}

	public Product getProductByOrderId(int orderId)
	{
		Product product = null;
		String query = "SELECT * FROM ordermangement.orders WHERE orderId = ?"; // Example query
		try 
		{
			PreparedStatement preparedStatement = super.crePreparedStatement(query);
			preparedStatement.setInt(1, orderId);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				product = new Product();
				product.setProductName(rs.getString("customerName"));
				product.setProductPrise(rs.getDouble("orderAmount"));
				// Set other fields if needed
			}

		} catch (Exception e) {
			e.printStackTrace();
		} /*
			 * finally { super.closePreparedStatement(preparedStatement);
			 * super.closeConnection(); }
			 */
		return product;
	}

	/**
	 * Performs cleanup or shutdown operations related to order management.
	 */

	@Override
	public void exitOrder() {
		System.out.println("Exiting order.....");
	}

	public List<orderDto> getAllOrderUsername() {
		List<orderDto> orders = new ArrayList<>();
		// String query = "SELECT orderId, customerName, orderAmount, status, userId
		// FROM ordermangement.orders";
		String query = "SELECT a.orderId, a.customerName, a.orderAmount, a.status, a.userId,b.name FROM ordermangement.orders a LEFT OUTER JOIN users b ON a.userId = b.id";
		PreparedStatement preparedStatement = super.crePreparedStatement(query);
		try {
			// preparedStatement.setString(1, "orderPlaced");

			ResultSet rs = preparedStatement.executeQuery();

			// boolean hasOrders = false;

			while (rs.next()) {
				orderDto order = new orderDto();
				order.setOrderId(rs.getInt("orderId"));
				order.setProductName(rs.getString("customerName"));
				order.setOrderAmount(rs.getInt("orderAmount"));
				order.setStatus(rs.getString("status"));
				order.setUserId(rs.getInt("userId"));
				order.setUserName(rs.getString("name"));

				orders.add(order);
			}

			/*
			 * if (!hasOrders) { System.out.println("No any order.....!"); }
			 */

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

	public boolean updateOrder(Order order) {
		boolean result = false;
		String query = "UPDATE ordermangement.orders SET customerName=?, orderAmount=? WHERE orderId=?";

		try {
			PreparedStatement ps = super.crePreparedStatement(query);
			ps.setString(1, order.getCustomerName());
			ps.setInt(2, order.getOrderAmount());
			//ps.setString(3, order.getStatus());
			ps.setInt(3, order.getOrderId());

			int i = ps.executeUpdate();
			result = (i > 0);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
