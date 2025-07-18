<%@ page import="java.sql.*"%>
<%@ page import="db.DBConnection"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<jsp:include page="navbar.jsp" />
<%

String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");

try {
	Connection con = DBConnection.getConnection();
	String sql = "INSERT INTO members (name, email, phone) VALUES (?, ?, ?)";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, phone);
	int result = ps.executeUpdate();

	if (result > 0) {
		out.println("<h3>Member added successfully!</h3>");
	} else {
		out.println("<h3>Failed to add member.</h3>");
	}

	ps.close();
	con.close();
} catch (Exception e) {
	out.println("<h3>Error: " + e.getMessage() + "</h3>");
}
%>
<br>
<a href="addMember.jsp">Add Another Member</a>
