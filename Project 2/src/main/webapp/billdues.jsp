<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Poppins&display=swap"
	rel="stylesheet"><style>
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
<title>Bill</title>
</head>
<body>
   <div class=monthlylimit>

<%
String uname = (String)session.getAttribute("uname");
try {
	Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
	PreparedStatement ps = conn.prepareStatement("select * from bill where uname=?");
	 ps.setString(1,uname);
	 ResultSet rs=ps.executeQuery();
%>
<table >
<th>Biller Name</th>
<th>Catagory</th>
<th>Amount</th>
<%
	 while(rs.next())
	 {
		String uname1= rs.getString(1);
		String bilname=rs.getString(2);
		String cat=rs.getString(3);
		int amt= rs.getInt(4);
%>	
<tr>
<td>	<%out.println(bilname);%></td>
<td>	<% out.println(cat);%></td>
<td>	<% out.println(amt);%></td>
</tr>
<%
	 }
	// ResultSet rs=ps.executeQuery();
	 conn.close();
	 Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
		PreparedStatement ps1 = conn1.prepareStatement("select Sum(amt) from bill where uname=?");
		 ps1.setString(1,uname);
		 ResultSet rs1=ps1.executeQuery();
		 while(rs1.next())
		 {
			 int sum = rs1.getInt(1); %>
			 
<tr ><th> Total</th>	<td colspan="2"><% out.println(sum);%></td>
<%	
}
		 
} catch (Exception e) {
	 System.out.print(e);
	 e.printStackTrace();
	}

%>
</table>
<form action=catbills.jsp>
 <label for="cat"><b>Choose a bill category:</b></label>
	<select class=ip name="cat">
  	<option value="Grocery & Daily needs">Grocery & Daily needs</option>
  	<option value="Insurance & Finance">Insurance & Finance</option>
  	<option value="Travelling">Travelling</option>
  	<option value="Health">Health</option>
  	<option value="Education">Education</option>
  	<option value="Charity">Charity</option>
  	<option value="Adventure & Fun">Adventure & Fun</option>
  	<option value="Misscellaneous">Misscellaneous</option>
  	</select>
  	 <button class= save type="submit" >View</button>
 </form>
</body>
</html>