<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.text.SimpleDateFormat,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<link rel="icon" type="image1/png" href="Images/Neomandi1.png">
<link rel="stylesheet" href="libs/pure-min.css">
<link rel="icon" type="image1/png" href="Images/Neomandi1.png">
    <link rel="stylesheet" href="libs/grids-responsive-min.css">
	<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pure/0.6.0/grids-responsive-min.css">-->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <link href="css/sweetalert.css" rel="stylesheet" type="text/css">
<script src="js/sweetalert.min.js" type="text/javascript"></script>
    <style>
    	#div{
			padding:30px;
			margin:200px;
			width:70%;
			background-color:#E5E4E2;
    	}
    	.img-responsive{
    	height: 60px;
    	width: 65px;
    }
    body {
		    background-image: url("images/nm-white-background-pattern.png");
		    background-repeat:no-repeat;
		    background-size:cover;
		}
    </style>
</head>
<body>
<% 		response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
		HttpSession alog = request.getSession(false);

	    if((String)alog.getAttribute("aname")==null || (String)alog.getAttribute("apwd")==null)
	    {
	    	//System.out.println("Session invalid."+elog);
	    	out.println("<script>swal({title: 'You have not logged in. Please login',text: 'You will be redirected to login page. Click OK',type:'error'},function(){window.location='http://neomandi.in/AdminLogin.jsp';});</script>");
	    }
%>
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<div class="col-lg-offset-1 col-lg-10 col-sm-offst-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><p style="font-size:16px; color:white;"><%= (String)alog.getAttribute("aname") %>, welcome to e-auction at NeoMandi.</p></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="ALogout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li class="active"><a href="Admin.jsp"> Controls </a></li>
  </ul>
</div>
</div>
</div>

<center>
<div class="container-fluid" id="div" >

<form method="post" name="admin" class="form-inline">
		<div class="form-group form-group-lg">	
			<label for="starttime">Start Time: </label>
			<input type="text" name="starttime" class="form-control" value="${param.starttime}" id="starttime" placeholder="10:30:00" style="width:200px; height: 50px;"/>&nbsp;&nbsp;
		</div>
		<div class="form-group form-group-lg">
			<label for="endtime">End Time: </label>
			<input type="text" name="endtime" class="form-control" value="${param.endtime}" id="endtime" placeholder="10:35:00" style="width:200px; height: 50px;"/>
		</div><br/><br/>
	<input type="button" name="start" value="Start Auction" class="btn btn-success btn-lg" onClick="fun()" style="width:200px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="stop" value="Stop Auction" class="btn btn-danger btn-lg" onClick="fun1()" style="width:200px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="reset" name="reset" value="Reset Auction" class="btn btn-warning btn-lg" onClick="fun2()"  style="width:200px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<br/><br/><div align="center">
			<div id="msg" style="display:inline;" >Auction will begin in</div>
			<div id="timer" style="display:inline;" ></div>
			<div id="auction" style="display:inline;"></div>
			<div id="auction1" style="display:inline;"></div>
		</div>	
</form>
</div></center>
<script>
var Btime1;
function fun()
{
	 console.log("start time is "+ document.getElementById("starttime").value);
	 if(starttime == "" && endtime == "")
	 {
		 alert("Please fill the fields");
	 }
	 else
	 {
		  xmlhttp = new XMLHttpRequest();
		  xmlhttp.onreadystatechange = function() {
		  if (this.readyState == 4 && this.status == 200) 
		  {
			    				         
		  }};
			  xmlhttp.open("POST", "Start.do", true);
			  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			  xmlhttp.send("starttime="+document.getElementById("starttime").value+"&&endtime="+document.getElementById("endtime").value);
			  
			  
			  var d = new Date(); // for now
			  d.getHours(); // => 9
			 d.getMinutes(); // =>  30
			  d.getSeconds();
			 console.log("System time: "+d);
			 
				var Etime=d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
				var Btime=document.getElementById("starttime").value;
				var Btime1=document.getElementById("endtime").value;
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
	 }
}
function fun1()
{
	swal({
		  title: "Are you sure you want to stop the auction?",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "Yes",
		  cancelButtonText: "No",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm){
			//console.log(isConfirm);
			  if (isConfirm) {
				  var stop = 1;
				  xmlhttp = new XMLHttpRequest();
				  xmlhttp.onreadystatechange = function() {
				  if (this.readyState == 4 && this.status == 200) 
				  {
					    				         
				  }};
					  xmlhttp.open("POST", "PostAuctionOperationServlet", true);
					  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
					  xmlhttp.send("stopauction="+stop);
					  
					swal("Stopped","Successfully", "success");
			  } else {
			    swal("Cancelled","Successfully", "error");
				return;
			  }
			});
}

function fun2()
{
	swal({
		  title: "Are you sure you want to reset the auction?",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "Yes",
		  cancelButtonText: "No",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm){
			//console.log(isConfirm);
			  if (isConfirm) {
				  var stop = 1;
				  xmlhttp = new XMLHttpRequest();
				  xmlhttp.onreadystatechange = function() {
				  if (this.readyState == 4 && this.status == 200) 
				  {
					    				         
				  }};
					  xmlhttp.open("POST", "PostAuction.do", true);
					  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
					  xmlhttp.send("starttime="+starttime+"&&endtime="+endtime);
					  
					swal("Reseted","Successfully", "success");
			  } else {
			    swal("Cancelled","Successfully", "error");
				return;
			  }
			});
}


		function countdown(minutes,seconds,hours) 
		{			  			 
			 	var seconds =seconds;
			    var mins = minutes
			    var hour=hours;
			    var res1=0;
			    var res2=0;
			    var timedifference=+hours+":"+minutes+":"+seconds;
			    var Btime1=document.getElementById("endtime").value;    
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
				            	var str="<div id='a1'style='display:inline; '>Auction has begun. It will end in</div>&nbsp;&nbsp;<div id='hms' style='display:inline;' > 5:00</div>";
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
				            		//console.log("minutes is"+minutes);
				            		//console.log("seconds is"+seconds1);
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
				        		        } 
				        		        else 
				        		        {
					        		       if(mins > 0)
					        		       {
					        		 		setTimeout(function () { count(mins - 1,60); },1000);
					        			   }
					        		       else
					        		       {
					        		           	var str1="Auction has ended";
					        		           	var strCmd2 = "document.getElementById('hms').style.cssText ='display:none'";
								            	var waitseconds = seconds;
								            	var timeOutPeriod = waitseconds * 1000;
								            	var hideTimer = setTimeout(strCmd2, timeOutPeriod);								            	
								            	var strCmd3 = "document.getElementById('a1').style.cssText ='display:none'";
								            	var waitseconds = seconds;
								            	var timeOutPeriod = waitseconds * 1000;
								            	var hideTimer = setTimeout(strCmd3, timeOutPeriod);						            	
								            	document.getElementById("auction1").innerHTML=str1;
								        //    	alert("AUCTION IS OVER YOU CAN CHECK THE STATUS IN STATUS TAB");
								            	console.log("AUCTION IS OVER");
								            	xmlhttp = new XMLHttpRequest();
								      		  	xmlhttp.onreadystatechange = function() {
								      		    if (this.readyState == 4 && this.status == 200) 
								      		    {}};
								      		    //console.log("your auction has ended");
								      		//  xmlhttp.open("POST", "PostAuction.do", true);
								      		//  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
								      	//	alert("YOU CAN CHECK THE STATUS IN STATUS PAGE");
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
		//countdown(minutes,seconds,hours);
</script>
</body>
</html>