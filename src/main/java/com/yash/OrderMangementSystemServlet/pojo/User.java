package com.yash.OrderMangementSystemServlet.pojo;


/**
 * The User class represents a user entity in the system.
 * Author: Siddhant Pravin Ghag
 */

public class User extends Person
{
	 private String loginname ;
	 private String password;
	 
	 public String getLoginname() {
		 return loginname;
	 }
	 public void setLoginname(String loginname) {
		 this.loginname = loginname;
	 }
	 public String getPassword() {
		 return password;
	 }
	 public void setPassword(String password) {
		 this.password = password;
	 }
	 
	 //Role add
	 private String role; 
	 
	 public String getRole() {
		    return role;
		}

		public void setRole(String role) {
		    this.role = role;
		}

}

