<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import=" com.neomandi.prototype.JDBCHelper, 
     java.io.PrintWriter,
     java.sql.Connection,
     java.sql.ResultSet,
     java.sql.Statement,
     javax.servlet.ServletException,
	 javax.servlet.http.HttpServlet,
	 javax.servlet.http.HttpServletRequest,
	 javax.servlet.http.HttpServletResponse,
	 java.sql.SQLException,
	 java.text.SimpleDateFormat,
	 java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		
		<style>
		ul {
		    list-style-type: none;
		    margin: 0;
		    padding: 0;
		    overflow: hidden;
		    background-color: white;    
		}
		 li
		{
			display: inline;
		    float: left;
		    
		}
		li a:hover:not(.active) {
		    color: white;
		    
		}
		.active {
		    border: 1px solid black;
		    color: brown;
		    background-color: white;
		    bottom: -3px;    
		    border-bottom: 2px solid white;
		    
		}
		
		 a
		{
		    text-align: center;
		    border: 1px solid black;
		      border-radius: 9px 9px 0 0;
		    background-color: blue;   
			display: inline;
			display: block;
		    color: white;
			width: 100px;
			text-decoration: none;
			padding: 10px 20px;
		}
		ul {
		    list-style-type: none;
		    margin: 0;
		    padding: 0;
		    overflow: hidden;
		    background-color: white;
		    border-radius: 9px 9px 0 0;    
		}
		
		 li
		{
			display: inline;
		    float: left;    
		}
		
		li a:hover:not(.active) {
		    color: white;
		    
		}
		
		.active {
		    border: 1px solid black;
		    color: brown;
		    background-color: white;
		    bottom: -3px;    
		    border-bottom: 2px solid white;    
		}
		
		 a
		{
		    text-align: center;
		    background-color: blue;   
			display: inline;
			display: block;
		    color: white;
			width: 150px;
			text-decoration: none;
			padding: 10px 20px;
		}
		/*
		#navigation_container {
		   margin: 0 auto;
		   width: 960px;
		}
		
		.rectangle {
			width: 1200px;
		   color: white;
		   text-align:center;
		   background: #e5592e;
		   height: 62px;
		   position: relative;
		   -moz-box-shadow: 0px 0px 4px rgba(0,0,0,0.55);
		   box-shadow: 0px 0px 4px rgba(0,0,0,0.55);
		   -webkit-border-radius: 34px;
		   -moz-border-radius: 3px;
		   border-radius: 3px;
		   z-index: 200; /* the stack order: foreground */
		   margin: 3em 0;
		   top: 0px;
		}*/
		</style>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="script.js"></script>
		<script>
		
		</script>
		
	</head>
<body>
	 <%@ include file="Fribbon.jsp" %><br><br>
	
	<ul>
	   	<li><a  href="javascript:window.location = document.referrer;" class="active">Auction</a></li>
	  	<li><a href="Lotdetails.jsp">My Lots</a></li>
		<li><a href="FarmerTradeSummary.jsp">Trade Summary</a>
<<<<<<< HEAD
		
		</li>
=======
		<li> <a  href ="FLogout.do">Logout</a></li>
>>>>>>> branch 'master' of https://github.com/Neomandi/Proto.git
	 </ul>
	
	
	 <%
		
		 HttpSession hs=request.getSession(false);  
	     String pass=(String)hs.getAttribute("pass");  
	    // String time=(String)hs.getAttribute("time");
	     SimpleDateFormat df1=new SimpleDateFormat("hh:mm:ss");
	     String time=df1.format(new Date());
		System.out.println("password="+pass);
		System.out.println("new time="+time);
		HttpSession hs1=request.getSession(false);  
	    hs1.setAttribute("pass",pass); 
		     Connection con = null;
		     Statement statement = null;
		     ResultSet resultSet = null;    
		     ResultSet resultSet1 = null;    
		     con = JDBCHelper.getConnection();
			//display aadhar number 
		     String s="";
			 String name="";
		     try
		     	{	
		     	if(con == null)
		     	{
		     		System.out.println("Connection establish failed");
		     	}
		     	statement = con.createStatement();
		     	String sql = "select aadharnum,name from freg where pass='"+pass+"' ";
		     	//System.out.println(sql);
		     	resultSet = statement.executeQuery(sql);
		    	while(resultSet.next()){
	%>
	<table>
		<tr>
			<th><font color="blue" size="5">AadharNumber</font></th>
		</tr>
		<tr>
			<td background="pink"><%= resultSet.getString("aadharnum")%></td>
		</tr>
		<% s+=resultSet.getString("aadharnum");
		    name+=resultSet.getString("name");
				}
			}
			catch(SQLException e)
			{
				e.printStackTrace();	
			}
		%>
	  
	</table>
	<!-- ------------------------------------------------------------------------------------------------- -->
	<!-- display lotdetails -->
			
	<table border="1">
		<tr>
			<th><font color="#C71585" size="5">Lot number</font></th>
		    <th><font color="#C71585" size="5">Average price</font></th>
		    <th><font color="#C71585" size="5">Lot size</font></th>
		    <th><font color="#C71585" size="5">Quantity bid for</font></th>
		    <th></th>
		    <th></th>
		    <th><font color="#C71585" size="5">Time progress</font></th>
		    <th><font color="#C71585" size="5">Timer</font></th>
		</tr>
		<%
		
			//fetching lotnumber 
			String lot="";
			try{	
				if(con == null)
				{
					System.out.println("Connection establish failed");
				}
				statement = con.createStatement();
				String sql = "select lotnumber,quantity,averageprice,quantitybidfor from productentry where farmerid='"+s+"' ";
			
				//System.out.println(sql);
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
		%>
							
		 <tr>
			 <td background="pink">
			 	<span>
			 		<form action=" " >
						 <input type ="button" name ="lotno1" value =<%=resultSet.getString("lotnumber")%>/>
					</form>
				</span>
				</td>
				
			 <td><%=resultSet.getString("averageprice") %></td>
			 <td><%=resultSet.getString("quantity") %></td>
			 <td><%=resultSet.getString("quantitybidfor") %></td>
			 <td><form action="FarmerAccept.jsp">
			 <input  id="accept" type="submit" value="Accept " disabled ></td></form>
			 <form action="FarmerReject.jsp">
			 <td><input  id="reject" type="submit" value="Reject" disabled></td></form>
			 <td>
			 	<div id="pbar_outerdiv" style="width: 140px; height: 18px; border: 1px solid grey; z-index: 1; position: relative; border-radius: 5px; -moz-border-radius: 5px;">
					<div id="pbar_innerdiv" style="background-color: lightgreen; z-index: 2; height: 100%; width: 0%;"></div>
					<div id="pbar_innertext" style="z-index: 3; position: absolute; top: 0; left: 0; width: 100%; height: 100%; color: black; font-weight: bold; text-align: center;">0%</div>
				</div>
			 </td>
			 <td><font color="blue" ><center><h4><div id="msg" >Your Auction will begins in</div><div id="timer"></div></h4></center></font>
				<div id="auction"></div>
				<div id="auction1"></div></td>
		</tr>
	<%
		}
	}
	catch(SQLException e)
	{
		e.printStackTrace();	
	}
%>


</table> 


<%
	//fetching date and time
	String date="";
	
	String slot="";
		try{	
				if(con == null)
					{
						System.out.println("Connection establish failed");
					}
					statement = con.createStatement();
					String sql = "select Date,Time,Slots from productentry where farmerid='"+s+"' ";
					//System.out.println(sql);
					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
	%>
					<font size="5" color="#9785f"></font>
				<% 
					date+=resultSet.getString("Date");
					//time+=resultSet.getString("Time");
					slot+=resultSet.getString("Slots");
					System.out.println("date="+date);
					//System.out.println("time="+time);
					System.out.println("slot="+slot);
						}
					}
					catch(SQLException e)
					{
						e.printStackTrace();	
					}
				%>
		  
		  <!-- ---------------------------------------------------------------------------------------------- -->  
		 <form>
			<input type="hidden" value="<%=time %>" id="time" />
			<input type="hidden" value="<%=slot %>" id="slot" />
			<input type="hidden" value="<%=date %>" id="date" />
		</form>
		<script>
	
			var Etime=document.getElementById("time").value;
			var Slot=document.getElementById("slot").value;
			var date=document.getElementById("date").value;
			var s1="Slot1";
			var s2="Slot2";
			var s3="Slot3";
			var s4="Slot4";
		var timedif;
			//-----------------------for slot1-----------------------------------------------------------------------------
			if(Slot==s1){
				var Etime=document.getElementById("time").value;
				var Btime="10:30:00";
				var Btime1="10:35:00";
				start = Etime.split(":");
				end =Btime.split(":");
				end1=Btime1.split(":");
				var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
				var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
				var end1Date=newDate(0,0,0,end1[0],end[2],end[2]);
				var diff1 = end1Date.getTime() - startDate.getTime();
				var hours1 = Math.floor(diff1 / 1000 / 60 / 60);
				var res3=0;
				var seconds1= Math.floor(diff1 /1000);
				var minutes1 = Math.floor(diff1 / 1000 / 60);
				if(seconds1>60)
				{
						res1=seconds1%60;
						res2=Math.floor(seconds1/60);
								
						seconds1=res1;
						minutes1=res2;
				}
				if(minutes1>60)
				{
						res1=minutes1%60;
						res3=Math.floor(minutes1/60);
								
						hours1=res3;
						minutes1=res1;
				}
				
				
				//
				var diff = endDate.getTime() - startDate.getTime();
				console.log("end time is "+Btime);
				console.log("current time is "+Etime);
				console.log("difference in milliseconds is "+diff);
				var hours = Math.floor(diff / 1000 / 60 / 60);
				//diff -= hours* 60 * 60;
				var seconds= Math.floor(diff /1000);
				var minutes = Math.floor(diff / 1000 / 60);
				var res3=0;
				console.log("differences in minutes before calc "+minutes);		
				console.log("differences in seconds before calc "+seconds);		
				if(seconds>60)
				{
						res1=seconds%60;
						res2=Math.floor(seconds/60);
								
						seconds=res1;
						minutes=res2;
				}
				if(minutes>60)
				{
						res1=minutes%60;
						res3=Math.floor(minutes/60);
								
						hours=res3;
						minutes=res1;
				}
				console.log("differences in minutes is "+minutes);
				console.log("differences in seconds is "+seconds);
				console.log("differences in hours is "+hours);

				var timedifference=+hours+":"+minutes+":"+seconds;
				console.log("differences in time is "+timedifference);
				var idiff = parseInt("timedifference") + "<br>";
				countdown(minutes,seconds,hours);
				count(minutes1,seconds1,hours1);
				//time progress-------------------------
	    		var start = new Date();
				var maxTime = diff;
				var timeoutVal = Math.floor(maxTime/100);
				animateUpdate();

				function updateProgress(percentage) {
				    $('#pbar_innerdiv').css("width", percentage + "%");
				    $('#pbar_innertext').text(percentage + "%");
				}

				function animateUpdate() {
				    var now = new Date();
				    var timeDiff = now.getTime() - start.getTime();
				    var perc = Math.round((timeDiff/maxTime)*100);
				    console.log(perc);
				      if (perc <= 100) {
				       updateProgress(perc);
				       setTimeout(animateUpdate, timeoutVal);
				      }
				}
				//----------------------------------
					
				var five=300000;
				timedif=diff+five;
				console.log("count"+timedif);
				
		}
		//--------------------------for slot2------------------------------------------------------------------------
		else if(Slot==s2){
			var Etime=document.getElementById("time").value;
			var Btime="10:40:00:00";
			start = Etime.split(":");
			end =Btime.split(":");
			var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
			var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
			var diff = endDate.getTime() - startDate.getTime();
			console.log("end time is "+Btime);
			console.log("current time is "+Etime);
			console.log("difference in milliseconds is "+diff);
			var hours = Math.floor(diff / 1000 / 60 / 60);
			//diff -= hours* 60 * 60;
			var seconds= Math.floor(diff /1000);
			var minutes = Math.floor(diff / 1000 / 60);
			var res3=0;
			console.log("differences in minutes before calc "+minutes);		
			console.log("differences in seconds before calc "+seconds);		
			if(seconds>60)
			{
					res1=seconds%60;
					res2=Math.floor(seconds/60);
							
					seconds=res1;
					minutes=res2;
			}
			if(minutes>60)
			{
					res1=minutes%60;
					res3=Math.floor(minutes/60);
							
					hours=res3;
					minutes=res1;
			}
			console.log("differences in minutes is "+minutes);
			console.log("differences in seconds is "+seconds);
			console.log("differences in hours is "+hours);

			var timedifference=+hours+":"+minutes+":"+seconds;
			console.log("differences in time is "+timedifference);
			var idiff = parseInt("timedifference") + "<br>";
			countdown(minutes,seconds,hours);
			//time progress-------------------------
    		var start = new Date();
			var maxTime = diff;
			var timeoutVal = Math.floor(maxTime/100);
			animateUpdate();

			function updateProgress(percentage) {
			    $('#pbar_innerdiv').css("width", percentage + "%");
			    $('#pbar_innertext').text(percentage + "%");
			}

			function animateUpdate() {
			    var now = new Date();
			    var timeDiff = now.getTime() - start.getTime();
			    var perc = Math.round((timeDiff/maxTime)*100);
			    console.log(perc);
			      if (perc <= 100) {
			       updateProgress(perc);
			       setTimeout(animateUpdate, timeoutVal);
			      }
			}
			//----------------------------------

			var five='300000';
			var timedif=diff+five;
			console.log("count"+timedif);
	}
			      
		
		//-------------------------------for slot3-----------------------------------------------------------------
		else if(Slot==s3){
			var Etime=document.getElementById("time").value;
			var Btime="10:50:00:00";
			start = Etime.split(":");
			end =Btime.split(":");
			var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
			var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
			var diff = endDate.getTime() - startDate.getTime();
			console.log("end time is "+Btime);
			console.log("current time is "+Etime);
			console.log("difference in milliseconds is "+diff);
			var hours = Math.floor(diff / 1000 / 60 / 60);
			//diff -= hours* 60 * 60;
			var seconds= Math.floor(diff /1000);
			var minutes = Math.floor(diff / 1000 / 60);
			var res3=0;
			console.log("differences in minutes before calc "+minutes);		
			console.log("differences in seconds before calc "+seconds);		
			if(seconds>60)
			{
					res1=seconds%60;
					res2=Math.floor(seconds/60);
							
					seconds=res1;
					minutes=res2;
			}
			if(minutes>60)
			{
					res1=minutes%60;
					res3=Math.floor(minutes/60);
							
					hours=res3;
					minutes=res1;
			}
			console.log("differences in minutes is "+minutes);
			console.log("differences in seconds is "+seconds);
			console.log("differences in hours is "+hours);

			var timedifference=+hours+":"+minutes+":"+seconds;
			console.log("differences in time is "+timedifference);
			var idiff = parseInt("timedifference") + "<br>";
			countdown(minutes,seconds,hours);

			var t=setTimeout(auction, 1000);
			function auction()
			{
				//window.location='http://localhost:8080/NeomandiPrototype/TraderLogin.jsp'
			}

			//time progress-------------------------
    		var start = new Date();
			var maxTime = diff;
			var timeoutVal = Math.floor(maxTime/100);
			animateUpdate();

			function updateProgress(percentage) {
			    $('#pbar_innerdiv').css("width", percentage + "%");
			    $('#pbar_innertext').text(percentage + "%");
			}

			function animateUpdate() {
			    var now = new Date();
			    var timeDiff = now.getTime() - start.getTime();
			    var perc = Math.round((timeDiff/maxTime)*100);
			    console.log(perc);
			      if (perc <= 100) {
			       updateProgress(perc);
			       setTimeout(animateUpdate, timeoutVal);
			      }
			}
			//----------------------------------

			var five='300000';
			var timedif=diff+five;
			console.log("count"+timedif);
			
	}
			
		//----------------------------------for slot4---------------------------------------------------------------	
		else if (Slot==s4){
			var Etime=document.getElementById("time").value;
			var Btime="11:00:00:00";
			start = Etime.split(":");
			end =Btime.split(":");
			var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
			var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
			var diff = endDate.getTime() - startDate.getTime();
			console.log("end time is "+Btime);
			console.log("current time is "+Etime);
			console.log("difference in milliseconds is "+diff);
			var hours = Math.floor(diff / 1000 / 60 / 60);
			//diff -= hours* 60 * 60;
			var seconds= Math.floor(diff /1000);
			var minutes = Math.floor(diff / 1000 / 60);
			var res3=0;
			console.log("differences in minutes before calc "+minutes);		
			console.log("differences in seconds before calc "+seconds);		
			if(seconds>60)
			{
					res1=seconds%60;
					res2=Math.floor(seconds/60);
							
					seconds=res1;
					minutes=res2;
			}
			if(minutes>60)
			{
					res1=minutes%60;
					res3=Math.floor(minutes/60);
							
					hours=res3;
					minutes=res1;
			}
			console.log("differences in minutes is "+minutes);
			console.log("differences in seconds is "+seconds);
			console.log("differences in hours is "+hours);

			var timedifference=+hours+":"+minutes+":"+seconds;
			console.log("differences in time is "+timedifference);
			var idiff = parseInt("timedifference") + "<br>";
			countdown(minutes,seconds,hours);
			//time progress-------------------------
    		var start = new Date();
			var maxTime =diff;
			var timeoutVal = Math.floor(maxTime/100);
			animateUpdate();

			function updateProgress(percentage) {
			    $('#pbar_innerdiv').css("width", percentage + "%");
			    $('#pbar_innertext').text(percentage + "%");
			}

			function animateUpdate() {
			    var now = new Date();
			    var timeDiff = now.getTime() - start.getTime();
			    var perc = Math.round((timeDiff/maxTime)*100);
			    console.log(perc);
			      if (perc <= 100) {
			       updateProgress(perc);
			       setTimeout(animateUpdate, timeoutVal);
			      }
			}
			//----------------------------------

			var five='300000';
			var timedif=diff+five;
			console.log("count"+timedif);
			
		}
			///---------------------for count down timer----------------------------------	
			
			function countdown(minutes,seconds,hours) 
				{
				    var seconds =seconds;
				    var mins = minutes
				    var hour=hours;
				    var res1=0;
				    var res2=0;
				    var timedifference=+hours+":"+minutes+":"+seconds;
				   		    
			   		function tick() 
			   		{
				        var counter = document.getElementById("timer");
				        var current_minutes = mins
			       		seconds--;
				        var hour=hours;
				        counter.innerHTML =hour.toString()+":"+current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
				        if( seconds > 0 )
				        {
				            setTimeout(tick,1000);
				           
				        } 
				        else
			        	{
			 				if(mins >= 1)
			 				{
			 					setTimeout(function (){	countdown(mins - 1,60,hour); },1000);
			 				}			 				
							else
							{
								if(hour>1)
								{
				 					setTimeout(function (){	countdown(59,60,hour-1); },1000);
				 				}	
								else
								{
					            	var str="<center><b><h4><font color='blue' >Your Auction has begun</font></h4></b></center>";
					            	str+="<center><b><h4><font color='blue' >Your Auction will ends in</font></h4></b></center>";
					            	str+="<center><h4><font color='red' ><div id='hms' >5:00</div></font></h4></center>";
					            	var strCmd = "document.getElementById('auction').style.display = 'none'";
					            	var waitseconds = seconds;
					            	var timeOutPeriod = waitseconds * 1000;
					            	var hideTimer = setTimeout(strCmd, timeOutPeriod);
					            	var strCmd1 = "document.getElementById('msg').style.display = 'none'";
					            	var waitseconds = seconds;
					            	var timeOutPeriod = waitseconds * 1000;
					            	var hideTimer = setTimeout(strCmd1, timeOutPeriod);
					            	document.getElementById("timer").innerHTML=str;
					            	//during auction
					            	
					            	
					            	
					            	
					            	//
					            	count(minutes1,seconds1,hours1); {
					            		
					        		    var seconds =seconds1;
					        		    var mins = minutes1
					        		    var timedifference=+hours+":"+minutes+":"+seconds;
					        		    
					        		    function tick() 
					        		    {
					        		        var counter = document.getElementById("hms");
					        		        var current_minutes = mins-1
					        		       	seconds1--;
					        		        counter.innerHTML =current_minutes.toString() + ":" + (seconds1 < 10 ? "0" : "") + String(seconds1);
					        		        if( seconds1 > 0 ) {
					        		            setTimeout(tick,1000);
					        		        } 
					        		        else 
					        		        {
					        		 
						        		            if(mins > 1){
						        		 				setTimeout(function () { count(mins-1); },1000);
						        						}
						        		            	else{
						        		            	var str1="<center><h4><font color='blue' >Your Auction has end</font></h4><center>";
						        		            	var strCmd2 = "document.getElementById('hms').style.display = 'none'";
										            	var waitseconds = seconds;
										            	var timeOutPeriod = waitseconds * 1000;
										            	var hideTimer = setTimeout(strCmd2, timeOutPeriod);
										            	
						        		            	document.getElementById("auction1").innerHTML=str1;
						        		            	}
						        		           
						        		            //setButtonStatus(seconds,accept);
					        		    	}
				        		     	}
				        		   	 	tick();
				        		   
				        			}
				        			count(5);
				        			//time progress-------------------------
				            		var start = new Date();
				    				var maxTime = 300000;
				    				var timeoutVal = Math.floor(maxTime/100);
				    				animateUpdate();

				    				function updateProgress(percentage) {
				    				    $('#pbar_innerdiv').css("width", percentage + "%");
				    				    $('#pbar_innertext').text(percentage + "%");
				    				}

				    				function animateUpdate() {
				    				    var now = new Date();
				    				    var timeDiff = now.getTime() - start.getTime();
				    				    var perc = Math.round((timeDiff/maxTime)*100);
				    				    console.log(perc);
				    				      if (perc <= 100) {
				    				       updateProgress(perc);
				    				       setTimeout(animateUpdate, timeoutVal);
				    				      }
				    				}
				    				//----------------------------------
				    				 /*var jspcall = "Fpage.jsp?";
			        		            window.location.href = jspcall;*/
								}
							}
			 				}		       
			    		}
			    tick();
			}
			countdown(minutes,seconds,hours);
			//
			
			
			/*var t=setTimeout(nextPage,5000)
			function nextPage(){
				window.location='http://localhost:8080/NeomandiPrototype/FarmerMaster.jsp';
			}*/
			
	</script>
	 <script>

//console.log("time="+timedif);
 var t=setTimeout(auction,timedif);
 function auction(){
	 document.getElementById("accept").disabled=false;
	 document.getElementById("reject").disabled=false;
 }
 </script>

</body>
</html>