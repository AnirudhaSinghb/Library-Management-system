<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
<title>Add Member</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="container">
		<h2>Add New Member</h2>

		<form action="addMemberAction.jsp" method="post">
			<input type="text" name="name" placeholder="Full Name" required><br>
			<input type="email" name="email" placeholder="Email Address" required><br>
			<input type="text" name="phone" placeholder="Phone Number" required><br>
			<input type="submit" value="Add Member">
		</form>
	</div>
</body>
</html>
