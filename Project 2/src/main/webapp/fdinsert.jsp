<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uname = (String)session.getAttribute("uname");
String email= request.getParameter("email");
String mno=request.getParameter("mob");
long inc =Integer.parseInt(request.getParameter("inc"));
long bjt =Integer.parseInt(request.getParameter("bjt"));

try {
	Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
	 if(conn==null)
	 {
		 out.println("connection empty");
	 }
	PreparedStatement ps = conn.prepareStatement("insert into pd(uname,email,mno,inc,bjt) values (?,?,?,?,?) ");
	 ps.setString(1,uname);
	 ps.setString(2,email);
	 ps.setString(3,mno);
	 ps.setLong(4,inc);
	 ps.setLong(5,bjt);
	 
	 //ResultSet rs=ps.executeQuery();
	 int i=ps.executeUpdate();
	 
	// ResultSet rs=ps.executeQuery();
	 
	 response.sendRedirect("4.html");

	 conn.close();
} catch (Exception e) {
	 System.out.print(e);
	 e.printStackTrace();
	}
%>
</body>
</html>