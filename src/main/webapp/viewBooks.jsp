<%@ page import="java.sql.*"%>
<%@ page import="db.DBConnection"%>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<title>View Books</title>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
}
</style>
</head>
<body>
	<h2>All Books</h2>
	<table>
		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>Author</th>
			<th>Quantity</th>
			<th>Available</th>
		</tr>

		<%
		try {
			Connection con = DBConnection.getConnection();
			String sql = "SELECT * FROM books";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt("id")%></td>
			<td><%=rs.getString("title")%></td>
			<td><%=rs.getString("author")%></td>
			<td><%=rs.getInt("quantity")%></td>
			<td><%=rs.getInt("available")%></td>
		</tr>
		<%
		}

		rs.close();
		stmt.close();
		con.close();
		} catch (Exception e) {
		out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
		}
		%>
	</table>
	<br>
</body>
</html>
