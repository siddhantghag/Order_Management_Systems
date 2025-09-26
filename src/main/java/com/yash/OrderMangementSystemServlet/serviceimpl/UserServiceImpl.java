package com.yash.OrderMangementSystemServlet.serviceimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.yash.OrderMangementSystemServlet.dao.UserDao;
import com.yash.OrderMangementSystemServlet.daoimpl.UserDaoImpl;
import com.yash.OrderMangementSystemServlet.exception.UserAuthenticationException;
import com.yash.OrderMangementSystemServlet.pojo.User;
import com.yash.OrderMangementSystemServlet.service.UserService;
import com.yash.OrderMangementSystemServlet.util.JdbcUtilConnection;
import com.yash.OrderMangementSystemServlet.util.PasswordUtil;

/**
 * UserServiceImpl provides the implementation of the UserService interface. It
 * handles business logic for user registration and authentication, interacting
 * with the DAO layer and database as needed.
 * 
 * Author: Siddhant Pravin Ghag
 */

public class UserServiceImpl extends JdbcUtilConnection implements UserService {

	private UserDao userDao = null;

	public UserServiceImpl() {
		userDao = new UserDaoImpl();
	}

	/**
	 * Registers a new user by delegating to the DAO layer.
	 * 
	 * @param user the User object containing registration details.
	 */

	@Override
	public void registerUser(User user) {
		userDao.save(user);
	}

	/**
	 * Authenticates a user based on login credentials.
	 * 
	 * @param loginname the login name of the user.
	 * @param password  the password of the user.
	 * @return the authenticated User object.
	 * @throws UserAuthenticationException if authentication fails.
	 */

	@Override
	public User authenticateUser(String loginname, String password , String role) throws UserAuthenticationException {
	//	String query = "SELECT * FROM users WHERE loginname=? AND password=?";

		//add role 
        //String query  = "SELECT * FROM users WHERE loginname=? AND password=? AND role=?";

		String query = "SELECT * FROM users WHERE loginname=? AND role=?";
		
		User user = null;
		// ResultSet is an object in JDBC that represents the result of a SQL query
		ResultSet rs = null;
		PreparedStatement pstmt = super.crePreparedStatement(query);
		try {
			pstmt.setString(1, loginname);
			//pstmt.setString(2, password);
			
			//add role
			pstmt.setString(2, role);
			rs = pstmt.executeQuery();
			System.out.println("Passowrd-:" + password );
			if (rs.next()) {
				/*
				 * user = new User(); user.setName(rs.getString("name"));
				 * user.setId(rs.getInt("id")); user.setEmail(rs.getString("email"));
				 * user.setAddress(rs.getString("address"));
				 * user.setLoginname(rs.getString("loginname"));
				 * user.setPassword(rs.getString("password"));
				 */
				
                String storedHash = rs.getString("password");
                
                // Verify password
                if (PasswordUtil.checkPassword(password, storedHash)) {
                    user = new User();
    				user.setName(rs.getString("name"));
    				user.setId(rs.getInt("id"));
    				user.setEmail(rs.getString("email"));
    				user.setAddress(rs.getString("address"));
    				user.setLoginname(rs.getString("loginname"));
					/* user.setPassword(rs.getString("password")); */
    				//add role
    				user.setRole(rs.getString("role")); 
                    return user;
                }
				
			} else {
				// this is my fail login : User is not found. ( Invalid Username ,Password )
				throw new UserAuthenticationException("Invalid credentials");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closePreparedStatement(pstmt);
			super.closeConnection();
		}

		return user;
	}

}
