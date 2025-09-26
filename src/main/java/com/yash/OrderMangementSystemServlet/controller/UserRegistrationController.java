/*
 * package com.yash.OrderMangementSystemServlet.controller;
 * 
 * import java.io.IOException;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import org.slf4j.Logger; import org.slf4j.LoggerFactory;
 * 
 * import com.yash.OrderMangementSystemServlet.pojo.User; import
 * com.yash.OrderMangementSystemServlet.service.UserService; import
 * com.yash.OrderMangementSystemServlet.serviceimpl.UserServiceImpl;
 * 
 *//**
	 * UserRegistrationController is a servlet responsible for handling user
	 * registration
	 */
/*
 * @WebServlet("/UserRegistrationController") public class
 * UserRegistrationController extends HttpServlet { private static final long
 * serialVersionUID = 1L; private static final Logger logger =
 * LoggerFactory.getLogger(UserRegistrationController.class); private
 * UserService userService =null; public UserRegistrationController() { super();
 * userService = new UserServiceImpl(); }
 * 
 * 
 * 
 *//**
	 * Handles POST requests for user registration.
	 * 
	 * @param request  HttpServletRequest containing user registration details.
	 * @param response HttpServletResponse used to redirect the user after
	 *                 registration.
	 * @throws ServletException if a servlet-specific error occurs.
	 * @throws IOException      if an I/O error occurs.
	 *//*
		 * 
		 * protected void doPost(HttpServletRequest request, HttpServletResponse
		 * response) throws ServletException, IOException { //Read the form data and
		 * Prepare the model object User user = new User();
		 * 
		 * user.setName(request.getParameter("name"));
		 * user.setPhone(request.getParameter("phone"));
		 * user.setEmail(request.getParameter("email"));
		 * user.setAddress(request.getParameter("address"));
		 * user.setLoginname(request.getParameter("loginname"));
		 * user.setPassword(request.getParameter("password"));
		 * 
		 * //add role //user.setRole(request.getParameter("rolename"));
		 * user.setRole("user");
		 * 
		 * 
		 * //Share with service and redirect
		 * 
		 * System.out.println("User data -: "+ user); userService.registerUser(user);
		 * 
		 * //Redirecting on welcome page
		 * response.sendRedirect("index.jsp?msg=You Registered Sucessfully ! Now Login"
		 * ); }
		 * 
		 * }
		 */
package com.yash.OrderMangementSystemServlet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yash.OrderMangementSystemServlet.pojo.User;
import com.yash.OrderMangementSystemServlet.service.UserService;
import com.yash.OrderMangementSystemServlet.serviceimpl.UserServiceImpl;

/**
 * UserRegistrationController is a servlet responsible for handling user
 * registration
 */
@WebServlet("/UserRegistrationController")
public class UserRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(UserRegistrationController.class);
	private UserService userService = null;
	
	public UserRegistrationController() {
		super();
		userService = new UserServiceImpl();
	}

	/**
	 * Handles POST requests for user registration.
	 * 
	 * @param request  HttpServletRequest containing user registration details.
	 * @param response HttpServletResponse used to redirect the user after
	 *                 registration.
	 * @throws ServletException if a servlet-specific error occurs.
	 * @throws IOException      if an I/O error occurs.
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Read the form data and Prepare the model object
		User user = new User();
		logger.info("Inside the do post method.....User Register");
		user.setName(request.getParameter("name"));
		user.setPhone(request.getParameter("phone"));
		user.setEmail(request.getParameter("email"));
		user.setAddress(request.getParameter("address"));
		user.setLoginname(request.getParameter("loginname"));
		user.setPassword(request.getParameter("password"));
		user.setRole("user");
		//user.setRole("admin");
		// add role
		// user.setRole(request.getParameter("rolename"));
		System.out.println("User -: "+ user);
		// Share with service and redirect
		userService.registerUser(user);

		// Redirecting on welcome page
		response.sendRedirect("index.jsp?msg=You Registered Sucessfully ! Now Login");
	}

}
