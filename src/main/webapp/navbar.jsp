<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<style>
.navbar {
	background-color: #2e86de;
	padding: 15px;
	text-align: center;
}

.navbar a {
	color: white;
	margin: 0 15px;
	text-decoration: none;
	font-weight: bold;
}

.navbar a:hover {
	text-decoration: underline;
}
</style>

<div class="navbar">
	<a href="index.jsp">Home</a> <a href="addBook.jsp">Add Book</a> <a
		href="viewBooks.jsp">View Books</a> <a href="addMember.jsp">Add
		Member</a> <a href="issueBook.jsp">Issue Book</a> <a href="returnBook.jsp">Return
		Book</a>
		<%
    if (session.getAttribute("admin") != null) {
%>
    <a href="logout.jsp">Logout</a>
<%
    }
%>
</div>