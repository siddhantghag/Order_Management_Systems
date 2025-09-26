package com.yash.OrderMangementSystemServlet.test;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yash.OrderMangementSystemServlet.util.JdbcUtilConnection;

public class JdbcUtilTest
{
	private static final Logger  logger = LoggerFactory.getLogger(JdbcUtilTest.class);
	
	public static void main(String[] args) 
	{
		
		JdbcUtilConnection jdbcUtilConnection = new JdbcUtilConnection();
		String query ="INSERT INTO `ordermangement`.`testorder` (`id`, `name`, `short_description`) VALUES (?, ?,?);";
	    PreparedStatement pstmt = 	jdbcUtilConnection.crePreparedStatement(query);
	    try
	    {
			pstmt.setInt(1,1);
			pstmt.setString(2,"Siddhant");
			pstmt.setString(3,"Java , C++");
			pstmt.execute();
		} 
	    catch (SQLException e) 
	    {
			e.printStackTrace();
		}
	    logger.info(pstmt.toString());
	    //System.out.println(pstmt);
	}

}
