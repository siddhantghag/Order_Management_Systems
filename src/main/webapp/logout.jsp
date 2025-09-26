<% 
	session.invalidate(); //session.invalidate() in JSP is a method used to terminate a user's session.
	response.sendRedirect("index.jsp?msg=You logged out sucessfully..");
%>