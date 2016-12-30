package com.neomandi.prototype;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.joda.time.DateTime;

public class TimeSlots {

  public static String time(String st) throws ParseException {

	  
	SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss.SSS");
	
	String dateStart = st;
	System.out.println("Time Slot: "+st);
	//String dateStop = "01/14/2012 09:20:00";
	
	SimpleDateFormat dformat = new SimpleDateFormat("MM/dd/yyyy");
	String date=dformat.format(new Date());
	
	//System.out.println("Today's date "+date);
	
	Date s1t = format.parse(date+" "+"10:15:00.000");
	Date s2t = format.parse(date+" "+"10:25:00.000");
	Date s3t = format.parse(date+" "+"10:35:00.000");
	Date s4t = format.parse(date+" "+"10:45:00.000");

	

	Date d1 = null;
	Date d2 = null;

	try {
		d1 = format.parse(dateStart);
		//d2 = format.parse(dateStop);

		DateTime dt1 = new DateTime(d1);
		//DateTime dt2 = new DateTime(d2);
		
		DateTime dst1 = new DateTime(s1t);
		DateTime dst2 = new DateTime(s2t);
		DateTime dst3 = new DateTime(s3t);
		DateTime dst4 = new DateTime(s4t);

		/*System.out.print(Days.daysBetween(dt1, dt2).getDays() + " days, ");
		System.out.print(Hours.hoursBetween(dt1, dt2).getHours() % 24 + " hours, ");
		System.out.print(Minutes.minutesBetween(dt1, dt2).getMinutes() % 60 + " minutes, ");
		System.out.print(Seconds.secondsBetween(dt1, dt2).getSeconds() % 60 + " seconds.");*/
		String s1 = "slot1";
		String s2 = "slot2";
		String s3 = "slot3";
		String s4 = "slot4";
		
		System.out.println("The dt1: "+dt1);
		System.out.println("The dst1: "+dst1);
		System.out.println();
		
		if(dt1.isBefore(dst1) || dt1.equals(dst1))
		{
			System.out.println("Belongs to slot 1");
			return s1;
		}
		else if((dt1.isBefore(dst2) && dt1.isAfter(dst1)) || dt1.isEqual(dst2))
		{
			System.out.println("Belongs to slot 2");
			return s2;
		}
		else if((dt1.isBefore(dst3) && dt1.isAfter(dst2)) || dt1.isEqual(dst3))
		{
			System.out.println("Belongs to slot 3");
			return s3;
		}
		else if((dt1.isBefore(dst4) && dt1.isAfter(dst3)) || dt1.isEqual(dst4))
		{
			System.out.println("Belongs to slot 4");
			return s4;
		}
		
	 } 
	catch (Exception e) {
		e.printStackTrace();
	 }
	return "No slot's available. Pls try tomorrow.";
	
  }


}
