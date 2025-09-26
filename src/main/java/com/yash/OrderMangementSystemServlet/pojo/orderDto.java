package com.yash.OrderMangementSystemServlet.pojo;

public class orderDto 
{
	/**
	 *  The unique identifier for the product.
	 */
	private int orderId; 
	
	/**
	 * The name of the customer.
	 */
	private String productName;
	
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 *  This a order amount
	 */
	private int orderAmount;
	
	/**
	 *  Check the status
	 */
	private String status;
	

    private int userId;
    
    private String userName;

}
