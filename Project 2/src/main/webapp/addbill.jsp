<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Addbill</title>
</head>
<body>
<%
	String uname = (String)session.getAttribute("uname");

String bilname = request.getParameter("bilname");
String cat = request.getParameter("cat");
int amt = Integer.parseInt(request.getParameter("amt"));

try {
	Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
	PreparedStatement ps = conn.prepareStatement("insert into bill (uname,bilname,cat,amt) values (?,?,?,?) ");
	 ps.setString(1,uname);
	 ps.setString(2,bilname);
	 ps.setString(3,cat);
	 ps.setInt(4,amt);
	 int i=ps.executeUpdate();
	 
	// ResultSet rs=ps.executeQuery();
	 conn.close();
	 response.sendRedirect("1.html");

} catch (Exception e) {
	 System.out.print(e);
	 e.printStackTrace();
	}

%>	
</body>
</html>