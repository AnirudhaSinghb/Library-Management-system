<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("admin") == null) {
	response.sendRedirect("login.jsp");
}
String role = (String) session.getAttribute("role");
if (!"admin".equals(role)) {
	out.println("<h3>Access denied. Admins only.</h3>");
	return;
}
%>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="container">
		<h2>Add Book</h2>

		<form action="addBookAction.jsp" method="post">
			<input type="text" name="title" placeholder="Book Title" required><br>
			<input type="text" name="author" placeholder="Author Name" required><br>
			<input type="number" name="quantity" placeholder="Quantity" required><br>
			<input type="submit" value="Add Book">
		</form>
	</div>
</body>
</html>
