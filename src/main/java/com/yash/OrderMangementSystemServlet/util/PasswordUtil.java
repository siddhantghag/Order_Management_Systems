package com.yash.OrderMangementSystemServlet.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
 
 // Hash a password with bcrypt
 public static String hashPassword(String plainPassword) 
 {
     return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
 }
 
 // Check if plain password matches hashed password
 public static boolean checkPassword(String plainPassword, String hashedPassword) 
 {
     try {
         return BCrypt.checkpw(plainPassword, hashedPassword);
     } catch (Exception e) {
         return false;
     }
 }
}