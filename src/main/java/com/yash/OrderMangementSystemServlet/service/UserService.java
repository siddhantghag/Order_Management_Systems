package com.yash.OrderMangementSystemServlet.service;

import com.yash.OrderMangementSystemServlet.exception.UserAuthenticationException;
import com.yash.OrderMangementSystemServlet.pojo.User;

/**
 * UserService is a service layer interface that defines business operations
 * related to user management such as registration and authentication.
 * 
 * Author: Siddhant Pravin Ghag
 */

public interface UserService {

	/**
	 * Registers a new user in the system.
	 * 
	 * @param user the User object containing registration details.
	 */

	public void registerUser(User user);

	/**
	 * Authenticates a user based on login credentials.
	 * 
	 * @param loginname the login name of the user.
	 * @param password  the password of the user.
	 * @return the authenticated User object.
	 * @throws UserAuthenticationException if authentication fails.
	 */

	public User authenticateUser(String loginname, String password , String role) throws UserAuthenticationException;

}
