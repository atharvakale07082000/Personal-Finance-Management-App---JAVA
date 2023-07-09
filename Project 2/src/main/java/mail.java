
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class mail {

	public static void main(String[] args) {
		String myname=session.get
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
			PreparedStatement ps = conn.prepareStatement("select * from pd");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String uname = rs.getString("uname");
				String email = rs.getString("email");

				if (uname == myname) {
					// Recipient's email ID needs to be mentioned.
					String to = "sb30092001@gmail.com";

					// Sender's email ID needs to be mentioned
					String from = "1132220912@mitwpu.edu.in";

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
					Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

						protected PasswordAuthentication getPasswordAuthentication() {

							return new PasswordAuthentication("1132220912@mitwpu.edu.in", "Test@12345");

						}

					});

					// Used to debug SMTP issues
					session.setDebug(true);

					// Create a default MimeMessage object.
					MimeMessage message = new MimeMessage(session);

					// Set From: header field of the header.
					message.setFrom(new InternetAddress(from));

					// Set To: header field of the header.
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

					// Set Subject: header field
					message.setSubject("Warning!!!!!!!!!!!!");

					// Now set the actual message
					message.setText("You have breached some limit.");

					System.out.println("sending...");
					// Send message
					Transport.send(message);
					System.out.println("Sent message successfully....");
				}

			}

		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
}