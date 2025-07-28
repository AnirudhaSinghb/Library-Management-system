<%@ page import="java.sql.*"%>
<%@ page import="db.DBConnection"%>
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
<title>Issue Book</title>
<link rel="stylesheet" href="style.css">
<style>
select {
	padding: 12px;
	width: 100%;
	max-width: 400px;
	margin: 12px 0;
	border: 1px solid #d2d2d7;
	border-radius: 12px;
	background-color: #fff;
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.05);
	transition: all 0.3s ease;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Issue Book</h2>

		<form action="issueBookAction.jsp" method="post">
			<select name="member_id" class="compact-select" required>
				<option value="">-- Select Member --</option>
				<%
				try {
					Connection con = DBConnection.getConnection();
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT * FROM members");

					while (rs.next()) {
				%>
				<option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
				<%
				}
				rs.close();
				stmt.close();
				con.close();
				} catch (Exception e) {
				out.println("<option>Error: " + e.getMessage() + "</option>");
				}
				%>
			</select> <select name="book_id" class="compact-select" required>
				<option value="">-- Select Book --</option>
				<%
				try {
					Connection con = DBConnection.getConnection();
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT * FROM books WHERE available > 0");

					while (rs.next()) {
				%>
				<option value="<%=rs.getInt("id")%>"><%=rs.getString("title")%></option>
				<%
				}
				rs.close();
				stmt.close();
				con.close();
				} catch (Exception e) {
				out.println("<option>Error: " + e.getMessage() + "</option>");
				}
				%>
			</select> <input type="submit" value="Issue Book">
		</form>
	</div>
</body>
</html>
