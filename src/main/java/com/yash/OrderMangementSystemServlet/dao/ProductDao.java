package com.yash.OrderMangementSystemServlet.dao;

import java.util.List;

import com.yash.OrderMangementSystemServlet.pojo.Product;

public interface ProductDao 
{

    /**
     * Retrieves all products available in the system.
     * 
     * @return a list of all Product objects.
     */

	public List<Product> getAllProduct();
	
	//add pagination 
	 public List<Product> getProducts(int offset, int noOfRecords);
	 public int getTotalProductCount();
	 public void addProduct(Product product);
	 public void updateProduct(Product product);
	 public Product getProductById(int productId);
}
