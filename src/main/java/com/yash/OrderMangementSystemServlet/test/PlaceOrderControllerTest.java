/*
 * package com.yash.OrderMangementSystemServlet.test;
 * 
 * import com.yash.OrderMangementSystemServlet.controller.PlaceOrderController;
 * import com.yash.OrderMangementSystemServlet.pojo.Order; import
 * com.yash.OrderMangementSystemServlet.service.OrderService; import
 * com.yash.OrderMangementSystemServlet.serviceimpl.OrderServiceImpl;
 * 
 * import javax.servlet.ServletException; import javax.servlet.http.*; import
 * java.io.IOException; import java.util.HashMap; import java.util.Map;
 * 
 * public class PlaceOrderControllerTest {
 * 
 * public static void main(String[] args) throws ServletException, IOException {
 * // Create controller PlaceOrderController controller = new
 * PlaceOrderController();
 * 
 * // Create stub request and response StubHttpServletRequest request = new
 * StubHttpServletRequest(); StubHttpServletResponse response = new
 * StubHttpServletResponse();
 * 
 * // Simulate form data request.setParameter("productName", "Wireless Mouse");
 * request.setParameter("productId", "101"); request.setParameter("price",
 * "800");
 * 
 * // Simulate session request.getSession().setAttribute("userId", 7);
 * 
 * // Call doPost controller.doPost(request, response);
 * 
 * // Validate redirect assert
 * "orderList.jsp".equals(response.getRedirectedUrl()) : "Redirection failed";
 * 
 * System.out.println("✅ Test passed: Order placed and redirected correctly.");
 * }
 * 
 * // Stub classes static class StubHttpServletRequest extends
 * HttpServletRequestWrapper { private final Map<String, String> parameters =
 * new HashMap<>(); private final HttpSession session = new StubHttpSession();
 * 
 * public StubHttpServletRequest() { super(new HttpServletRequestAdapter()); }
 * 
 * public void setParameter(String name, String value) { parameters.put(name,
 * value); }
 * 
 * @Override public String getParameter(String name) { return
 * parameters.get(name); }
 * 
 * @Override public HttpSession getSession() { return session; } }
 * 
 * static class StubHttpServletResponse extends HttpServletResponseWrapper {
 * private String redirectedUrl;
 * 
 * public StubHttpServletResponse() { super(new HttpServletResponseAdapter()); }
 * 
 * @Override public void sendRedirect(String location) { this.redirectedUrl =
 * location; }
 * 
 * public String getRedirectedUrl() { return redirectedUrl; } }
 * 
 * static class StubHttpSession implements HttpSession { private final
 * Map<String, Object> attributes = new HashMap<>();
 * 
 * @Override public Object getAttribute(String name) { return
 * attributes.get(name); }
 * 
 * @Override public void setAttribute(String name, Object value) {
 * attributes.put(name, value); }
 * 
 * // Other methods can be left unimplemented or return defaults // ... }
 * 
 * // AdaptersRequest { // Implement only required methods or leave empty }
 * 
 * static class HttpServletResponseAdapter extends HttpServletResponse { //
 * Implement only required methods or leave empty } }
 */