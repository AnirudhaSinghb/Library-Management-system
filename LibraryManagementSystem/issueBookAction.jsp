<%@ page import="java.sql.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="db.DBConnection"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<jsp:include page="navbar.jsp" />
<%
int memberId = Integer.parseInt(request.getParameter("member_id"));
int bookId = Integer.parseInt(request.getParameter("book_id"));
LocalDate issueDate = LocalDate.now();

try {
	Connection con = DBConnection.getConnection();

	// Insert into transactions
	String insertSql = "INSERT INTO transactions (book_id, member_id, issue_date) VALUES (?, ?, ?)";
	PreparedStatement ps = con.prepareStatement(insertSql);
	ps.setInt(1, bookId);
	ps.setInt(2, memberId);
	ps.setDate(3, java.sql.Date.valueOf(issueDate));
	int result = ps.executeUpdate();

	// Reduce available count
	String updateSql = "UPDATE books SET available = available - 1 WHERE id = ?";
	PreparedStatement ps2 = con.prepareStatement(updateSql);
	ps2.setInt(1, bookId);
	ps2.executeUpdate();

	if (result > 0) {
		out.println("<h3>Book issued successfully!</h3>");
	} else {
		out.println("<h3>Failed to issue book.</h3>");
	}

	ps.close();
	ps2.close();
	con.close();
} catch (Exception e) {
	out.println("<h3>Error: " + e.getMessage() + "</h3>");
}
%>
<br>
<a href="issueBook.jsp">Issue Another Book</a>
