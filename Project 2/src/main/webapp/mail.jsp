<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import=" java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.util.Properties"%>
<%@page
	import=" javax.mail.Message,javax.mail.MessagingException, javax.mail.PasswordAuthentication,javax.mail.Session,javax.mail.Transport, javax.mail.internet.InternetAddress, javax.mail.internet.MimeMessage"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
	String uname = (String) session.getAttribute("uname");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
		PreparedStatement ps = conn.prepareStatement("select * from pd where uname=?");
		ps.setString(1, uname);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {

			String email = rs.getString("email");
			out.println(uname);
			out.println(email);

			if (email != null) {
		// Recipient's email ID needs to be mentioned.
		String to = String.valueOf(email);
		out.println(to);
		// Sender's email ID needs to be mentioned
		String from = "1132220959@mitwpu.edu.in";

		// Assuming you are sending email from through gmails smtp
		String host = "smtp.gmail.com";

		// Get system properties
		Properties properties = System.getProperties();

		// Setup mail server
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		properties.put("mail.smtp.starttls.enable", "true");

		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		// Get the Session object.// and pass username and password
		Session session1 = Session.getInstance(properties, new javax.mail.Authenticator() {

			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication("1132220959@mitwpu.edu.in", "Rohit@30");

			}

		});

		// Used to debug SMTP issues
		session1.setDebug(true);

		// Create a default MimeMessage object.
		MimeMessage message = new MimeMessage(session1);

		// Set From: header field of the header.
		message.setFrom(new InternetAddress(from));

		// Set To: header field of the header.
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

		// Set Subject: header field
		message.setSubject("Warning!!!!!!!!!!!!");

		// Now set the actual message
		message.setText("You have breached some limit.");

		// Send message
		Transport.send(message);
		response.sendRedirect("6.html");

			} else {
		response.sendRedirect("7.html");

			}

		}

	} catch (MessagingException mex) {
		mex.printStackTrace();
	}
	%>
</body>
</html>