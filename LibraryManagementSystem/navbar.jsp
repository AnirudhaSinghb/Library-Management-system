<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" href="style.css">
<style>
.navbar {
	background-color: #ffffff;
	padding: 16px 24px;
	text-align: center;
	border-bottom: 1px solid #e5e5ea;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.03);
}

.navbar a {
	color: #0071e3;
	margin: 0 12px;
	text-decoration: none;
	font-weight: 500;
	font-size: 16px;
	transition: all 0.2s ease-in-out;
}

.navbar a:hover {
	text-decoration: underline;
	color: #005bb5;
}
</style>

<%
String role = (String) session.getAttribute("role");
String admin = (String) session.getAttribute("admin");
%>

<div class="navbar">
	<a href="index.jsp">Home</a> <a href="viewBooks.jsp">View Books</a><a
		href="viewMembers.jsp">View Members</a>

	<%
	if ("admin".equals(role)) {
	%>
	<a href="addBook.jsp">Add Book</a> <a href="addMember.jsp">Add
		Member</a>
	<%
	}
	%>

	<a href="issueBook.jsp">Issue Book</a> <a href="returnBook.jsp">Return
		Book</a> <a href="transactionHistory.jsp">Transaction History</a>

	<%
	if (admin != null) {
	%>
	<a href="logout.jsp">Logout</a>
	<%
	} else {
	%>
	<a href="login.jsp">Login</a>
	<%
	}
	%>
</div>
