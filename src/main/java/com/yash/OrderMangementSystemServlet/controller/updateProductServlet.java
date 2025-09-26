package com.yash.OrderMangementSystemServlet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yash.OrderMangementSystemServlet.pojo.Product;
import com.yash.OrderMangementSystemServlet.service.ProductService;
import com.yash.OrderMangementSystemServlet.serviceimpl.ProductServiceImpl;


/**
 * updateProductServlet is a servlet responsible for handling the update orders.
 * Author: Siddhant Ghag
 */

@WebServlet("/updateProductServlet")
public class updateProductServlet extends HttpServlet 
{

private static final long serialVersionUID = 1L;

    private ProductService productService;

    public updateProductServlet() {
        super();
        productService = new ProductServiceImpl(); // Or inject if using a framework
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        // Get updated product data from request
        int productId = 0;
        try {
            productId = Integer.parseInt(request.getParameter("productId"));
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid product ID format.");
            return;
        }

        String productName = request.getParameter("productName");
        double productPrice = 0.0;
        try {
            productPrice = Double.parseDouble(request.getParameter("productPrice"));
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid product price format.");
            return;
        }

        // Create updated Product object
        Product product = new Product();
        product.setProductId(productId);
        product.setProductName(productName);
        product.setProductPrise(productPrice);

        // Call service method to update product
        productService.updateProduct(product);

        // Send response
        response.sendRedirect("showAllProduct.jsp");   //getWriter().println("Product updated successfully.");
    }
}
