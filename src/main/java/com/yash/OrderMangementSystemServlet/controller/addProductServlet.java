package com.yash.OrderMangementSystemServlet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yash.OrderMangementSystemServlet.pojo.Product;
import com.yash.OrderMangementSystemServlet.service.ProductService;
import com.yash.OrderMangementSystemServlet.serviceimpl.ProductServiceImpl;

@WebServlet("/addProductServlet")
public class addProductServlet extends HttpServlet {

	private static final Logger logger = LoggerFactory.getLogger(addProductServlet.class);

	private static final long serialVersionUID = 1L;

	private ProductService productService;

	public addProductServlet() {
		super();
		productService = new ProductServiceImpl(); // Or inject if using a framework
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get form data from request
		int productId = Integer.parseInt(request.getParameter("productId"));
		String productName = request.getParameter("productName");
		String productPriceStr = request.getParameter("productPrice");

		double productPrice = 0.0;
		try {
			productPrice = Double.parseDouble(productPriceStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.getWriter().println("Invalid price format.");
			return;
		}

		// Create Product object
		Product product = new Product();
		product.setProductId(productId);
		product.setProductName(productName);
		product.setProductPrise(productPrice);

		// Call service method to add product
		productService.addproduct(product);

		// Send response
		response.sendRedirect("productList.jsp"); // getWriter().println("Product added successfully.");
	}

}
