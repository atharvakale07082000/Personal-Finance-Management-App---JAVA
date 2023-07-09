<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MonthLimit</title>
</head>
<body>
<%
String uname = (String)session.getAttribute("uname");
String cat= request.getParameter("cat");
String month = request.getParameter("month");
int amt =Integer.parseInt(request.getParameter("amt"));

try {
	Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
	 if(conn==null)
	 {
		 out.println("connection empty");
	 }
	PreparedStatement ps = conn.prepareStatement("insert into ulim(uname,month,cat,amt) values (?,?,?,?) ");
	 ps.setString(1,uname);
	 ps.setString(2,month);
	 ps.setString(3,cat);
	 ps.setInt(4,amt);
	 
	 //ResultSet rs=ps.executeQuery();
	 int i=ps.executeUpdate();
	 
	// ResultSet rs=ps.executeQuery();
	 
	 response.sendRedirect("3.html");

	 conn.close();
} catch (Exception e) {
	 System.out.print(e);
	 e.printStackTrace();
	}


%>
</body>
</html>