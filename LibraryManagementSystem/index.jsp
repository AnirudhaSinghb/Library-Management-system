<%@ page import="java.sql.*"%>
<%@ page import="db.DBConnection"%>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Library Dashboard</title>
<link rel="stylesheet" href="style.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
.dashboard {
	display: flex;
	justify-content: center;
	gap: 30px;
	flex-wrap: wrap;
	margin-top: 30px;
}

.card {
	background-color: #ffffff;
	padding: 30px;
	border-radius: 20px;
	box-shadow: 0 12px 24px rgba(0, 0, 0, 0.08);
	width: 240px;
	text-align: center;
	transition: transform 0.2s ease;
}

.card:hover {
	transform: translateY(-6px);
	box-shadow: 0 16px 32px rgba(0, 0, 0, 0.1);
}

.card h2 {
	color: #6e6e73;
	font-size: 18px;
	margin-bottom: 15px;
}

.card h3 {
	font-size: 36px;
	color: #1d1d1f;
}

.links {
	margin-top: 40px;
}

.links a {
	color: #0071e3;
	font-weight: 500;
	text-decoration: none;
}

.links a:hover {
	text-decoration: underline;
}

#chartContainer {
	max-width: 500px;
	margin: 50px auto;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Library Management Dashboard</h2>

		<div class="dashboard">

			<div class="card">
				<h2>Total Books</h2>
				<%
				int totalBooks = 0;
				try {
					Connection con = DBConnection.getConnection();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM books");
					if (rs.next()) {
						totalBooks = rs.getInt(1);
						out.println("<h3>" + totalBooks + "</h3>");
					}
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
				int issuedBooks = 0;
				try {
					Connection con = DBConnection.getConnection();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM transactions WHERE return_date IS NULL");
					if (rs.next()) {
						issuedBooks = rs.getInt(1);
						out.println("<h3>" + issuedBooks + "</h3>");
					}
					rs.close();
					st.close();
					con.close();
				} catch (Exception e) {
					out.println("<h3>Err</h3>");
				}
				%>
			</div>
		</div>

		<div class="card" style="margin: 30px auto; max-width: 500px;">
			<h2 style="margin-bottom: 20px;">Books Overview</h2>
			<canvas id="bookChart" style="max-height: 300px;"></canvas>
		</div>

		<div class="links">
			<a href="viewBooks.jsp">View All Books</a>
		</div>
	</div>

	<script>
		const totalBooks =
	<%=totalBooks%>
		;
		const issuedBooks =
	<%=issuedBooks%>
		;
		const availableBooks = totalBooks - issuedBooks;

		const ctx = document.getElementById('bookChart').getContext('2d');
		new Chart(ctx, {
			type: 'pie',
			data: {
				labels: ['Available Books', 'Issued Books'],
				datasets: [{
					label: 'Library Book Status',
					data: [availableBooks, issuedBooks],
					backgroundColor: ['#4cd964', '#ff3b30'], // Apple-like green/red
					borderColor: '#fff',
					borderWidth: 2
				}]
			},
			options: {
				responsive: true,
				plugins: {
					legend: {
						position: 'bottom',
						labels: {
							color: '#333',
							font: {
								size: 14,
								weight: '500'
							}
						}
					}
				}
			}
		});
	</script>
</body>
</html>
