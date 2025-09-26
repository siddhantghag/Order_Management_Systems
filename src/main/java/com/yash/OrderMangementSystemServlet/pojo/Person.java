package com.yash.OrderMangementSystemServlet.pojo;


/**
 * The Person class represents a generic person entity with basic contact details.
 * Author: Siddhant Pravin Ghag
 */
 
public class Person 
{
	 private int id;
	 private String name;
	 private String phone; 
	 private String email;
	 private String address;
	 
	 public int getId() {
		 return id;
	 }
	 public void setId(int id) {
		 this.id = id;
	 }
	 public String getName() {
		 return name;
	 }
	 public void setName(String name) {
		 this.name = name;
	 }
	 public String getPhone() {
		 return phone;
	 }
	 public void setPhone(String phone) {
		 this.phone = phone;
	 }
	 public String getEmail() {
		 return email;
	 }
	 public void setEmail(String email) {
		 this.email = email;
	 }
	 public String getAddress() {
		 return address;
	 }
	 public void setAddress(String address) {
		 this.address = address;
	 }
	 
	 
}
