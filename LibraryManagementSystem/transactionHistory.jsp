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
<title>Transaction History</title>
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

form input[type="text"], form input[type="date"] {
	margin: 8px 8px 8px 0;
}

form input[type="submit"], form button {
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Transaction History</h2>

		<form method="get" action="transactionHistory.jsp" class="filter-bar"
			id="filterForm">
			<input type="text" name="title" placeholder="Book Title"
				value="<%=request.getParameter("title") != null ? request.getParameter("title") : ""%>">
			<input type="text" name="member" placeholder="Member Name"
				value="<%=request.getParameter("member") != null ? request.getParameter("member") : ""%>">
			<input type="date" name="start_date" class="compact-select"
				value="<%=request.getParameter("start_date") != null ? request.getParameter("start_date") : ""%>">
			<input type="date" name="end_date" class="compact-select"
				value="<%=request.getParameter("end_date") != null ? request.getParameter("end_date") : ""%>">
			<input type="submit" value="Search">
			<button type="button" onclick="resetFilter()">Reset</button>
		</form>

		<script>
			function resetFilter() {
				const form = document.getElementById("filterForm");
				form.reset();
				window.location.href = form.action;
			}
		</script>

		<table>
			<tr>
				<th>ID</th>
				<th>Book</th>
				<th>Member</th>
				<th>Issue Date</th>
				<th>Return Date</th>
				<th>Status</th>
			</tr>

			<%
			String title = request.getParameter("title");
			String member = request.getParameter("member");
			String startDate = request.getParameter("start_date");
			String endDate = request.getParameter("end_date");

			try {
				Connection con = DBConnection.getConnection();
				String sql = "SELECT t.id, b.title, m.name, t.issue_date, t.return_date, t.status " + "FROM transactions t "
				+ "JOIN books b ON t.book_id = b.id " + "JOIN members m ON t.member_id = m.id WHERE 1=1";

				if (title != null && !title.trim().isEmpty()) {
					sql += " AND b.title LIKE ?";
				}
				if (member != null && !member.trim().isEmpty()) {
					sql += " AND m.name LIKE ?";
				}
				if (startDate != null && !startDate.trim().isEmpty()) {
					sql += " AND t.issue_date >= ?";
				}
				if (endDate != null && !endDate.trim().isEmpty()) {
					sql += " AND t.issue_date <= ?";
				}

				sql += " ORDER BY t.id ASC";
				PreparedStatement ps = con.prepareStatement(sql);
				int idx = 1;

				if (title != null && !title.trim().isEmpty()) {
					ps.setString(idx++, "%" + title + "%");
				}
				if (member != null && !member.trim().isEmpty()) {
					ps.setString(idx++, "%" + member + "%");
				}
				if (startDate != null && !startDate.trim().isEmpty()) {
					ps.setDate(idx++, java.sql.Date.valueOf(startDate));
				}
				if (endDate != null && !endDate.trim().isEmpty()) {
					ps.setDate(idx++, java.sql.Date.valueOf(endDate));
				}

				ResultSet rs = ps.executeQuery();
				boolean hasResults = false;

				while (rs.next()) {
					hasResults = true;
			%>
			<tr>
				<td><%=rs.getInt("id")%></td>
				<td><%=rs.getString("title")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getDate("issue_date")%></td>
				<td><%=rs.getDate("return_date") != null ? rs.getDate("return_date") : "Not returned"%></td>
				<td><%=rs.getDate("return_date") != null ? "Returned" : "Issued"%></td>
			</tr>
			<%
			}

			if (!hasResults) {
			out.println("<tr><td colspan='6'>No transactions found.</td></tr>");
			}

			rs.close();
			ps.close();
			con.close();
			} catch (Exception e) {
			out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
			}
			%>
		</table>
	</div>
</body>
</html>
