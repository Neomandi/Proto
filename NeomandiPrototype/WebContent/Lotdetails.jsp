<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp" errorPage="Error.jsp"
    import=" com.neomandi.prototype.JDBCHelper, 
    java.io.PrintWriter, java.sql.Connection, 
    java.sql.ResultSet,java.sql.Statement,
    javax.servlet.ServletException,
	javax.servlet.http.HttpServlet,
 	javax.servlet.http.HttpServletRequest,
	javax.servlet.http.HttpServletResponse,
	java.sql.SQLException,java.text.SimpleDateFormat,
	
	
	java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*,java.util.Date"%>

 
<html>
<head>
<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NeoMandi</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link rel="icon" type="image1/png" href="Images/Neomandi1.png">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
		<link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/sweetalert.css" rel="stylesheet" type="text/css">
<script src="js/sweetalert.min.js" type="text/javascript"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style type="text/css">
.img-responsive{
    	height: 60px;
    	width: 65px;
    }
    .tradtab a{
    background-color:#0082B2;
    }
    h4{
    	color:#6C2DC7;
    }
     #image{
    height:300px;
    width:300px;}
    #div{
    		padding:30px;
			margin:200px;
			width:30%;
			background-color:#F2F2F2;
			text-align:center;
			color:darkblue;	 
			font-size:18px;
    }
    	.ltable thead {
    	background: #00B0B2 !important;
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
HttpSession hs=request.getSession(false); 
if((String)hs.getAttribute("name")==null){
	out.println("<script>swal({title: 'You have not logged in. Please login',text: 'You will be redirected to login page.',timer: 2000,showConfirmButton: false},function(){window.location='http://neomandi.in/Login.html';});</script>");
}
	String name=(String)hs.getAttribute("name"); %>
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><p style="font-size:16px; color:white;"><%=name %>, welcome to e-auction at NeoMandi.</p></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="Login.html"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>

<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li><a href="FarmerMaster.jsp">Auction</a></li>
    <li class="active"><a href="Lotdetails.jsp">My Lots</a></li>
    <li><a class="classbeauty" id="ts" href="#"> Summary </a></li>
    <li><a href="FarmerProfile.jsp">My Profile</a></li>
    <li><a href="FarmerSummaryInt.jsp">History</a></li>
  </ul>
</div>
</div>
</div>
<div class="container-fluid lots pad">
<div class="tabin">
<div class="lottable">
<%

	 HttpSession hs1=request.getSession(false);  
     String pass=(String)hs1.getAttribute("pass"); 
     String starttime=(String)hs.getAttribute("starttime"); 
	 
	 String endtime=(String)hs.getAttribute("endtime"); 
	  
	  ServletContext context = request.getSession().getServletContext();
		starttime=(String)context.getAttribute("starttime");
		endtime=(String)context.getAttribute("endtime");
   	// String time=(String)hs.getAttribute("time");
  	SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss");
  	Date d=new Date();
  	String time=df1.format(new Date());
	 Connection con = null;
     Statement statement = null;
     ResultSet resultSet = null;    
     con = JDBCHelper.getConnection();
     String s="";
     try{	
     	if(con == null)
     	{
     		System.out.println("Connection establish failed");
     	}
     	statement = con.createStatement();
     	String sql = "select aadharnum from freg where pass='"+pass+"' ";
     	System.out.println(sql);
     	resultSet = statement.executeQuery(sql);
    	while(resultSet.next()){
  			s+=resultSet.getString("aadharnum");
		    System.out.println("aadhar number="+s);

		}
	}
	catch(SQLException e)
	{
		e.printStackTrace();	
	}
     
%>
<table class="table ltable">

<thead><tr>
          <td></td>
	  <td><h4>Lot Number</h4></td>
	  <td><h4>Produce</h4></td>
	  <td><h4>Product</h4></td>
	  <td><h4>Grade</h4></td>
	  <td><h4>Quantity(kg)</h4></td>
	  <td></td><td></td>
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
    String date="";
    String slot="";
	String s1="";
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
	//	System.out.println(rs.getRow());
		//System.out.println(rs.first());
		String lotnumber1=null;
		if(rs.next())
		{
			lotnumber1 = rs.getString("lotnumber");
			System.out.println("lotnumber="+lotnumber1);
		}
		
		if(lotnumber1 != null)
		{
			System.out.println("Inside if....");
			
				String sql2 = "select * from productentry where farmerid='"+s+"'";
				pstmt1 = con.prepareStatement(sql2);
				rs1 = pstmt1.executeQuery();
				
					while(rs1.next())
					{
						lotnumber=rs1.getString("lotnumber");
						String produce=rs1.getString("produce");
						String product= rs1.getString("kindofpro");
						String grade=rs1.getString("qualitygrade");
						String quantity=rs1.getString("quantity");
						
						slot+=rs1.getString("slotnumber");
						if(rs1.getString("slotnumber").equals("slot1")){
							   imgsrc="ProductImages/"+lotnumber+".jpg";
						  		}
						  		else{
						  			imgsrc="ProductImages/"+rs1.getString("produce")+"-"+rs1.getString("qualitygrade")+".jpg";
						  		}
						
						  
					
						
		%>
	<tr class="gradeX"><td></td><td><button type="button" class="btn popup" data-toggle="modal" data-target="#myModal1" style="color:#000080; border-radius:9px; border: 1px solid #808080;"> <%=lotnumber %></button></td><td><h4  style="color:#000080"><%=rs1.getString("produce")%></h4></td><td><h4  style="color:#000080"><%=product%></h4></td><td><h4  style="color:#000080"><%=grade%></h4></td><td><h4  style="color:#000080"><%=quantity %></h4></td><td></td></tr>
	 
		                        <%
					}
		
		}
		else if(lotnumber1 == null)
		{
			 System.out.println("Inside else....");

			 out.println("<div id='div' style='position: absolute; top:3px; left: 230px;'><p ><b>No lot entries are found.</b></p></div>");

		}
	}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		JDBCHelper.Close(rs);
		JDBCHelper.Close(rs1);
		JDBCHelper.Close(pstmt);
		JDBCHelper.Close(pstmt1);
		JDBCHelper.Close(con);
	}
%>
                    </tbody>
                </table>
</div>
</div>
</div>

  
  <!---------modal image--------------->
<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Product Image</h4>
                    </div>
                    <div class="modal-body">
                        <img src="<%=imgsrc%>" class="img-responsive trad" id="image">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
<!--------modal image end------------>   
  

 

<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<div id="msg" style="visibility:hidden;" ></div>&nbsp;<font color='blue' ><div id="timer" style="visibility:hidden;" ></div></font></h4>
<div id="auction" style="visibility:hidden;"></div>
<div id="auction1" style="visibility:hidden;"></div>


<!-- fetching date and time for summary -->
<form>
	
<input type="hidden" value="<%=time%>" id="time" />
	<input type="hidden" value="<%=starttime%>" id="stime" />
	<input type="hidden" value="<%=endtime%>" id="etime" />
	<input type="hidden" value="<%=slot%>" id="slot" />
	<input type="hidden" value="<%=date%>" id="date" />
	
</form>
<script>
	

var Etime=document.getElementById("time").value;
var stime=document.getElementById("stime").value;
var etime=document.getElementById("etime").value;
console.log("starttime="+stime);
console.log("endtime="+etime);
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
			if(slot==s1){
				var Etime=document.getElementById("time").value;
				var Btime=stime;
				var Btime1=etime;
			
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
				console.log("before countdown function call");
				countdown(minutes,seconds,hours);
				
				
			}
		//--------------------------for slot2------------------------------------------------------------------------
		else if(slot==s2){
			var Etime=document.getElementById("time").value;
			var Btime=stime;
			var Btime1=etime;
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

			var five=300000;
			timedif=diff+five;
			console.log("count"+timedif);
	}
	//-------------------------------for slot3-----------------------------------------------------------------
		else if(slot==s3){
			var Etime=document.getElementById("time").value;
			var Btime=stime;
			var Btime1=etime;
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
			var idiff = parseInt("timedifference") + "<br>";
			countdown(minutes,seconds,hours);

			

			var five=300000;
			timedif=diff+five;
			console.log("count"+timedif);
			
	}
	//----------------------------------for slot4---------------------------------------------------------------	
		else if (slot==s4){
			var Etime=document.getElementById("time").value;
			var Btime=stime;
			var Btime1=etime;
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
			var idiff = parseInt("timedifference") + "<br>";
			countdown(minutes,seconds,hours);
			
			var five=300000;
			timedif=diff+five;
			console.log("count"+timedif);
			
		}
		//---------------------for count down timer----------------------------------	
			
function countdown(minutes,seconds,hours) 
{
			console.log("minutes,seconds,hpurs=" +minutes+ " "+hours+" "+seconds);
			console.log("inside countdown function");
	document.getElementById('ts').onclick = function() {
		  
		  location="http://neomandi.in/FarmerSummary.jsp";
	  }
	console.log("inside countdown function");
	document.getElementById('ts').disabled='true';
	 	var seconds =seconds;
	    var mins = minutes
	    var hour=hours;
	    var res1=0;
	    var res2=0;
	    var timedifference=+hours+":"+minutes+":"+seconds;
	   		   console.log("difference="+timedifference); 
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
		            	//swal("Auction under progress");
		            	   location="http://neomandi.in/BeforeAuction.do";
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
						
		            	var str="<h4><div id='a1'>Auction has begun. Auction will ends in</div>&nbsp;&nbsp;<div id='hms' > 5:00</div></h4>";
		            	
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
			        		           	var str1="<center><h4>Your Auction has ended</h4><center>";
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
