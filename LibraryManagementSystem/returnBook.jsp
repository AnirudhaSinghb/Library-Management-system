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
<title>Return Book</title>
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
		<h2>Return Issued Book</h2>

		<form action="returnBookAction.jsp" method="post">
			<select name="transaction_id" class="compact-select" required>
				<option value="">-- Select Issued Book --</option>
				<%
				try {
					Connection con = DBConnection.getConnection();
					String sql = "SELECT t.id, b.title, m.name FROM transactions t " + "JOIN books b ON t.book_id = b.id "
					+ "JOIN members m ON t.member_id = m.id " + "WHERE t.return_date IS NULL";
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(sql);

					while (rs.next()) {
				%>
				<option value="<%=rs.getInt("id")%>">
					<%=rs.getString("title")%> issued to
					<%=rs.getString("name")%>
				</option>
				<%
				}
				rs.close();
				stmt.close();
				con.close();
				} catch (Exception e) {
				out.println("<option>Error: " + e.getMessage() + "</option>");
				}
				%>
			</select> <input type="submit" value="Return Book">
		</form>
	</div>
</body>
</html>
