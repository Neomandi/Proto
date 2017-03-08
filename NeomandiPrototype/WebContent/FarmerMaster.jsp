<%@page import="java.net.InetAddress"%>
<%@ page language="java" errorPage="Error.jsp" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp" 
    import=" com.neomandi.prototype.JDBCHelper,  
    java.text.DecimalFormat,
     java.io.PrintWriter,
     java.sql.Connection,
     java.sql.ResultSet,
     java.sql.Statement,
     javax.servlet.ServletException,
	 javax.servlet.http.HttpServlet,
	 javax.servlet.http.HttpServletRequest,
	 javax.servlet.http.HttpServletResponse,
	 java.sql.SQLException,
	 java.net.InetAddress,
	 java.text.SimpleDateFormat,
	 sun.misc.BASE64Encoder,
	java.util.*"%>
<!doctype html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <meta http-equiv="refresh"  content="3; URL=http://neomandi.in/FarmerMaster.jsp"> 
<title>NeoMandi</title>
<link rel="icon" type="image1/png" href="Images/Neomandi1.png">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
    .img-responsive{
    	height: 60px;
    	width: 65px;
    }
    #image{
    height:300px;
    width:300px;}
    .tradtab a{
    background-color:#0082B2;
    }
   
    </style>
</head>

<body class="" >
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<%HttpSession hs=request.getSession(false); 
if((String)hs.getAttribute("name")==null){
	out.println("<script>window.alert('YOU HAVE NOT LOGGED IN,PLEASE LOGIN'); window.location='Login.html';</script>");
}
	String name=(String)hs.getAttribute("name"); %>
<div class="col-lg-offset-1 col-lg-10 col-sm-offst-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><p style="font-size:16px; color:white;"><%=name %>,&nbsp;welcome to e-auction at NeoMandi.</p></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="FLogout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li class="active"><a href="FarmerMaster.jsp"> Auction </a></li>
    <li><a href="Lotdetails.jsp"> My Lots </a></li>
    <li><a class="classbeauty" id="ts" href="#"> Summary </a></li>
    <li><a href="FarmerProfile.jsp">My Profile</a></li>
    <li ><a href="FarmerSummaryInt.jsp">History</a></li>
  </ul>
</div>
</div>
</div>

 <% 
 
	
	 		
	     	String pass=(String)hs.getAttribute("pass"); 
 		     System.out.println("original password="+pass);
 		   String starttime=(String)hs.getAttribute("starttime"); 
 		 
 		 String endtime=(String)hs.getAttribute("endtime"); 
		 

		  
		  ServletContext context = request.getSession().getServletContext();
			starttime=(String)context.getAttribute("starttime");
			endtime=(String)context.getAttribute("endtime");
			System.out.println("in farmer page starttime="+starttime);
			System.out.println("in farmer page endtime="+endtime);
	     	// String time=(String)hs.getAttribute("time");
	    	SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss");
	     	String time=df1.format(new Date());
		 	System.out.println("password="+pass);
			System.out.println("new time="+time);
			HttpSession hs1=request.getSession(false);  
	   	     hs1.setAttribute("pass",pass); 
		     Connection con = null;
		     Statement statement = null;
		     ResultSet resultSet = null;    
		       
		     con = JDBCHelper.getConnection();
			//display aadhar number 
		     String s="";
			
		     try
		     	{	
		     
		     	statement = con.createStatement();
		     	String sql = "select aadharnum,name from freg where pass='"+pass+"' ";
		     	//System.out.println(sql);
		     	resultSet = statement.executeQuery(sql);
		    	while(resultSet.next()){
		    		s+=resultSet.getString("aadharnum");
				    name+=resultSet.getString("name");
						}
				}
				catch(SQLException e)
				{
					e.printStackTrace();	
				}
		    	
	
	%>
<div class="container-fluid pad auct">
<div class="tabin1">
<div class="autable">
<table class="table atable" id="mytable">
<thead><tr>
          <td></td>
	  <td><h4>Lot Number</h4></td>
	  <td><h4>Lot Size</h4></td>
	  <td><h4>Quantity</h4></td>
	  <td><h4>Avg Price</h4></td>
	  <td><h4>Accept</h4></td>
	  <td><h4>Reject</h4></td>
	  <td><h4>Status</h4></td>
          <td></td>
	  </tr></thead>
	   
	  <tbody>
	   <%
	    
			//fetching lotnumber 
			String lot="";
	    	String imgsrc="";
	    	String lotnumber="";
			try{	
				
				statement = con.createStatement();
				String sql = "select lotnumber,quantity,averageprice,quantitybidfor from productentry where farmerid='"+s+"' ";
				//System.out.println(sql);
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					String avg="--";
		%>
	  <tr class="gradeX"><td></td>
	  
	  	<% lotnumber=resultSet.getString("lotnumber");
		   imgsrc="ProductImages/"+lotnumber+".jpg";
		   System.out.println("in farmer master lotnumber="+lotnumber);
		%>
	 	 <td> <button type="button" class="btn popup" data-toggle="modal" data-target="#myModal" style="color:#000080"><%=lotnumber %></button></td>
	  <td><h4 style="color:#000080"><b><%=resultSet.getString("quantity") %></b></h4></td>
	  <%
	  	String qty="--"; 
	  	if(resultSet.getString("quantitybidfor")!=null){
			String quantity =(String)resultSet.getString("quantitybidfor");
			double y=Double.parseDouble(quantity);
		    y=y*100;
			y=(int)y;
			y=y/100;
			System.out.println("before"+quantity+" after"+y);
          	%>  
          	<td><h4 style="color:#000080"><b><%=y%></b></h4></td> 
          	<% }
	  		else{ %>         
	  	<td><h4 style="color:#000080;"><%=qty %></h4></td><%} %>
	  	<%  	
	  		if(resultSet.getString("averageprice")!=null){
			String average=(String)resultSet.getString("averageprice");
			double x=Double.parseDouble(average);
		    x=x*100;
			x=(int)x;
			x=x/100;
			System.out.println("before"+average+" after"+x);
	  		%>
	  		<td><b><h4 style="color:#000080"><%=x%></h4></b></td>
	  		<%}else{ %>
	  <td><h4 style="color:#000080;"><%=avg %></h4></td><%} %>
	  <td>


	  		<button type="button" id="accept" class="btn accept" onclick="accept()" disabled data-toggle="modal" data-target="#myModal1"onMouseOver="this.style.color='black'" onMouseOut="this.style.color='white'" type="button" style="color: white; border-radius:9px; border: 1px solid #808080;" class="btn"  data-target="#myModal">Accept</button>
	  		

	  </td>
	  <td>
	  		<button type="button" id="reject" class="btn reject" onclick="javascript:reject()" disabled data-toggle="modal" data-target="#myModal1"onMouseOver="this.style.color='black'" onMouseOut="this.style.color='white'" type="button" style="color: white; border-radius:9px; border: 1px solid #808080;" class="btn"  data-target="#myModal">Reject</button>
	  			  </td>


	 <td class="clsnowrap" >
	<b><h4><b>
	  <div id="msg" style="display:inline; color:#000080;" >Auction will begin in</div>&nbsp;&nbsp;
	 <font color="#000080" ><div id="timer" style="display:inline;  color:#000080; " ></div></font>
	  	<div id="auction" style="display:inline;  color:#000080; "></div>
		<div id="auction1" style="display:inline;  color:#000080;"></div>
	  	</b></h4></b></td></tr>
	  <%
		}
	}
	catch(SQLException e)	
	{
		e.printStackTrace();	
	}			
%>
	  </tbody>
	  </table>
</div>
	  </div>
	  </div>
  <!-----------------------------------------------------modal image----------------------------------------------->
  <!---------modal image--------------->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Product Image</h4>
        </div>
        <div class="modal-body">
          <img src="<%=imgsrc%>" class="img-responsive trad" width="50%" height="70%" id="image">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>      
    </div>
  </div>
<!--------modal image end------------>
<%
	//fetching date and time
	String date="";
	String slot="";
	String s1="";
	try
	{	
		statement = con.createStatement();
		String sql = "select Date,Time,slotnumber from productentry where farmerid='"+s+"' ";
		resultSet = statement.executeQuery(sql);
		List<String> l=new ArrayList<String>();
		while(resultSet.next()){
			date+=resultSet.getString("Date");
			slot+=resultSet.getString("slotnumber");
			l.add(slot);
			System.out.println("date="+date);
			System.out.println("slot="+slot);
			for(String obj:l)  {
				 s1=obj;
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();	
		}
	 	finally
		{
	 		resultSet.close();
			statement.close();
			con.close();
		}					
%>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<% InetAddress addr = InetAddress.getLocalHost();
	String ip=addr.getHostAddress();
%> 
<form>
<input type="hidden" value="<%=time%>" id="time" />
	<input type="hidden" value="<%=starttime%>" id="stime" />
	<input type="hidden" value="<%=endtime%>" id="etime" />
	<input type="hidden" value="<%=s1%>" id="slot" />
	<input type="hidden" value="<%=date%>" id="date" />
	<input type="hidden" value="<%=ip %>" id="IP"/>
</form>
<script type="text/javascript">

			var IP=document.getElementById("IP").value;
			console.log("ip="+IP);

			var Etime=document.getElementById("time").value;
			var stime=document.getElementById("stime").value;
			var etime=document.getElementById("etime").value;
			var slot=document.getElementById("slot").value;
			var date=document.getElementById("date").value;
			var s1="slot1";
			var s2="slot2";
			var s3="slot3";
			var s4="slot4";
			var timedif;
			var Btime1;
			var diff;
			//-----------------------for slot1-----------------------------------------------------------------------------
			if(slot==s1)
			{
				var Etime=document.getElementById("time").value;
				var Btime=stime;
				var Btime1=etime;
				console.log("Btime="+Btime);
				console.log("Btime1="+Btime1);
				start = Etime.split(":");
				end =Btime.split(":");
				var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
				var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
				 diff = endDate.getTime() - startDate.getTime();
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
				
				countdown(minutes,seconds,hours);

				var five=300000;
				timedif=diff+five;
				console.log("count"+timedif);
					
				
			}
			//-----------------------for slot2--------------------------------------------------------------------
			if(slot==s2)
			{
				var Etime=document.getElementById("time").value;
				var Btime=stime;
				var Btime1=etime;
				console.log("Btime="+Btime);
				console.log("Btime1="+Btime1);
				start = Etime.split(":");
				end =Btime.split(":");
				var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
				var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
				 diff = endDate.getTime() - startDate.getTime();
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
				
				countdown(minutes,seconds,hours);

				var five=300000;
				timedif=diff+five;
				console.log("count"+timedif);
					
				
			}
			//-----------------------for slot3--------------------------------------------------------------------
			var Etime=document.getElementById("time").value;
				var Btime=stime;
				var Btime1=etime;
				console.log("Btime="+Btime);
				console.log("Btime1="+Btime1);
				start = Etime.split(":");
				end =Btime.split(":");
				var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
				var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
				 diff = endDate.getTime() - startDate.getTime();
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
				
				countdown(minutes,seconds,hours);

				var five=300000;
				timedif=diff+five;
				console.log("count"+timedif);
					
				
		//---------------------for count down timer----------------------------------	
			
function countdown(minutes,seconds,hours) 
{
	  document.getElementById('ts').onclick = function() {

		  location="http://neomandi.in/FarmerMaster.jsp";

	  }	
	 
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
	            document.getElementById('ts').onclick = function() {
		            	console.log("inside the count function");
		            	//alert("Auction under progress");
		            	
		            	   window.location="http://neomandi.in/BeforeAuction.do";
		            	}
	        } 
	        else 
     		{
				if(mins > 0)
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
		            	var str="<div id='a1'style='display:inline;color:#000080; '>Auction has begun. Auction will end in</div>&nbsp;&nbsp;<font color='#000080'><div id='hms' style='display:inline;color:#000080;' > 5:00</div></font>";
		            	//str+="<h4><div id='hms'style='display:inline;' >5:00</div></h4>";
		            	var strCmd = "document.getElementById('auction').style.cssText ='display:none'";
		            	var waitseconds = seconds;
		            	var timeOutPeriod = waitseconds * 1000;
		            	var hideTimer = setTimeout(strCmd, timeOutPeriod);
		            	
		            	var strCmd1 = "document.getElementById('msg').style.cssText ='display:none'";
		            	var waitseconds = seconds;
		            	var timeOutPeriod = waitseconds * 1000;
		            	var hideTimer = setTimeout(strCmd1, timeOutPeriod);
		            	
		            	document.getElementById("timer").innerHTML=str;
		            	function count(minutes1,seconds1) 
		            	{
		            		console.log("minutes is"+minutes);
		            		console.log("seconds is"+seconds1);
		        		    var seconds =seconds1;
		        		    var mins = minutes1;
		        		    var timedifference=+hours+":"+minutes1+":"+seconds1;
		        		    function tick() 
		        		    {
		        		        var counter = document.getElementById("hms");
		        		        var current_minutes = mins
		        		       	seconds--;
		        		        counter.innerHTML =current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
		        		        if( seconds > 0 ) {
		        		            setTimeout(tick,1000);
		        		            document.getElementById('ts').onclick = function() {
		        		            	console.log("inside the count function");
		        		            	//alert("Auction under progress");

		        		            	   location="http://neomandi.in/DuringAuction.do";

		        		            	}
		        		            
		        		        } 
		        		        else 
		        		        {
			        		       if(mins > 0)
			        		       {
			        		 		setTimeout(function () { count(mins - 1,60); },1000);
			        			   }
			        		       else
			        		       {
			        		           	var str1=" Auction has ended";
			        		           	var strCmd2 = "document.getElementById('hms').style.cssText ='display:none'";
						            	var waitseconds = seconds;
						            	var timeOutPeriod = waitseconds * 1000;
						            	var hideTimer = setTimeout(strCmd2, timeOutPeriod);
						            	
						            	var strCmd3 = "document.getElementById('a1').style.cssText ='display:none'";
						            	var waitseconds = seconds;
						            	var timeOutPeriod = waitseconds * 1000;
						            	var hideTimer = setTimeout(strCmd3, timeOutPeriod);
						            	
						            	document.getElementById('ts').onclick = function() {
			        		            console.log("inside the count function");

			        		            location="http://neomandi.in/GetSummary.do";

			        		            }
						            	if(document.getElementById("auction1")!=null){
						            		document.getElementById("accept").disabled=false;
											 document.getElementById("reject").disabled=false;
						            	}
						            	
						            	document.getElementById("auction1").innerHTML=str1;
			        		       }
		        		    	}
	        		     	}
	        		   	 	tick();
	        			}		
		            	var Etime1=document.getElementById("time").value;
		            	start1 = Etime1.split(":");
		            	end1 =Btime1.split(":");
		            	var startDate1 = new Date(0, 0, 0, start1[0], start1[1], start1[2]);
		            	var endDate1 = new Date(0, 0, 0, end1[0], end1[1], end1[2]);
		            	var td = endDate1.getTime() - startDate1.getTime();					            	
		            	var hours1 = Math.floor(td / 1000 / 60 / 60);
		            	var seconds1= Math.floor(td /1000);
		            	var minutes1 = Math.floor(td / 1000 / 60);
		            	var res1;
		            	var res2;
		            	if(seconds1>60)
		            	{
		            			res1=seconds1%60;
		            			res2=Math.floor(seconds1/60);
		            					
		            			seconds1=res1;
		            			minutes1=res2;
		            	}
		            	console.log("auction ends at "+Btime1);
		            	console.log("time is  "+Etime1);
		            	console.log("differences in time remainins is "+minutes1+":"+seconds1);
	        			count(minutes1,seconds1);
	        			
					}
				}
			}		       
 		}
 tick();
}
countdown(minutes,seconds,hours);		   
//console.log("time="+timedif);
 console.log("count"+timedif);
				/*var t=setTimeout(auction,timedif);
				 function auction(){
					 document.getElementById("accept").disabled=false;
					 document.getElementById("reject").disabled=false;
				 }*/
 function accept(){
	 window.location="http://neomandi.in/AcceptSummary.do";
 }
 function reject(){
   	 window.location="http://neomandi.in/RejectSummary.do";
    }
  </script> 
</body>
</html>