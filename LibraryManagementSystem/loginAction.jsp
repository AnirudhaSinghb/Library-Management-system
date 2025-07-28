<%@ page import="java.sql.*"%>
<%@ page import="db.DBConnection"%>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

try {
	Connection con = DBConnection.getConnection();
	String sql = "SELECT * FROM admin WHERE username=? AND password=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, username);
	ps.setString(2, password);
	ResultSet rs = ps.executeQuery();

	if (rs.next()) {
		String role = rs.getString("role");
		session.setAttribute("admin", username);
		session.setAttribute("role", role);
		response.sendRedirect("index.jsp");
	} else {
		out.println("<h3>Invalid credentials</h3>");
		out.println("<a href='login.jsp'>Try again</a>");
	}

	rs.close();
	ps.close();
	con.close();
} catch (Exception e) {
	out.println("<h3>Error: " + e.getMessage() + "</h3>");
}
%>