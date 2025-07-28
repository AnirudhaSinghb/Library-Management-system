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
<title>View Members</title>
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
		<h2>All Members</h2>

		<form method="get" action="viewMembers.jsp" class="filter-bar"
			id="filterMembersForm">
			<input type="text" name="name" placeholder="Search by Name"
				value="<%=request.getParameter("name") != null ? request.getParameter("name") : ""%>">
			<input type="text" name="email" placeholder="Search by Email"
				value="<%=request.getParameter("email") != null ? request.getParameter("email") : ""%>">
			<input type="text" name="phone" placeholder="Search by Phone"
				value="<%=request.getParameter("phone") != null ? request.getParameter("phone") : ""%>">
			<input type="submit" value="Search">
			<button type="button" onclick="resetMemberFilter()">Reset</button>
		</form>

		<script>
			function resetMemberFilter() {
				document.getElementById("filterMembersForm").reset();
				window.location.href = "viewMembers.jsp";
			}
		</script>

		<table>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Phone</th>
			</tr>

			<%
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");

			try {
				Connection con = DBConnection.getConnection();

				String sql = "SELECT * FROM members WHERE 1=1";
				if (name != null && !name.trim().isEmpty()) {
					sql += " AND name LIKE ?";
				}
				if (email != null && !email.trim().isEmpty()) {
					sql += " AND email LIKE ?";
				}
				if (phone != null && !phone.trim().isEmpty()) {
					sql += " AND phone LIKE ?";
				}

				PreparedStatement ps = con.prepareStatement(sql);

				int paramIndex = 1;
				if (name != null && !name.trim().isEmpty()) {
					ps.setString(paramIndex++, "%" + name + "%");
				}
				if (email != null && !email.trim().isEmpty()) {
					ps.setString(paramIndex++, "%" + email + "%");
				}
				if (phone != null && !phone.trim().isEmpty()) {
					ps.setString(paramIndex++, "%" + phone + "%");
				}

				ResultSet rs = ps.executeQuery();
				boolean hasResults = false;

				while (rs.next()) {
					hasResults = true;
			%>
			<tr>
				<td><%=rs.getInt("id")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("email")%></td>
				<td><%=rs.getString("phone")%></td>
			</tr>
			<%
			}

			if (!hasResults) {
			out.println("<tr><td colspan='4'>No members found.</td></tr>");
			}

			rs.close();
			ps.close();
			con.close();
			} catch (Exception e) {
			out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
			}
			%>
		</table>
	</div>
</body>
</html>
