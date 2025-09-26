package com.yash.OrderMangementSystemServlet.pojo;

/**
 * The Product class represents a product entity in the system.
 * It contains details such as product ID, name, and price.
 * 
 * Author: Siddhant Pravin Ghag
 */

public class Product 
{
	private int productId;
	private String productName;
	private double productPrise;
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productPrise=" + productPrise
				+ "]";
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public double getProductPrise() {
		return productPrise;
	}
	public void setProductPrise(double productPrise) {
		this.productPrise = productPrise;
	}
}


