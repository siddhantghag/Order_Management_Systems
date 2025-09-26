package com.yash.OrderMangementSystemServlet.exception;

public class UserAuthenticationException extends Exception 
{

	/**
	 * UserAuthenticationException created without any error message
	 */
	public UserAuthenticationException() {
		super();
	}
	
	
	/**
	 * UserAuthenticationException created with any error message
	 */
	public UserAuthenticationException(String errMsg) {
		super(errMsg);
	}
}
