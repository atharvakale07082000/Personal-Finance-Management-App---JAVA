<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<%
String uname = request.getParameter("uname");
String pass = request.getParameter("pwd");
try {
	Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
		PreparedStatement ps = conn.prepareStatement("select * from users where uname=? and pass=?");
	 ps.setString(1,uname);
	 ps.setString(2,pass);
	 ResultSet rs=ps.executeQuery();
	 if(rs.next())
		  
	 {
		 	session.setAttribute("uname",uname);
		 	
		 	response.sendRedirect("Dashboard.jsp");
	 }else{
		 response.sendRedirect("5.html");
		 
	 }
	} catch (Exception e) {
	 System.out.print(e);
	 e.printStackTrace();
	}
%>

</body>
</html>
