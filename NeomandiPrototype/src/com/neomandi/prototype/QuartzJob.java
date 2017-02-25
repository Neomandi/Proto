package com.neomandi.prototype;
import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class QuartzJob implements Job
{
	static int i = 0;
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		/*System.out.println("Hello");
		System.out.println(new Date());*/
		
		System.out.println();
		AggregateAuctionAlogrithm.aggre();
		System.out.println(new Date());		
		/*++i;
		System.out.println("i value: "+i);*/
	}
}