<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forget password</title>
</head>
<body>
<%

String uname = request.getParameter("uname");
String bday= request.getParameter("bday");
String pass = request.getParameter("pass");
String passrepeat = request.getParameter("passrepeat");


try {
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
	 if(conn!=null)
	 {
		// out.println("Conn not null");
	 }
	PreparedStatement ps = conn.prepareStatement("select * from users where uname=? and bday=?");
	ps.setString(1, uname);
	ps.setString(2,bday);
	ResultSet rs = ps.executeQuery();
	
	
		while(rs.next())
		{
		String uname1   = rs.getString("uname");
		String bday1 = rs.getString("bday");
		}
	
	//if(uname==uname1 && bday==bday1)
		
			if(pass.equals(passrepeat))
			{
			//	Statement st = conn.createStatement();
				// int i = st.executeUpdate("Update users set pass='"+pass+"'where uname="+uname); 
				 //st.close();
				 
				PreparedStatement ps1 = conn.prepareStatement("Update users set pass=? where uname=?");
				ps1.setString(1, pass);
				ps1.setString(2,uname);
				int i=ps1.executeUpdate();
				out.println("Updated successfully");
			}else{
				out.println("pass not match");
			}
		
		
		
}catch (Exception e) {
	 System.out.print(e);
	 e.printStackTrace();
	}
%>

</body>
</html>