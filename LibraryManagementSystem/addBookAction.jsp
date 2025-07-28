<%@ page import="java.sql.*"%>
<%@ page import="db.DBConnection"%>
<%
if (session.getAttribute("admin") == null) {
	response.sendRedirect("login.jsp");
}
%>

<%
String role = (String) session.getAttribute("role");
if (!"admin".equals(role)) {
	out.println("<h3>Access denied. Admins only.</h3>");
	return;
}
%>
<jsp:include page="navbar.jsp" />
<%
String title = request.getParameter("title");
String author = request.getParameter("author");
int quantity = Integer.parseInt(request.getParameter("quantity"));
int available = quantity;

try {
	Connection con = DBConnection.getConnection();
	String sql = "INSERT INTO books (title, author, quantity, available) VALUES (?, ?, ?, ?)";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, title);
	ps.setString(2, author);
	ps.setInt(3, quantity);
	ps.setInt(4, available);
	int rows = ps.executeUpdate();

	if (rows > 0) {
		out.println("<h3>Book added successfully!</h3>");
	} else {
		out.println("<h3>Failed to add book.</h3>");
	}

	ps.close();
	con.close();
} catch (Exception e) {
	out.println("<h3>Error: " + e.getMessage() + "</h3>");
}
%>
<br>
<a href="addBook.jsp">Add Another Book</a>