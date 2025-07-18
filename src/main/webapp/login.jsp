<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>
</head>
<body>
	<h2>Admin Login</h2>
	<form action="loginAction.jsp" method="post">
		Username: <input type="text" name="username" required><br>
		<br> Password: <input type="password" name="password" required><br>
		<br> <input type="submit" value="Login">
	</form>
</body>
</html>