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
<title>Return Book</title>
</head>
<body>
	<h2>Return Issued Book</h2>
	<form action="returnBookAction.jsp" method="post">
		Select Issued Book: <select name="transaction_id" required>
			<option value="">--Select--</option>
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
				<%=rs.getString("title")%> - issued to
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
		</select><br>
		<br> <input type="submit" value="Return Book">
	</form>
</body>
</html>
