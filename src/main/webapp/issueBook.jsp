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
<title>Issue Book</title>
</head>
<body>
	<h2>Issue Book</h2>
	<form action="issueBookAction.jsp" method="post">
		Member: <select name="member_id" required>
			<option value="">--Select Member--</option>
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
		</select> <br>
		<br> Book: <select name="book_id" required>
			<option value="">--Select Book--</option>
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
		</select> <br>
		<br> <input type="submit" value="Issue Book">
	</form>
</body>
</html>
