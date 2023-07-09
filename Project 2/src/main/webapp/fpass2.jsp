<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String pass = request.getParameter("pass");
String passrepeat = request.getParameter("passrepeat");
	//if(uname==uname1 && bday==bday1)
	try {
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
	 if(conn==null)
	 {
		 out.println("Conn null");
	 }
			if(pass==passrepeat)
			{
				PreparedStatement ps1 = conn.prepareStatement("UPDATE users SET [pass=?] [WHERE uname=? AND bday=?]  ");
				ps1.setString(1, pass);
				ps1.setString(2,uname);
				ps1.setString(3,bday);
				ResultSet rs1 = ps1.executeQuery();
			}
		
		
		
}catch (Exception e) {
	 System.out.print(e);
	 e.printStackTrace();
	}
%>
</body>
</html>