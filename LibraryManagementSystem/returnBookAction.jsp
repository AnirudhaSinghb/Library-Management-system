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
int transactionId = Integer.parseInt(request.getParameter("transaction_id"));
LocalDate returnDate = LocalDate.now();

try {
	Connection con = DBConnection.getConnection();

	// Get book_id from transaction
	String fetchBookSql = "SELECT book_id FROM transactions WHERE id = ?";
	PreparedStatement ps1 = con.prepareStatement(fetchBookSql);
	ps1.setInt(1, transactionId);
	ResultSet rs = ps1.executeQuery();

	int bookId = -1;
	if (rs.next()) {
		bookId = rs.getInt("book_id");
	}

	// Set return_date
	String updateTransaction = "UPDATE transactions SET return_date = ?, status = 'returned' WHERE id = ?";
	PreparedStatement ps2 = con.prepareStatement(updateTransaction);
	ps2.setDate(1, java.sql.Date.valueOf(returnDate));
	ps2.setInt(2, transactionId);
	ps2.executeUpdate();

	// Increase book availability
	String updateBook = "UPDATE books SET available = available + 1 WHERE id = ?";
	PreparedStatement ps3 = con.prepareStatement(updateBook);
	ps3.setInt(1, bookId);
	ps3.executeUpdate();

	out.println("<h3>Book returned successfully!</h3>");

	rs.close();
	ps1.close();
	ps2.close();
	ps3.close();
	con.close();
} catch (Exception e) {
	out.println("<h3>Error: " + e.getMessage() + "</h3>");
}
%>
<br>
<a href="returnBook.jsp">Return Another Book</a>
