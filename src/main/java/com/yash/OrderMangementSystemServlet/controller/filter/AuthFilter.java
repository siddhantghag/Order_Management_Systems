/*
 * package com.yash.OrderMangementSystemServlet.controller.filter;
 * 
 * import javax.servlet.*; import javax.servlet.annotation.WebFilter; import
 * javax.servlet.http.*; import java.io.IOException;
 * 
 * @WebFilter(urlPatterns = { "/ListOfProductController", "/addProductServlet"
 * ,"/CancelOrderController" , "/GetAllOrderByUserIdController" ,
 * "/GetAllOrderController" , "/PlaceOrderController" , "/updateProductServlet"
 * }) public class AuthFilter implements Filter {
 * 
 * @Override public void doFilter(ServletRequest req, ServletResponse res,
 * FilterChain chain) throws IOException, ServletException { HttpServletRequest
 * r = (HttpServletRequest) req; HttpSession s = r.getSession(false); if (s ==
 * null || s.getAttribute("userId") == null) { ((HttpServletResponse)
 * res).sendRedirect(r.getContextPath() + "/index.jsp?msg=Please%20login");
 * return; } chain.doFilter(req, res); } }
 */