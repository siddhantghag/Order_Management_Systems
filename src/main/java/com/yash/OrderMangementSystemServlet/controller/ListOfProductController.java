package com.yash.OrderMangementSystemServlet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
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

/**
 * ListOfProductController is a servlet responsible for retrieving the list of
 * all products available in the system.
 */
@WebServlet("/ListOfProductController")
public class ListOfProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final Logger logger = LoggerFactory.getLogger(ListOfProductController.class);

	private ProductService productService = null;

	public ListOfProductController() {
		super();
		productService = new ProductServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		/*
		 * List<Product> productList = productService.getAllProduct();
		 * request.setAttribute("productList", productList); //
		 * logger.info(productList); RequestDispatcher rd =
		 * request.getRequestDispatcher("productList.jsp"); rd.forward(request,
		 * response);
		 */

	
		//add Pagination
		
		int page = 1;
		int recordsPerPage = 10;

		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));

		//roductService productService = new ProductServiceImpl();
		List<Product> productList = productService.getProducts((page - 1) * recordsPerPage, recordsPerPage);
		logger.info("Fetched products: " + productList.size());
        logger.info("Page: " + page + ", Offset: " + ((page - 1) * recordsPerPage));

		int totalRecords = productService.getTotalProductCount();
		
		/*
		 * int totalPages = totalRecords / recordsPerPage; 
		 * if (totalRecords % recordsPerPage != 0) 
		 * { 
		 *   totalPages++; 
		 * }
		 */
		int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
		
		request.setAttribute("productList", productList);
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);

		RequestDispatcher dispatcher = request.getRequestDispatcher("productList.jsp");
		dispatcher.forward(request, response);

	}

}
