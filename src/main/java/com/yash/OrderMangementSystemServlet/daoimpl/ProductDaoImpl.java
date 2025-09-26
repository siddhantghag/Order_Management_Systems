package com.yash.OrderMangementSystemServlet.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yash.OrderMangementSystemServlet.dao.ProductDao;
import com.yash.OrderMangementSystemServlet.pojo.Product;
import com.yash.OrderMangementSystemServlet.util.JdbcUtilConnection;

/**
 * ProductDaoImpl provides the implementation of the ProductDao interface. It
 * handles database operations related to retrieving product data.
 * 
 * Author: Siddhant Pravin Ghag
 */
public class ProductDaoImpl extends JdbcUtilConnection implements ProductDao {
	private static final Logger logger = LoggerFactory.getLogger(ProductDaoImpl.class);

	/**
	 * Retrieves all products from the database.
	 * 
	 * @return a list of Product objects.
	 */

	@Override
	public List<Product> getAllProduct() {
		String query = "SELECT * FROM Product ORDER BY productId";
		PreparedStatement preparedStatement = super.crePreparedStatement(query);
		List<Product> productList = new ArrayList<>();

		try {
			ResultSet rs = preparedStatement.executeQuery(query);
			while (rs.next()) {
				Product p = new Product();
				p.setProductId(rs.getInt("productId"));
				p.setProductName(rs.getString("productName"));
				p.setProductPrise(rs.getDouble("productPrise"));
				productList.add(p);
				System.out.println(p.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closePreparedStatement(preparedStatement);
			super.closeConnection();
		}
		return productList;
	}

	public int getPrise(int productId, String productName) {
		int productPrice = 0;

		String query = "SELECT productPrise FROM Product WHERE ProductId = ? AND ProductName = ?";

		try {
			PreparedStatement preparedStatement = super.crePreparedStatement(query);
			preparedStatement.setInt(1, productId);
			preparedStatement.setString(2, productName);

			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				productPrice = rs.getInt("productPrise");
			}
			rs.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace(); // You can log this instead
		}
		return productPrice;
	}

	// add pagination
	@Override
	public List<Product> getProducts(int offset, int noOfRecords) {
		List<Product> products = new ArrayList<>();
		String query = "SELECT * FROM Product LIMIT ?, ?";
		try {
			PreparedStatement ps = super.crePreparedStatement(query);
			ps.setInt(1, offset);
			ps.setInt(2, noOfRecords);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setProductPrise(rs.getDouble("productPrise"));
				// Add other fields as needed
				products.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return products;
	}

	@Override
	public int getTotalProductCount() {
		int count = 0;
		String query = "SELECT COUNT(*) FROM Product";

		try {
			PreparedStatement ps = super.crePreparedStatement(query);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public void addProduct(Product product) {

		String query = "INSERT INTO product (productId	, productName, productPrise) VALUES (?, ?, ?)";

		try {
			PreparedStatement stmt = super.crePreparedStatement(query);
			// ResultSet rs = stmt.executeQuery();
			stmt.setInt(1, product.getProductId());
			stmt.setString(2, product.getProductName());
			stmt.setDouble(3, product.getProductPrise());

			int rowsInserted = stmt.executeUpdate();
			if (rowsInserted > 0) {
				System.out.println("Product added successfully.");
			} else {
				System.out.println("Failed to add product.");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void updateProduct(Product product) {
		String query = "UPDATE product SET productName = ?, productPrise = ? WHERE productId = ?";

		try {
			PreparedStatement stmt = super.crePreparedStatement(query);
			stmt.setString(1, product.getProductName());
			stmt.setDouble(2, product.getProductPrise());
			stmt.setInt(3, product.getProductId());

			int rowsUpdated = stmt.executeUpdate();
			if (rowsUpdated > 0) {
				System.out.println("Product updated successfully.");
			} else {
				System.out.println("No product found with the given ID.");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Product getProductById(int productId) 
	{
        Product product = null;
        String query = "SELECT * FROM products WHERE product_id = ?";

        try {
        	PreparedStatement stmt = super.crePreparedStatement(query);
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) 
            {
                product = new Product();
                product.setProductId(rs.getInt("productId"));
                product.setProductName(rs.getString("productName"));
                product.setProductPrise(rs.getDouble("productPrise"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
	}
}
