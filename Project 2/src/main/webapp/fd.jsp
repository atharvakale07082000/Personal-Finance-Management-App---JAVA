<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
.table, th, td {
  padding: 10px;
  border: 1px solid;
  text-align: center;
  width: 50%;
  
}
 .body {background: #E5E5E5; }
 .monthlylimit { 
	background-color:rgba(205.06250202655792, 255, 243.01500231027603, 0.3100000023841858);
	width:1400px;
	height:995.5599975585938px;
	position:absolute;
}

.save { 
	position: relative;
	width: 153px;
	height: 60px;
	
	background-color:rgba(255, 87.00000241398811, 34.00000177323818, 1);
	border-top-left-radius:10px;
	border-top-right-radius:10px;
	border-bottom-left-radius:10px;
	border-bottom-right-radius:10px;}
	
.ip { 
	box-shadow:0px 4px 4px rgba(0, 0, 0, 0.25);
	transform: rotate(-0.4377002133857201deg);
	background-color:rgba(255, 255, 255, 1);
	width:340.897705078125px;
	height:53.65593719482422px;
	position:relative;
	
	border-top-left-radius:10px;
	border-top-right-radius:10px;
	border-bottom-left-radius:10px;
	border-bottom-right-radius:10px;
}	
</style>
<meta charset="UTF-8">
<title>Personal Details2</title>
</head>
<body>
   <div class=monthlylimit>

<%
String uname = (String)session.getAttribute("uname");
try{
  
 
 Class.forName("com.mysql.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
 PreparedStatement ps = conn.prepareStatement("select * from users where uname=?");
 ps.setString(1,uname);
	ResultSet rs = ps.executeQuery();
	
	
	while(rs.next()){	
	String fname = (String)rs.getString("fname");
	String lname = (String)rs.getString("lname");
%>	
<table>
<tr>
<th>First Name</th>
<td><% out.println(fname);%></td>
</tr>
<tr>
<th>Last Name</th>
<td><% out.println(lname); %></td>
</tr>



<%
	}
	conn.close();
	ps.close();
	rs.close();
	Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");

	PreparedStatement ps1 = conn1.prepareStatement("select * from pd where uname=?");
	ps1.setString(1,uname);
	ResultSet rs1 = ps1.executeQuery();
	while(rs1.next()){	
		String email= (String)rs1.getString("email");
		String mno = (String)rs1.getString("mno");
		String inc = (String)rs1.getString("inc");
		String bjt = (String)rs1.getString("bjt");

%>
<tr><th>Email</th><td><%		out.println(email);%></td></tr>
<tr><th>Mobile</th><td><%		out.println(mno);%></td></tr>

<tr><th>Income</th><td><%		out.println(inc);%></td></tr>

<tr><th>Budjet</th>		<td><%		out.println(bjt);%></td></tr>



</table>
<%
		}

 }catch (Exception e) {
	 System.out.print(e);
	 e.printStackTrace();
	}
%>

</body>
</html>