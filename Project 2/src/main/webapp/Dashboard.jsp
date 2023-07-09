<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page
	import=" java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.util.Properties"%>
<%@page
	import=" javax.mail.Message,javax.mail.MessagingException, javax.mail.PasswordAuthentication,javax.mail.Session,javax.mail.Transport, javax.mail.internet.InternetAddress, javax.mail.internet.MimeMessage"%>
        
      
    
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Poppins&display=swap"
	rel="stylesheet">
<style>
.26 { 
	color:rgba(0, 0, 0, 1);
	width:19px;
	height:19px;
	position:absolute;
	left:100px;
	top:281px;
	font-family:Poppins;
	text-align:left;
	font-size:15px;
	letter-spacing:0;
}
.2906_4824 { 
	overflow:hidden;
}
.dashboard { 
	background-image:linear-gradient(0deg, rgba(4.161460697650909, 199.75000709295273, 152.80875474214554, 1) 0%,rgba(104.78020593523979, 206.12500101327896, 181.80224776268005, 0.4427083432674408) 55.72916865348816%,rgba(6.259890496730804, 214.62499290704727, 164.6173658967018, 0) 100%) ;
	width:1200px;
	height:853.3333129882812px;
	position:absolute;
}
.rectangle_38 { 
	background-color:rgba(255, 255, 255, 1);
	width:159px;
	height:200px;
	position:absolute;
	left:380px;
	top:239px;
	border-top-left-radius:15px;
	border-top-right-radius:15px;
	border-bottom-left-radius:15px;
	border-bottom-right-radius:15px;
}
.rectangle_39 { 
	background-color:rgba(255, 255, 255, 1);
	width:159px;
	height:200px;
	position:absolute;
	left:619px;
	top:239px;
	border-top-left-radius:15px;
	border-top-right-radius:15px;
	border-bottom-left-radius:15px;
	border-bottom-right-radius:15px;
}
.rectangle_40 { 
	background-color:rgba(255, 255, 255, 1);
	width:159px;
	height:200px;
	position:absolute;
	left:858px;
	top:239px;
	border-top-left-radius:15px;
	border-top-right-radius:15px; 
	border-bottom-left-radius:15px;
	border-bottom-right-radius:15px;
}
.your_dashboard { 
	color:rgba(0, 0, 0, 1);
	width:245px;
	height:45px;
	position:absolute;
	left:493px;
	top:92px;
	font-family:Poppins;
	text-align:left;
	font-size:30px;
	letter-spacing:0;
}
.billing_dues { 
	color:rgba(0, 0, 0, 1);
	width:91px;
	height:24px;
	position:absolute;
	left:414px;
	top:267px;
	font-family:Poppins;
	text-align:left;
	font-size:16px;
	letter-spacing:0;
}
.download_statement { 
	color:rgba(0, 0, 0, 1);
	width:85px;
	height:58px;
	position:absolute;
	left:902px;
	top:269px;
	font-family:Poppins;
	text-align:left;
	font-size:16px;
	letter-spacing:0;
}
.add_dues { 
	color:rgba(0, 0, 0, 1);
	width:77px;
	height:24px;
	position:absolute;
	left:665px;
	top:268px;
	font-family:Poppins;
	text-align:left;
	font-size:16px;
	letter-spacing:0;
}
.group_23 { 
	width:220px;
	height:772px;
	position:absolute;
	left:49px;
	top:48px;
}
.navbar { 
	background-color:rgba(255, 255, 255, 1);
	width:220px;
	height:772px;
	position:absolute;
	left:0px;
	top:0px;
	border-top-left-radius:18px;
	border-top-right-radius:18px;
	border-bottom-left-radius:18px;
	border-bottom-right-radius:18px;
}
.photo { 
	width:132px;
	height:170px;
	position:absolute;
	left:44px;
	top:66px;
	border-top-left-radius:18px;
	border-top-right-radius:18px;
	border-bottom-left-radius:18px;
	border-bottom-right-radius:18px;
	background-image:url(photo.png);
	background-repeat:no-repeat;
	background-size:cover;
}
.suyash { 
	color:rgba(0, 0, 0, 1);
	width:74px;
	height:30px;
	position:absolute;
	left:73px;
	top:251px;
	font-family:Poppins;
	text-align:left;
	font-size:20px;
	letter-spacing:0;
}
.my_account_settings { 
	width:201.00038146972656px;
	height:37.88738250732422px;
	position:absolute;
	left:10px;
	top:339px;
}
.vector_1 { 
	transform: rotate(0.2529499331762837deg);
	width:201.00233459472656px;
	height:0px;
	position:absolute;
	left:0px;
	top:0px;
	border-radius:18px;
}
.2933_4841 { 
	border:1px solid rgba(0, 0, 0, 1);
}
.vector_2 { 
	transform: rotate(0.2529499331762837deg);
	width:201.00233459472656px;
	height:0px;
	position:absolute;
	left:0px;
	top:37px;
	border-radius:18px;
}
.2933_4842 { 
	border:1px solid rgba(0, 0, 0, 1);
}
.my_account { 
	color:rgba(0, 0, 0, 1);
	width:91.36359405517578px;
	height:27px;
	position:absolute;
	left:54.81814193725586px;
	top:6px;
	font-family:Poppins;
	text-align:left;
	font-size:15px;
	letter-spacing:0;
}
.logout { 
	width:201.00038146972656px;
	height:37.88738250732422px;
	position:absolute;
	left:42px;
	top:200px;
	color:rgba(0, 0, 0, 1);
	font-family:Poppins;
	text-align:left;
	font-size:15px;
	letter-spacing:0;
}
.3047_4834 { 
	border:1px solid rgba(0, 0, 0, 1);
}
.3047_4835 { 
	border:1px solid rgba(0, 0, 0, 1);
}
.rectangle_41 { 
	background-color:rgba(255, 255, 255, 1);
	width:159px;
	height:200px;
	position:absolute;
	left:380px;
	top:496px;
	border-top-left-radius:15px;
	border-top-right-radius:15px;
	border-bottom-left-radius:15px;
	border-bottom-right-radius:15px;
}
.monthly_limit { 
	color:rgba(0, 0, 0, 1);
	width:102px;
	height:24px;
	position:absolute;
	left:409px;
	top:529px;
	font-family:Poppins;
	text-align:left;
	font-size:16px;
	letter-spacing:0;
}
.rectangle_42 { 
	background-color:rgba(255, 255, 255, 1);
	width:159px;
	height:200px;
	position:absolute;
	left:624px;
	top:496px;
	border-top-left-radius:15px;
	border-top-right-radius:15px;
	border-bottom-left-radius:15px;
	border-bottom-right-radius:15px;
}
.update_personal_details { 
	color:rgba(0, 0, 0, 1);
	width:69px;
	height:72px;
	position:absolute;
	left:653px;
	top:517px;
	font-family:Poppins;
	text-align:left;
	font-size:16px;
	letter-spacing:0;
}
.rs_33000 { 
	color:rgba(255, 9.562506079673767, 9.562506079673767, 1);
	width:80px;
	height:27px;
	font-family:Poppins;
	text-align:left;
	font-size:18px;
	letter-spacing:0;
	position:absolute;
	top:167px;
	left:55px;
}
.rs_50000 { 
	color:rgba(20.01927137374878, 71.24753728508949, 252.87500202655792, 1);
	width:81px;
	height:27px;
	font-family:Poppins;
	text-align:left;
	font-size:18px;
	letter-spacing:0;
	position:absolute;
	top:167px;
	left:60px;
}
</style>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>
<div class=dashboard>
<%
;
String uname = (String)session.getAttribute("uname");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
	PreparedStatement ps1 = conn1.prepareStatement("select Sum(amt) from bill where uname=?");
	 ps1.setString(1,uname);
	 ResultSet rs1=ps1.executeQuery();
	 
	 while(rs1.next())
	 {
		 int sum = rs1.getInt(1);
		// session.setAttribute("bill",sum);
	
		 %><div class=dashboard>
              <div  class="rectangle_38"><span class=rs_33000><%out.println(sum);%> </span></div><%
	 }
	 ps1.close();
	 rs1.close();
	 conn1.close();
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
		PreparedStatement ps = conn.prepareStatement("select Sum(amt) from ulim where uname=?");
		 ps.setString(1,uname);
		 ResultSet rs=ps.executeQuery();
		 while(rs.next())
		 {
			 
			 int limsum = rs.getInt(1);
		
			// session.setAttribute("limit",limsum);

			 
	%>
              <div  class="rectangle_39"></div>
              <div  class="rectangle_40"></div>
              <span  class="your_dashboard">Your Dashboard</span>
              <a href="billdues.jsp"  class="billing_dues">Billing Dues</a>
              <a href="pdf_gen.jsp" class="download_statement">Download Statement</a>
              <a href="addbill.html" class="add_dues">Add Dues</a>
              <div class=group_23>
                <div  class="navbar"></div>
                <div  class="photo"></div>
                <span  class="suyash">Suyash</span>
                <div class=my_account_settings>
                  <div  class="vector_1">

                  </div><div  class="vector_2"></div>
                  <a href="fd.jsp"  class="my_account">My Account</a></div>
                  <div class=logout><div  class="vector_1"></div>
                  <div  class="vector_2"></div>
                  <a href="logout.jsp" class="logout">Logout</a></div>
                  <span  class="26">26</span></div>
                  <div  class="rectangle_41">	<span class=rs_50000><%out.println(limsum);%></span>
	<%
		 }
		 ps1.close();
		 rs1.close();
		 conn1.close();
	//	 int billdues=(int)session.getAttribute("bill");
	//	 int limit =(int)session.getAttribute("limsum");
		
	
} catch (Exception e) {
	 System.out.print(e);
	 e.printStackTrace();
	}

%>

</div>
                  <a  href="monthlimit.html" class="monthly_limit">Monthly limit</a>
                  <div  class="rectangle_42"></div>
                  <a href="fdinsert.html" class="update_personal_details">update Personal Details</a>
                </div>
</body>
</html>
