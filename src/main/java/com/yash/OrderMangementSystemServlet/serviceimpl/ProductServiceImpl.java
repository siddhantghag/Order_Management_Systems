package com.yash.OrderMangementSystemServlet.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.yash.OrderMangementSystemServlet.dao.ProductDao;
import com.yash.OrderMangementSystemServlet.daoimpl.ProductDaoImpl;
import com.yash.OrderMangementSystemServlet.pojo.Product;
import com.yash.OrderMangementSystemServlet.service.ProductService;

/**
 * ProductServiceImpl provides the implementation of the ProductService
 * interface. It acts as a bridge between the controller layer and the DAO
 * layer, handling business logic related to product operations.
 * 
 * Author: Siddhant Pravin Ghag
 */

public class ProductServiceImpl implements ProductService {
	private ProductDao productDao = null;

	public ProductServiceImpl() {
		super();
		productDao = new ProductDaoImpl();
	}

	/**
	 * Retrieves all products by delegating to the DAO layer.
	 * 
	 * @return a list of Product objects.
	 */

	@Override
	public List<Product> getAllProduct() {
		List<Product> listProduct = productDao.getAllProduct();
		return listProduct;
	}
	
	//add Pagination 
	@Override
	 public List<Product> getProducts(int offset, int noOfRecords) {
	  List<Product> products = 	productDao.getProducts(offset, noOfRecords);
	  return products;
	}

	@Override
	public int getTotalProductCount() {
		int count = productDao.getTotalProductCount();
		return count;
	}

	@Override
	public void addproduct(Product product) 
	{
		productDao.addProduct(product);	
	}

	@Override
	public void updateProduct(Product product) 
	{
		productDao.updateProduct(product);
	}

	@Override
	public Product getProductById(int productId) {
	 Product p = productDao.getProductById(productId);
		return p;
	}
}
