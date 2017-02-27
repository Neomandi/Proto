package com.neomandi.prototype;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.LocalTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

/**
 * Servlet implementation class SchedulerServlet
 */
public class SchedulerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SchedulerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public static void process(String a, String b, boolean c)
	{
		try {
			init(a, b, c);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void init(String a, String b, boolean c) throws ServletException {
		
		System.out.println("SchedulerServlet init()......");
		JobDetail job = JobBuilder.newJob(QuartzJob.class).build();
		
		//Trigger t1 = TriggerBuilder.newTrigger().withIdentity("Simple Trigger").startNow().build();

		//Trigger t1 = TriggerBuilder.newTrigger().withIdentity("CroneTrigger").withSchedule(CronScheduleBuilder.cronSchedule("	0 0 14 1/1 * ? *")).build();
		
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
		String date = format1.format(new Date());
		//System.out.println(format1.format(new Date()));
		
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
		String time = timeFormat.format(new Date());
		Date s1t = null;
		
		
		//System.out.println("Time: "+time);
		
		DateTimeFormatter formatter1 = DateTimeFormat.forPattern("HH:mm:ss");
        LocalTime time1 = formatter1.parseLocalTime(time);
        time1 = time1.plusMinutes(10);
		
		
		//System.out.println("Time + 10min: "+time1);
		
		try {
			s1t = format.parse(date+" "+a);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date e1t = null;;
		try {
			e1t = format.parse(date+" "+b);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(s1t);
		
		SimpleScheduleBuilder.simpleSchedule();
		Trigger t1 = TriggerBuilder.newTrigger().withIdentity("SimpleTrigger").withSchedule(SimpleScheduleBuilder.repeatSecondlyForever()).startAt(s1t).endAt(e1t).build();
		Scheduler sc = null;
		try {
			sc = StdSchedulerFactory.getDefaultScheduler();
		} catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Start time: "+t1.getStartTime());
		System.out.println("End time: "+t1.getEndTime());
		
		//System.out.println("The Trigger Time: "+s1t);
		
		String dt = format.format(new Date());
		
		boolean flag = c;
		
		if(flag == true)
		{
			try {
				sc.start();
			} catch (SchedulerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				sc.scheduleJob(job, t1);
			} catch (SchedulerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			//System.out.println("End time: "+t1.getEndTime());
		}
		else
		{
			try {
				sc.shutdown();
				System.out.println("Job shutdown");
			} catch (SchedulerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}