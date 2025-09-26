package com.yash.OrderMangementSystemServlet.pojo;

/**
 * Declare the properties order id , customer Name , order Amount , status.
 * @author siddhant.ghag 
 */
public class Order 
{
	/**
	 *  The unique identifier for the product.
	 */
	private int orderId; 
	
	/**
	 * The name of the customer.
	 */
	private String customerName;
	
	/**
	 *  This a order amount
	 */
	private int orderAmount;
	
	/**
	 *  Check the status
	 */
	private String status;
	

    private int userId;


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public String getCustomerName() {
		return customerName;
	}


	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}


	public int getOrderAmount() {
		return orderAmount;
	}


	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", customerName=" + customerName + ", orderAmount=" + orderAmount
				+ ", status=" + status + ", userId=" + userId + "]";
	} 
}

