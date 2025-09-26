package com.yash.OrderMangementSystemServlet.service;

import java.util.List;

import com.yash.OrderMangementSystemServlet.pojo.Product;

/**
 * ProductService is a service layer interface that defines business operations
 * related to product management. 
 * Author: Siddhant Pravin Ghag
 */

public interface ProductService {

	/**
	 * Retrieves all products available in the system.
	 * 
	 * @return a list of Product objects.
	 */

	public List<Product> getAllProduct();
	
	//add Pagination 
	public List<Product> getProducts(int offset, int noOfRecords);
	public int getTotalProductCount();
	public void addproduct(Product product);
	public void updateProduct(Product product);

	public Product getProductById(int productId);
}
