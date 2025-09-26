package com.yash.OrderMangementSystemServlet.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author siddhant.ghag
 *  This component will provide JDBC related functionally , like as open Connection , 
 *  close connection , create preparedstatement , close preparedstatement.
 *  
 *  It should me able to load driver as the object of this utility  is created
 */
public class JdbcUtilConnection 
{
	private static final String URL = "jdbc:mysql://localhost:3306/ordermangement";
	private static final String USER = "root";
	private static final String PASSWORD = "root";
	private Connection con =null;
	
	private static final Logger  logger = LoggerFactory.getLogger(JdbcUtilConnection.class);
	
	static 
	{
		try
		{
			//DB connection 
	    	Class c =Class.forName("com.mysql.cj.jdbc.Driver");
	    	logger.info(c.toString());
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * openConnection feature will open the connection if connection is null or closed
	 * @return Connection object if created otherwise null
	 */
	//Connection is database related interface
	private Connection openConnection()
	{
		try 
		{
			if(con==null)
			{
				con= DriverManager.getConnection(URL, USER, PASSWORD);
			}
			if(con.isClosed())
			{
				con= DriverManager.getConnection(URL, USER, PASSWORD);
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return con;
	}
	
	public PreparedStatement crePreparedStatement(String query)
	{
		try 
		{
			openConnection();
			return con.prepareStatement(query);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}
	
	public void closePreparedStatement(PreparedStatement pstmt)
	{
		if(pstmt!=null)
		{
			try 
			{
				pstmt.close();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
	}
	
	public void closeConnection()
	{
		if(con!=null)
		{
			try 
			{
				con.close();		
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
	}
}
