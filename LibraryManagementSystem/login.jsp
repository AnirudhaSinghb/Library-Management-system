<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link rel="stylesheet" href="style.css">
<style>
.login-box {
	background-color: #ffffff;
	padding: 40px;
	margin: 80px auto;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
	max-width: 400px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="login-box">
		<h2>Admin Login</h2>

		<form action="loginAction.jsp" method="post">
			<input type="text" name="username" placeholder="Username" required><br>
			<input type="password" name="password" placeholder="Password"
				required><br> <input type="submit" value="Login">
		</form>
	</div>
</body>
</html>
