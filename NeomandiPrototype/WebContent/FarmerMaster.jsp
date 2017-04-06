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
	java.util.Date,java.sql.*"%>
<!doctype html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>NeoMandi</title>
<link rel="icon" type="image1/png" href="Images/Neomandi1.png">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/sweetalert.css" rel="stylesheet" type="text/css">
<script src="js/sweetalert.min.js" type="text/javascript"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/jquery-3.2.0.js" type="text/javascript"></script>
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
   #div{
    		padding:30px;
			margin:200px;
			width:50%;
			background-color:#F2F2F2;
			text-align:center;
			color:darkblue;	 
			font-size:18px;
    }
     .auct .table thead td h4, .lots .table thead td h4, .sum1 .table thead td h4, .sum2 .table thead td h4 {
   color: #fff;
font-size: 14px;
margin: 5px auto; 
}
body {
		    background-image: url("images/nm-white-background-pattern.png");
		    background-repeat:no-repeat;
		    background-size:cover;
		}
    </style>
</head>

<body class="" >
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<%
response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility

HttpSession hs=request.getSession(false); 
if((String)hs.getAttribute("name")==null){
	out.println("<script>swal({title: 'You have not logged in. Please login',text: 'You will be redirected to login page.',timer: 2000,showConfirmButton: false},function(){window.location='http://neomandi.in/Login.html';});</script>");
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
  /*String msg = (String)request.getAttribute("errmsg");
 System.out.println("meassage="+msg);
 System.out.println("if(msg != null && msg.equals(empty))"+(msg != null && msg.equals("empty")));
 if(msg != null && msg.equals("empty")){
	 System.out.println("insid if");*/
	 %>
	<!--   <div id="div">Auction yet to happen, hence, no  Lot details is available.</div>-->
	 <% 
// }else{
	 		System.out.println("inside else");
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
	 <input type="hidden" value="<%=s%>" id="farmerid"/>
<div class="container-fluid pad auct">
<div class="tabin1">
<div class="autable">
<table class="table atable" id="mytable">
<thead><tr>
          <td></td>
	  <td><h4>Lot Number</h4></td>
	  <td><h4>Lot Size(kg)</h4></td>
	  <td><h4>Quantity sold(kg)</h4></td>
	  <td><h4>Avg Price(Rs)</h4></td>
	  <td><h4>Accept</h4></td>
	  <td><h4>Reject</h4></td>
	  <td><h4>Status</h4></td>
          <td></td>
	  </tr></thead>
	   
	  <tbody>
	  
	 <%
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	String imgsrc="";
   
	String lotnumber="";
	try
	{
	con = JDBCHelper.getConnection();
	
	if(con == null)
	{
		System.out.println("Connection not established.");
	}
	else
	{
		String sql = "select * from productentry where farmerid='"+s+"'";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		System.out.println(sql);
		System.out.println(rs);
		//System.out.println(rs.getRow());
		//System.out.println(rs.first());
		String lotnumber1=null;
		if(rs.next())
		{
			lotnumber1 = rs.getString("lotnumber");
			System.out.println("lotnumber="+lotnumber1);
		}
		
	
		if(lotnumber1!=null)
		{
			System.out.println("Inside if....");
			
				String sql2 = "select slotnumber,produce,qualitygrade,lotnumber,quantity,averageprice,quantitybidfor from productentry where farmerid='"+s+"' ";
				pstmt1 = con.prepareStatement(sql2);
				rs1 = pstmt1.executeQuery();
				
					while(rs1.next())
					{

						String avg="--";
			%>
		  <tr class="gradeX"><td></td>
		 
		  
		  	<% lotnumber=rs1.getString("lotnumber");
		  	
		  		if(rs1.getString("slotnumber").equals("slot1")){
			   imgsrc="ProductImages/"+lotnumber+".jpg";
		  		}
		  		else{
		  			imgsrc="ProductImages/"+rs1.getString("produce")+"-"+rs1.getString("qualitygrade")+".jpg";
		  		}
			   System.out.println("in farmer master lotnumber="+lotnumber);
			%>
		 	 <td> <button type="button" class="btn popup" data-toggle="modal" data-target="#myModal" style="color:#000080"><%=lotnumber %></button></td>
		  <td><h4 style="color:#000080;text-align:center;"><b><%=rs1.getString("quantity") %></b></h4></td>
		  <%
		  
				String quantity =(String)rs1.getString("quantitybidfor");
		  			double y=0.0;
		  			if(quantity!=null){
						y=Double.parseDouble(quantity);
					    y=y*100;
						y=(int)y;
						y=y/100;
						System.out.println("before"+quantity+" after"+y);
		  			}

	          	%>  
	          	<td ><h4 id="q" style="color:#000080;font-weight:bold;"><b><%if(quantity!=null){out.println(y);}else{out.println("--");}%></b></h4></td> 
	          	        
		  	
		  	<%  	
		  		
				String average=(String)rs1.getString("averageprice");
		  	double x=0.0;
		  	if(average!=null){
				 x=Double.parseDouble(average);
			    
			    DecimalFormat two = new DecimalFormat("#.##");
			     Double.valueOf(two.format(x));
				System.out.println("before"+average+" after"+x);
		  	}
		  		%>
		  		<td><h4 id="a" style="color:#000080;  font-weight:bold;"><b><%if(average!=null){out.println(x);}else{out.println("--");}%></b></h4></td>
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
		else
		{
			 System.out.println("Inside else....");
			 out.println("<div id='div' style='position: absolute; top: 3px; left: 140px;'><p ><b>No lot entries found, hence, auction details are not available.</b></p></div>");
		}
	}
}
catch(Exception e)
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
		
		while(resultSet.next()){
			date+=resultSet.getString("Date");
			slot+=resultSet.getString("slotnumber");
			
			System.out.println("date="+date);
			System.out.println("slot="+slot);
			
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();	
		}
	 	finally
		{
	 		resultSet.close();
	 		JDBCHelper.Close(rs1);
			statement.close();
			
			JDBCHelper.Close(pstmt);
			JDBCHelper.Close(pstmt1);
			con.close();
		}					
%> 
<form>
<input type="hidden" value="<%=time%>" id="time" />
	<input type="hidden" value="<%=starttime%>" id="stime" />
	<input type="hidden" value="<%=endtime%>" id="etime" />
	<input type="hidden" value="<%=slot%>" id="slot" />
	<input type="hidden" value="<%=date%>" id="date" />
	<input name="refreshed" value="no" id="refreshed" type="hidden"/>
</form>
<script type="text/javascript">

			

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
				//console.log("Btime="+Btime);
				//console.log("Btime1="+Btime1);
				start = Etime.split(":");
				end =Btime.split(":");
				var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
				var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
				 diff = endDate.getTime() - startDate.getTime();
				/*console.log("end time is "+Btime);
				console.log("current time is "+Etime);
				console.log("difference in milliseconds is "+diff);*/
				var hours = Math.floor(diff / 1000 / 60 / 60);
				//diff -= hours* 60 * 60;
				var seconds= Math.floor(diff /1000);
				var minutes = Math.floor(diff / 1000 / 60);
				var res3=0;
				/*console.log("differences in minutes before calc "+minutes);		
				console.log("differences in seconds before calc "+seconds);		*/
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
				/*console.log("differences in minutes is "+minutes);
				console.log("differences in seconds is "+seconds);
				console.log("differences in hours is "+hours);*/

				var timedifference=+hours+":"+minutes+":"+seconds;
				//console.log("differences in time is "+timedifference);
				
				countdown(minutes,seconds,hours);

				var five=300000;
				timedif=diff+five;
				//console.log("count"+timedif);
					
				
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
			/*	console.log("differences in minutes is "+minutes);
				console.log("differences in seconds is "+seconds);
				console.log("differences in hours is "+hours);*/

				var timedifference=+hours+":"+minutes+":"+seconds;
				//console.log("differences in time is "+timedifference);
				
				countdown(minutes,seconds,hours);

				var five=300000;
				timedif=diff+five;
				console.log("count"+timedif);
					
				
		//---------------------for count down timer----------------------------------	
	var i=0;		
function countdown(minutes,seconds,hours) 
{
			

	  document.getElementById('ts').onclick = function() {

		  location="http://neomandi.in/FarmerSummary.jsp";

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
		            	//swal("Auction under progress");
		            	
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
						//To Reload page once
						/* (function(){
								  if( window.localStorage )
								  {
								    if( !localStorage.getItem( 'firstLoad' ) )
								    {
								      localStorage[ 'firstLoad' ] = true;
								      console.log("Before reload");
								      window.location.reload();
								    }  
								    else{
								    	console.log("After reload");
								    	localStorage.removeItem( 'firstLoad' );								      
								    }
								  }
						})(); */
						
		            	var str="<div id='a1'style='display:inline;color:#000080; '>Auction has begun. Auction will end in</div>&nbsp;&nbsp;<font color='#000080'><div id='hms' style='display:inline;color:#000080;' > 5:00</div></font>";

		            	//console.log(" before if i="+i);
		            	/*if(i==0){
		            		console.log(" after i="+i);
		            		location="http://neomandi.in/FarmerMaster.jsp";
		            		i=9;
		            	}*/
		            		
		            	
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
		        		            	//swal("Auction under progress");
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
		            	var d = new Date(); // for now
		            	d.getHours(); // => 9
		            	d.getMinutes(); // =>  30
		            	d.getSeconds();
		            	var Etime1=d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
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
		            	count(minutes1,seconds1);
	        			
					}
				}
			}		       
 		}
 tick();
}
//countdown(minutes,seconds,hours);		   
//console.log("time="+timedif);
 console.log("count"+timedif);
				
 function accept(){
	 window.location="http://neomandi.in/AcceptSummary.do";
 }
 function reject(){
   	 window.location="http://neomandi.in/RejectSummary.do";
    }
  </script> 
  
<script type="text/javascript">
setInterval(function()
		  {
			funny();
		  },3000);
		  
		  function funny(){
			 // console.log("inside function");
			  xmlhttp = new XMLHttpRequest();
			    xmlhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) 
			    {	
			    	var string=xmlhttp.responseText;
			    	 var startlotnum=xmlhttp.responseText.indexOf('averageprice');
			         var endlotnum=xmlhttp.responseText.lastIndexOf('averageprice');
			         startlotnum=startlotnum+12;
			         
			         var startquantitybidfor=xmlhttp.responseText.indexOf('for');
			         var endquantitybidfor=xmlhttp.responseText.lastIndexOf('for');
			         startquantitybidfor=startquantitybidfor+3;
			          var avg=string.substring(startlotnum,endlotnum);
			          var quantitybidfor=string.substring(startquantitybidfor,endquantitybidfor);
			          document.getElementById("a").value=avg;
			          document.getElementById("q").value=quantitybidfor;
			          document.getElementById("a").innerHTML=avg;
			          document.getElementById("q").innerHTML=quantitybidfor;
			         // console.log(avg+" "+quantitybidfor);
			         
			    }
			    };
			    xmlhttp.open("POST", "Averageprice.do", true);
				xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded"); 
				var farmerid=document.getElementById("farmerid").value;
				//console.log("farmerid="+farmerid);
				//console.log("xmlhttp.send(farmerid)"+xmlhttp.send(farmerid));
				xmlhttp.send("farmerid="+farmerid);
				//console.log("end of function");
		  }
</script>

</body>
</html>