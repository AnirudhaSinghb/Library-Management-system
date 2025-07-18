<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<title>Add Member</title>
</head>
<body>
	<h2>Add New Member</h2>
	<form action="addMemberAction.jsp" method="post">
		Name: <input type="text" name="name" required><br>
		<br> Email: <input type="email" name="email" required><br>
		<br> Phone: <input type="text" name="phone" required><br>
		<br> <input type="submit" value="Add Member">
	</form>
</body>
</html>