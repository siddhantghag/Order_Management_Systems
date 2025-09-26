package com.yash.OrderMangementSystemServlet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yash.OrderMangementSystemServlet.exception.UserAuthenticationException;
import com.yash.OrderMangementSystemServlet.pojo.User;
import com.yash.OrderMangementSystemServlet.service.UserService;
import com.yash.OrderMangementSystemServlet.serviceimpl.UserServiceImpl;

/**
 * loginController is a servlet responsible for handling user login functionality.
 * It reads login credentials from the request, authenticates the user via the service layer,
 * and sets session attributes upon successful login. If authentication fails, it redirects
 * the user to the login page with an error message.
 */
@WebServlet("/loginController")
public class loginController extends HttpServlet 
{
	//private static final Logger logger = LoggerFactory.getLogger(loginController.class);
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(loginController.class);
	private UserService userservice = null ;
	
    public loginController() 
    {
    	super();
        userservice = new UserServiceImpl();
    }
    
    /**
     * Handles POST requests for user login.
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	    logger.info("LoginController : Inside the post methd");
	    
	    //Read the form data
	    
		  String loginame = request.getParameter("loginname");
		  String password = request.getParameter("password");
		  
		  //add role
		  String rolename = request.getParameter("rolename");
		    
	    //Prepare the model object
	    
	    //Share with service and redirect\
		  try
		  {
			  User loggedInUser = userservice.authenticateUser(loginame, password , rolename);
			  logger.info("Login user");
			  
			 //Add the loggedInUser details in session object.
			  HttpSession httpSession =  request.getSession();
			  httpSession.setAttribute("userId", loggedInUser.getId());
			  httpSession.setAttribute("userName", loggedInUser.getName());
			  
			  //add  role
              httpSession.setAttribute("rolename", loggedInUser.getRole());

			  httpSession.setAttribute("LoginInUser", loggedInUser);
			  

			    if ("admin".equals(httpSession.getAttribute("rolename"))) {
				    response.sendRedirect("adminDashBoard.jsp");
				} else if ("user".equals(httpSession.getAttribute("rolename"))) {
				    response.sendRedirect("welcome.jsp");
				}
			 //Redirecting on welcome page
			  
			 //server side  - not change URL
			// RequestDispatcher requestDispatcher =  request.getRequestDispatcher("welcome.jsp");
			// requestDispatcher.forward(request, response);
			 
			 //client side - change url 
			// response.sendRedirect("productList.jsp");
		  }
		  catch (UserAuthenticationException  e) 
		  {
			 response.sendRedirect("index.jsp?err="+e.getMessage());
		  }  
	}

}
