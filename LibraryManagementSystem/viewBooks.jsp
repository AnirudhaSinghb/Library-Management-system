<%@ page import="java.sql.*"%>
<%@ page import="db.DBConnection"%>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Books</title>
<link rel="stylesheet" href="style.css">
<style>
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 30px;
}

th, td {
	padding: 14px;
	border-bottom: 1px solid #e5e5ea;
	text-align: center;
}

th {
	background-color: #f5f5f7;
	color: #6e6e73;
	font-size: 14px;
	letter-spacing: 0.5px;
}

form {
	margin-top: 20px;
}

form input[type="text"] {
	margin: 8px 8px 8px 0;
}

form input[type="submit"], form button {
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>All Books</h2>

		<form method="get" action="viewBooks.jsp" class="filter-bar"
			id="filterBooksForm">
			<input type="text" name="title" placeholder="Search by Title"
				value="<%=request.getParameter("title") != null ? request.getParameter("title") : ""%>">
			<input type="text" name="author" placeholder="Search by Author"
				value="<%=request.getParameter("author") != null ? request.getParameter("author") : ""%>">
			<input type="submit" value="Search">
			<button type="button" onclick="resetBookFilter()">Reset</button>
		</form>

		<script>
			function resetBookFilter() {
				document.getElementById("filterBooksForm").reset();
				window.location.href = "viewBooks.jsp";
			}
		</script>

		<table>
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Author</th>
				<th>Quantity</th>
				<th>Available</th>
			</tr>

			<%
			String title = request.getParameter("title");
			String author = request.getParameter("author");

			try {
				Connection con = DBConnection.getConnection();

				String sql = "SELECT * FROM books WHERE 1=1";
				if (title != null && !title.trim().isEmpty()) {
					sql += " AND title LIKE ?";
				}
				if (author != null && !author.trim().isEmpty()) {
					sql += " AND author LIKE ?";
				}

				PreparedStatement ps = con.prepareStatement(sql);

				int paramIndex = 1;
				if (title != null && !title.trim().isEmpty()) {
					ps.setString(paramIndex++, "%" + title + "%");
				}
				if (author != null && !author.trim().isEmpty()) {
					ps.setString(paramIndex++, "%" + author + "%");
				}

				ResultSet rs = ps.executeQuery();

				boolean hasResults = false;
				while (rs.next()) {
					hasResults = true;
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

			if (!hasResults) {
			out.println("<tr><td colspan='5'>No books found.</td></tr>");
			}

			rs.close();
			ps.close();
			con.close();
			} catch (Exception e) {
			out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
			}
			%>
		</table>
	</div>
</body>
</html>
