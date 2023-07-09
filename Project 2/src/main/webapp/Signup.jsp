<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
</head>
<body>


<%
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String uname = request.getParameter("uname");
String pass = request.getParameter("pass");
String passrepeat = request.getParameter("passrepeat");
String bday= request.getParameter("bday");


if(pass.equals(passrepeat)){
try {
 Class.forName("com.mysql.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
 if(conn==null)
 {
	 out.println("Conn null");
 }
 
 Statement st = conn.createStatement();
 int i = st.executeUpdate("insert into users(uname,fname,lname,bday,pass)values('"+uname+"','" + fname + "','" + lname + "','" + bday + "','" + pass + "')"); 
 st.close();
 
 /* PreparedStatement ps = conn.prepareStatement("insert into pd (uname,fname,lname) values (?,?,?) ");
 ps.setString(1,uname);
 ps.setString(2,fname);
 ps.setString(3,lname);
 int j=ps.executeUpdate();*/
 
 conn.close();
// ResultSet rs=ps.executeQuery();
 response.sendRedirect("2.html");


} catch (Exception e) {
 System.out.print(e);
 e.printStackTrace();
}
}else{
	out.print("Password Mismatch");
}
%>

</body>
</html>