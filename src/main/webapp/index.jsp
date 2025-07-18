<%@ page import="java.sql.*"%>
<%@ page import="db.DBConnection"%>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<title>Library Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	padding: 40px;
	background: #f2f2f2;
	text-align: center;
}

h1 {
	color: #2e86de;
}

.card {
	background: white;
	padding: 20px;
	border-radius: 15px;
	display: inline-block;
	margin: 15px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	width: 200px;
}

.links {
	margin-top: 30px;
}

.links a {
	display: block;
	margin: 10px;
	text-decoration: none;
	color: #2e86de;
	font-weight: bold;
}
</style>
</head>
<body>
	<h1>Library Management Dashboard</h1>

	<div class="card">
		<h2>Total Books</h2>
		<%
		try {
			Connection con = DBConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM books");
			if (rs.next())
				out.println("<h3>" + rs.getInt(1) + "</h3>");
			rs.close();
			st.close();
			con.close();
		} catch (Exception e) {
			out.println("<h3>Err</h3>");
		}
		%>
	</div>

	<div class="card">
		<h2>Total Members</h2>
		<%
		try {
			Connection con = DBConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM members");
			if (rs.next())
				out.println("<h3>" + rs.getInt(1) + "</h3>");
			rs.close();
			st.close();
			con.close();
		} catch (Exception e) {
			out.println("<h3>Err</h3>");
		}
		%>
	</div>

	<div class="card">
		<h2>Issued Books</h2>
		<%
		try {
			Connection con = DBConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM transactions WHERE return_date IS NULL");
			if (rs.next())
				out.println("<h3>" + rs.getInt(1) + "</h3>");
			rs.close();
			st.close();
			con.close();
		} catch (Exception e) {
			out.println("<h3>Err</h3>");
		}
		%>
	</div>

	<div class="links">
		<a href="viewBooks.jsp"> View Books</a> 
	</div>
</body>
</html>