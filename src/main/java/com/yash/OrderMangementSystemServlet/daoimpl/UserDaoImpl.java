package com.yash.OrderMangementSystemServlet.daoimpl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yash.OrderMangementSystemServlet.dao.UserDao;
import com.yash.OrderMangementSystemServlet.pojo.User;
import com.yash.OrderMangementSystemServlet.util.JdbcUtilConnection;
import com.yash.OrderMangementSystemServlet.util.PasswordUtil;


/**
 * UserDaoImpl provides the implementation of the UserDao interface.
 * It handles database operations related to user management such as
 * saving, deleting, updating, and retrieving user records.
 * 
 * Author: Siddhant Pravin Ghag
 */

public class UserDaoImpl extends JdbcUtilConnection implements UserDao
{
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
	

/**
     * Saves a new user to the database.
     * 
     * @param user the User object containing user details.
     */
	@Override
	public void save(User user)
	{
		logger.info("2");
		//String query = "insert into users(name,phone,email,address,loginname,password) values(?,?,?,?,?,?)";
		
		//add role
		String query = "insert into users(name,phone,email,address,loginname,password,role) values(?,?,?,?,?,?,?)";
		System.out.println("Query -: "+ query);
		PreparedStatement preparedStatement =  super.crePreparedStatement(query);
		try
		{
			// Hash the password before storing
            String hashedPassword = PasswordUtil.hashPassword(user.getPassword());
            
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getPhone());
			preparedStatement.setString(3,user.getEmail());
			preparedStatement.setString(4, user.getAddress());
			preparedStatement.setString(5, user.getLoginname());
			//preparedStatement.setString(6,user.getPassword());
			preparedStatement.setString(6,hashedPassword);
			
			//add role
			preparedStatement.setString(7, user.getRole());
			preparedStatement.executeUpdate();
			System.out.println("User.........");
			logger.info("SUCESS : User Inserted Sucessfully...!");
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			super.closePreparedStatement(preparedStatement);
			super.closeConnection();
		}
	}

/*
 * @Override public void save(User user) { //String query =
 * "insert into users(name,phone,email,address,loginname,password) values(?,?,?,?,?,?)"
 * ;
 * 
 * //add role String query =
 * "insert into ordermangement.users(name,phone,email,address,loginname,password,role) values(?,?,?,?,?,?,?)"
 * ;
 * 
 * PreparedStatement preparedStatement = super.crePreparedStatement(query); try
 * { preparedStatement.setString(1, user.getName());
 * preparedStatement.setString(2, user.getPhone());
 * preparedStatement.setString(3,user.getEmail());
 * preparedStatement.setString(4, user.getAddress());
 * preparedStatement.setString(5, user.getLoginname());
 * preparedStatement.setString(6,user.getPassword());
 * 
 * //add role preparedStatement.setString(7, "user");
 * preparedStatement.executeUpdate();
 * logger.info("SUCESS : User Inserted Sucessfully...!"); } catch (SQLException
 * e) { e.printStackTrace(); } finally {
 * super.closePreparedStatement(preparedStatement); super.closeConnection(); } }
 */

	 /**
	     * Deletes a user from the database based on the user ID.
	     * 
	     * @param id the ID of the user to be deleted.
	     */

	@Override
	public void delete(int id) 
	{
		String query ="delete from users where id'?";
		PreparedStatement preparedStatement =  super.crePreparedStatement(query);
		try
		{
			preparedStatement.setInt(1, id);	
			preparedStatement.executeUpdate();
			logger.info("SUCESS : User deleted Sucessfully...!");
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			super.closePreparedStatement(preparedStatement);
			super.closeConnection();
		}
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
