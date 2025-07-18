<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("admin") == null) {
	response.sendRedirect("login.jsp");
}
%>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>
</head>
<body>
	<h2>Add Book</h2>
	<form action="addBookAction.jsp" method="post">
		Title: <input type="text" name="title" required><br> <br>
		Author: <input type="text" name="author" required><br> <br>
		Quantity: <input type="number" name="quantity" required><br>
		<br> <input type="submit" value="Add Book">
	</form>
</body>
</html>