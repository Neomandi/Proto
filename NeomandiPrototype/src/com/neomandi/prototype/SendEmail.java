package com.neomandi.prototype;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail {
	
	public static void mail(String email, String id, String pass) 
	{

	 String to= email;//change accordingly
	
	 //Get the session object
	  Properties props = new Properties();
	  props.put("mail.smtp.host", "sg2plcpnl0013.prod.sin2.secureserver.net"); //Outlook
	  props.put("mail.smtp.socketFactory.port", "465");
	  props.put("mail.smtp.socketFactory.class",
	        	"javax.net.ssl.SSLSocketFactory");
	  props.put("mail.smtp.auth", "true");
	  props.put("mail.smtp.port", "465");
	 
	  Session session = Session.getDefaultInstance(props,
	   new javax.mail.Authenticator() {
	   protected PasswordAuthentication getPasswordAuthentication() 
	   {
		   return new PasswordAuthentication("support@neomandi.com","$Upport1357");//change accordingly
	   }
	  });
	 
	//compose message
	  try 
	  {
	   
		   MimeMessage message = new MimeMessage(session);
		   message.setFrom(new InternetAddress("support@neomandi.com"));//change accordingly 
		   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
		   message.setSubject("Welcome mail");
		   message.setText("Thanks for registering at Neomandi Technologies.Your user id will be your aadhar number: "+id+" and Password: "+pass);
		   
		   //send message
		   Transport.send(message);
		
		   System.out.println("message sent successfully");
		 
	  } 
	  catch (MessagingException e) 
	  {
		  throw new RuntimeException(e);
	  }
	 
	}
}

