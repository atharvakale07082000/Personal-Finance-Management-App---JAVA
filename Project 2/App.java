

import java.io.File;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Preparing to send message......" );
        String message="hello, Dear, this is message for security check .";
        String subject="CodersArea : Confirmation";
        String to="sb30092001@gmail.com";
        String from = "1132220959@mitwpu.edu.in";
        
        sendEmail(message,subject,to,from);																																																						
     //  sendAttach(message,subject,to,from);
	
    }
    //this is responsible to send attachment
/*private static void sendAttach(String message, String subject, String to, String from) {
		// TODO Auto-generated method stub
	// variable for gmail host
			String host="smtp.gmail.com";
			//get the system properties
			Properties properties = System.getProperties();
			System.out.println("Properties"+properties);
			
			//Setting important information to properties
			//host set
			properties.put("mail.smtp.host", host);
			properties.put("mail.smtp.port", "465");
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
			properties.put("mail.smtp.starttls.enable", "true");
			
			properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

			
			
		
			//Step 1: to get the session object
		Session session=Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication("1132220959@mitwpu.edu.in","Rohit@30");
			}
		
	
		
	});
		session.setDebug(true);
		//Step to compose (test
		MimeMessage mimeMessage = new MimeMessage(session);
		
		
		//from email
		try {
			
		
		mimeMessage.setFrom(from);
		
		//adding recipient
		mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		
		//setting the subject
		mimeMessage.setSubject(subject);
		
		//Attachment
		// file path
		String path="";
		MimeMultipart mimemulti = new MimeMultipart();
		MimeBodyPart textMime=new MimeBodyPart();
		
		MimeBodyPart fileMime=new MimeBodyPart();
		
		try {
			textMime.setText(message);
			File file =new File(path);
			fileMime.attachFile(file);
			
			mimemulti.addBodyPart(textMime);
			mimemulti.addBodyPart(fileMime);
			
			
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		mimeMessage.setContent(mimemulti);

		//send 
		Transport.send(mimeMessage);
		
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		
		
		
	
		
		System.out.println("Sent Successfully");
		
		
	}*/
	// This is responsible to send email
	private static void sendEmail(String message, String subject, String to, String from) {
		// TODO Auto-generated method stub
		// variable for mail host
		String host="smtp.gmail.com";
		//get the system properties
		Properties properties = System.getProperties();
		System.out.println("Properties"+properties);
		
		//Setting important information to properties
		//host set
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		properties.put("mail.smtp.starttls.enable", "true");
		
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		
		
	
		//Step 1: to get the session object
	Session session=Session.getInstance(properties, new Authenticator() {

		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			// TODO Auto-generated method stub
			return new PasswordAuthentication("1132220959@mitwpu.edu.in","Rohit@30");
		}
	});
	session.setDebug(true);
	//Step to compose (test
	MimeMessage mimeMessage = new MimeMessage(session);
	
	
	//from email
	try {
		
	
	mimeMessage.setFrom(from);
	
	//adding recipient
	mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	
	//setting the subject
	mimeMessage.setSubject(subject);
	
	//adding text to message
	mimeMessage.setText(message);
	
	//send 
	Transport.send(mimeMessage);
	System.out.println("Sent Successfully");
	
	
	}catch(Exception e) {
		e.printStackTrace();
		
	
	
		
	}

	
}

	
}		
	

