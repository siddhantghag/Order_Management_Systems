package com.yash.OrderMangementSystemServlet.dao;

import java.util.List;

import com.yash.OrderMangementSystemServlet.pojo.User;

/**
 * UserDao is a Data Access Object interface that defines CRUD operations for
 * managing user data in the system.
 * 
 * Author: Siddhant Pravin Ghag
 */
public interface UserDao {

	/**
	 * Saves a new user to the database.
	 * 
	 * @param user the User object containing user details to be saved.
	 */
	public void save(User user);

	/**
	 * Deletes a user from the database based on the provided user ID.
	 * 
	 * @param id the ID of the user to be deleted.
	 */

	public void delete(int id);

	/**
	 * Updates an existing user's details in the database.
	 * 
	 * @param user the User object containing updated user information.
	 */

	public void update(User user);

	/**
	 * Retrieves all users from the database.
	 * 
	 * @return a list of all User objects.
	 */

	public List<User> findAll();
}
