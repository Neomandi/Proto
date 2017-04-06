<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1" import="java.util.*,
    java.io.InputStream,java.io.InputStreamReader,java.io.Reader,java.io.OutputStream, 
    com.neomandi.prototype.ProductSearchResultBean,java.io.BufferedInputStream,
    java.io.FileInputStream,java.awt.Image,javax.imageio.ImageIO,
	  java.io.IOException,
	 java.io.InputStream,
	 java.sql.Blob,com.neomandi.prototype.MyFinalCostBean, com.neomandi.prototype.MyFinalCostBean,java.util.*, com.neomandi.prototype.TradeListBean, java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*,
	 java.sql.Connection,
	 java.sql.ResultSet,
	 java.util.Date,
	 java.sql.SQLException,
	 com.neomandi.prototype.TraderLoginBean ,
	 java.sql.Statement,
	  java.text.SimpleDateFormat,java.util.Date,
	 java.awt.image.BufferedImage,
 java.io.ByteArrayInputStream,
 java.io.ByteArrayOutputStream,
 java.io.File,
 java.text.SimpleDateFormat,
 java.io.IOException,
 java.io.InputStream,
 javax.imageio.ImageIO" %><%@ page session="false" %>
<html>
<head>
<script src="js/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/sweetalert.css"><title>NeoMandi</title><!-- 
<meta http-equiv="refresh"  content="3; URL=TradeorAuction.do"> -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
input[type="number"],input[type="text"]
{
	text-align: center;
}
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    opacity:0;
    appearance: none;
    margin: 0; 
}
#slot,#slot2,#slot3
{
	cursor:pointer;
}

#div
{   		
	padding:22px;
	margin:10px;
	width:90%;
	background-color:#BFBFBF;
			text-align:center;
			color:darkblue;	 
			font-size:18px;
} 
#remove
{
	background: #3c4da0;
border-color: #3c4da0;
border-radius: 2px;
}
#remove:HOVER
{
	background: #ff0000;
    border-color: #ff0000;
    border-radius: 2px;
}
a
{
	cursor:pointer;
}
body {
		    background-image: url("images/nm-white-background-pattern.png");
		    background-repeat:no-repeat;
		    background-size:cover;
		}
</style>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script>
$( "p" ).click(function() {
  $( this ).toggleClass( "highlight" );
});
</script>
<style>
.maindiv{
overflow:auto;
}
#increment:ACTIVE
{
	border-color:#BDD102;
	color:#3C4DA0;
	
}
.tradtab a{
    background-color:#0082B2;
    }
</style>
<script>
var acc = document.getElementsByClassName("accordion");
var i;
for (i = 0; i < acc.length; i) {
  acc[i].onclick = function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
  	  panel.style.maxHeight = null;
    } else {
  	  panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  }
}
</script>
<style>
button.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button {  

   opacity: 3;

}
button.accordion.active, button.accordion:hover {
    background-color: #ddd;
}
#msg
{
	 text-align:right;
}
button.accordion:after {
    content: '\002B';
    color: #777;
    font-weight: bold;
    float: right;
    margin-left: 5px;
}

button.accordion.active:after {
    content: "\2212";
}

div.panel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}
</style>
<style>
.whiteclsbc{
background-color:#ffffff;
width:5%;
border-top:1px solid #fff !important;
}
tbody:before {
    display: block;
    line-height:10px;
    color: transparent;
}
.from table{
margin-top:0px;
} 
.autable .table tbody tr td, .lottable .table tbody tr td, .table tbody tr td, .sum2tab .table tbody tr td {
border-top:0px solid #fff !important;
}
.img-responsive {
	height: 60px;
	width: 65px;
}
#slot
{
	cursor:pointer;
}
</style>
</head>
<body class="" >
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far">
<%
response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
HttpSession tlog=request.getSession(false);
TraderLoginBean tlbn =null;
try
{
	tlbn = (TraderLoginBean)tlog.getAttribute("tlog");
	if(tlbn.getTname()==null){}
}
catch(NullPointerException e)
{
	%> 
	<script type="text/javascript\">
  	 swal({title:'YOU HAVE NOT LOGGED IN PLEASE LOGIN '});  	
  	 location='TraderLogin.jsp';
 	 </script>						 	 
<%
}
try
{%>
	<p style="font-size:16px; color:white;"><% out.println(tlbn.getTname());%>, welcome to e-auction at NeoMandi.</p></div>
<%}catch(NullPointerException e)
{
	%> 
	<script type="text/javascript\">
  	 swal({title:'YOU HAVE NOT LOGGED IN PLEASE LOGIN '});  	
  	 location='TraderLogin.jsp';
 	 </script>						 	 
<%
} %>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" data-placement="bottom" onclick="logout()" data-toggle="tooltip" title="Logout" ><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
<script>
	function logout()
	{
		var msg=document.getElementById("timer").textContent;
		var msg1=document.getElementById("auction1").textContent;
		console.log(msg);
		if(msg!=null)
		{
			if((msg.includes('begun'))&&!(msg1.includes("end")))
			{
				/* if (confirm('Auction is under progress do you want to Logout?? ')) 
	    	    {
					window.location='logout.do';
	    	    }
				else //if(msg.includes('has ended'))
				{
				}	 */	
				
				 swal(
				        	{
					        	  title: "Auction is under progress do you want to Logout?? ",
					        	 /*  text: "You will not be able to recover this imaginary file!",
					        	  */ type: "warning",
					        	  showCancelButton: true,
					        	  confirmButtonColor: "green",
					        	  confirmButtonText: "Yes",
					        	  cancelButtonText: "No",
					        	  closeOnConfirm: false,
					        	  closeOnCancel: false
				        	},
				        	function(isConfirm)
				        	{
				        		  if(isConfirm)
				        		  {
				        			  window.location='logout.do';
								  }
				        		  else 
				        		  { /*  swal("Cancelled","Successfully", "error");
				  				return; */
				  				window.location='TradeorAuction.do';}
				             }
				        	);	
			}
			else
				window.location='logout.do';
		}
		else
		window.location='logout.do';
	}	
</script>
</div>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    					<li><a href="product.jsp">Product Search</a></li>
                        <li><a href="TraderBlock.do">Hold Funds</a></li>
                        <li  class="active"><a href="TradeorAuction.do">Trade</a></li>
                        <li><a href="OrderStatus.do">Status</a></li>
                        <li><a href="Summary1.do">Summary</a></li>
                        <li><a href="TraderProfile.jsp">My Profile</a></li>
  </ul>
</div>
</div>
</div>
<div class="maindiv">
<div id="slot" class="container-fluid slot"><h5 id=""class="text-center"  data-toggle="collapse" data-target="#accord1"><span>Auction Slot-1</span>	
		<div id="msg" style="display:inline;"> will begin in</div>&nbsp;&nbsp;
		<div id="timer" style="display:inline;" ></div>
	  	<div id="auction" style="display:inline;"></div>
		<div id="auction1" style="display:inline;"></div>
		<span class="pull-right">
		<i class="fa fa-chevron-down" aria-hidden="true"></i></span></h5></div>
<%
	ServletContext context = request.getSession().getServletContext();
	String start=(String)context.getAttribute("starttime");
	System.out.println("starttime="+start);
	String stop=(String)context.getAttribute("endtime");
	System.out.println("end="+stop);
	String msg="start";
	//System.out.println("INSIDE TOA2.JSP start is "+(String)context.getAttribute("starttime"));
%>
  <input type="hidden" id="POSTAUCTION" value="start"/>
  <div id="accord1"> 
  <input type="hidden" value="<%SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss"); String date=df1.format(new Date()); out.println(date);%>" id="time">
  <input type="hidden" value="<%System.out.println("star time is"+start); out.println(start);%>" id="start">
  <input type="hidden" value="<%System.out.println("stop time is"+stop); out.println(stop);%>" id="stop">
  <script>
  var i=0;
  var start=document.getElementById("start").value;
  var stop=document.getElementById("stop").value;
  var Etime=document.getElementById("time").value;
  var Btime=start;
  var Btime1=stop;
  console.log("end time above is "+stop);
  start = Etime.split(":");
  end =Btime.split(":");
  var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
  var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
  diff = endDate.getTime() - startDate.getTime();
  var hours = Math.floor(diff / 1000 / 60 / 60);
  var seconds= Math.floor(diff /1000);
  var minutes = Math.floor(diff / 1000 / 60);
  var res3=0;
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
  var timedifference=+hours+":"+minutes+":"+seconds;
  var m=0;
  countdown(minutes,seconds,hours);	

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

								/*(function(){
										  if( window.sessionStorage )
										  {
										    if( !sessionStorage.getItem( 'firstLoad' ) )
										    {
										    	sessionStorage[ 'firstLoad' ] = true;
										      console.log("Before reload1");
										      window.location.reload();
										    }  
										    else{
										    	console.log("Before reload2");
										    	sessionStorage.removeItem( 'firstLoad' );								      
										    }
										  }
								})(); */
								
								var str="<div id='a1'style='display:inline;color:white; '>has begun. It will end in</div>&nbsp;&nbsp;<font color='white;'><div id='hms' style='display:inline;color:white;' > 5:00</div></font>";	          						            	
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
				        		    	//debugger;				        		    	
				        		    	var counter = document.getElementById("hms");
				        		        var current_minutes = mins;
				        		      // console.log("++"+seconds);
				        		       	seconds--;
				        		        counter.innerHTML =current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
				        		        if( seconds > 0 )
				        		        {
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
					        		    	     <%
					        		    		   	/*  HttpSession countdown=request.getSession(false);
					        		    		   System.out.println("countdown.getAttribute( "+countdown.getAttribute("timer"));
													 if(countdown.getAttribute("timer").equals("0")){
													 System.out.println("isnide if"); */%>
								            	var str1="has ended";
					        		           	var strCmd2 = "document.getElementById('hms').style.cssText ='display:none'";
								            	var waitseconds = seconds;
								            	var timeOutPeriod = waitseconds * 1000;
								            	var hideTimer = setTimeout(strCmd2, timeOutPeriod);								            	
								            	var strCmd3 = "document.getElementById('a1').style.cssText ='display:none'";
								            	var waitseconds = seconds;
								            	var timeOutPeriod = waitseconds * 1000;
								            	var hideTimer = setTimeout(strCmd3, timeOutPeriod);						            	
								            	document.getElementById("auction1").innerHTML=str1;
								            	swal({title:'',text:"Auction is over you can check the status in status tab",});
								            	console.log("AUCTION IS OVER");
								            	
								            	xmlhttp = new XMLHttpRequest();
								      		  	xmlhttp.onreadystatechange = function() {
								      		    if (this.readyState == 4 && this.status == 200) 
								      		    {}};
								      		    xmlhttp.open("POST", "Slotchange.do", true);
									      		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
												xmlhttp.send("number=1");
												document.getElementById('POSTAUCTION').value='end';												
												<%
												/* try{
													System.out.println("request.getAttributemsg"+request.getAttribute("msg"));
													if(request.getAttribute("msg")!=null &&request.getAttribute("msg").equals("block"))
													{msg=null;}
													System.out.println(msg); 
												}
												catch(Exception e)
												{e.printStackTrace();} */
												%>
												i=9;
					        		    	   <%
					        		    	   	/* countdown.setAttribute("timer",1);
												}else
					        		    	   {
					        		    	   } */%>
					        		    	   
					        		       } 
				        		    	}
			        		     	}
				        		   tick();
			        			}		
				            	//var Etime1=document.getElementById("time").value;
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
				            	console.log("difference in seconds is "+seconds1);
				            	count(minutes1,seconds1);			        			
							}
						}
					}		       
		 		}
		 tick();
		}
			
		/* var a=document.getElementById("timer").value;
		if(typeof a==="undefined")
		{		
			//console.log("inside if()")	 		 
		}
		else
		{
				//	console.log("inside else)")
		} */
	</script>
     <%
     
	  int z=1;
	  String msg1=(String)request.getAttribute("notlogged");
	  if(msg1!=null)
	  {
		 out.println("<script type=\"text/javascript\">");
	  	 out.println("swal('YOU HAVE NOT LOGGED IN PLEASE LOGIN ');");
	  	 out.println("location='TraderLogin.jsp';");
	 	 out.println("</script>");
	  }
	  else
	  {		  
	   	/* if(msg!=null&&msg.equals("start"))
	   	 */ 	msg=(String)request.getAttribute("msg");
	   	System.out.println("inside jsp in body msg is "+msg);
	    if(msg!=null)
	    {
			  out.println("<script type=\"text/javascript\">");
		  	  out.println("swal('Your final cost has exceeded the amount blocked for trade. You will be redirected to the Hold fund page to block sufficient funds ');");
		  	//  out.println("window.location='TraderBlock.do';");
		 	  out.println("</script>");
		}
		else 
		{	
			String msg2=(String)request.getAttribute("assigned");
			if(msg2!=null)
			{
				out.println("<script type=\"text/javascript\">");
			  	out.println("swal('You need to enter the number of bid to be increased before');");
			  	out.println("location='TradeorAuction.do';");
			 	out.println("</script>");
			}
			else
			{
			int i=0;
			int finalcostlist=0;
			int tradelist=0;
			int p=0;
			System.out.println(request.getAttribute("remove"));
			if(request.getAttribute("remove")==null)//not removed any row
			{
				HttpSession traderlistbean=request.getSession(false);
				List<TradeListBean> al=(List<TradeListBean>)traderlistbean.getAttribute("tlb");
				System.out.println(al);
				try{System.out.println(al.size()==0 );
				if(al.size()==0){
					System.out.println(al.size()==0 );
				%><br>
					<center><div id='div' style='background-color: #F2F2F2; top: 100px; left: 140px;'><p ><b>No produce has been chosen by you for the auction. Please go to Product Search page to add a lot of the produce to participate in the auction.</b></p></div></center>
				<br>
				<%	
				}}
				catch(Exception e)
				{
					%><br>
					<center><div id='div' style=' top: 100px; left: 140px;'><p ><b>No produce has been chosen by you for the auction. Please go to Product Search page to add a lot of the produce to participate in the auction.</b></p></div></center>
				<br>
				<%	
				}
				for(Object o:al)
				{
					TradeListBean tlb=(TradeListBean)o;
					if(tlb.getSlotnumber()!=null && (tlb.getSlotnumber().equals("slot1")||tlb.getSlotnumber().equals("Slot1")))
					{				
						HttpSession MyFinalCost=request.getSession(false);
						List l=(List)MyFinalCost.getAttribute("MyFinalCost"); 
						System.out.println("list l is "+l);
						for(Object m:l)
						{	
							System.out.println("myfinalcostbean list size"+l.size()+l);
							MyFinalCostBean mfcb=(MyFinalCostBean)m;
							if(l.size()==0){
								%><center><div id='div' style=' top: 100px; left: 140px;'><p ><b>No produce has been chosen by you for the auction. Please go to Product Search page to add a lot of the produce to participate in the auction.</b></p></div></center>
						<br><%}
							if(mfcb.getLotnum().equals(tlb.getLotnum()))
							{   
								++p;
								System.out.println("lot number is "+mfcb.getLotnum()+" cost->"+mfcb.getLotcost()+" quantityassigned->"+mfcb.getQuantityassigned());
%>	<div class="one">
	<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
	<div class="table-responsive"> 
  	<table>
	<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold"><%out.println(z);z++; %></td>
	<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
	<table align="center">
	<tbody >
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="demo1<%=tlb.getLotnum()%>" type="text" value="<%= tlb.getLotnum() %>" readonly></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text" value="<%= tlb.getProduce() %>"readonly ></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text" value="<%=tlb.getQualitygrade() %>" readonly></td></tr>
	<tr><td><h4>Available Lot Size (kg)</h4></td><td><input class="form-control" id="usr" type="text" value="<%= tlb.getQuantity()%>"readonly ></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;font-weight:bold">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Cost (Rs)</h4></td><td><input class="form-control" id="demo2<%=tlb.getLotnum()%>" type="text" value="<%= mfcb.getLotcost() %>" style="text-align: right;" readonly></td></tr>
	<tr><td><h4>Commission Charges (Rs)</h4></td><td><input class="form-control" id="demo3<%=tlb.getLotnum()%>" style="text-align: right;" type="text" value="<%= mfcb.getCommission() %>" readonly></td></tr>
	<tr><td><h4>Market Cess (Rs)</h4></td><td><input class="form-control" id="demo4<%=tlb.getLotnum()%>" type="text" style="text-align: right;" value="<%= mfcb.getMarketcess()%>"readonly ></td></tr>
	<tr><td><h4>Transportation Charges (Rs)</h4></td><td><input class="form-control" id="transportation<%=tlb.getLotnum()%>" style="text-align: right;" type="text" value="<%if(mfcb.getLotcost().equals("0")) out.println("0"); else out.println("3000"); %>" readonly></td></tr>
	<tr><td><h4>My Final Cost (Rs)</h4></td><td><input class="form-control" id="demo8<%=tlb.getLotnum()%>" type="text"style="text-align: right;"  value="<%if(mfcb.getLotcost().equals("0")) out.println("0"); else out.println(mfcb.getMyfinalcost()); %>"readonly></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table >
	<tbody>
	<tr><td><h4>Required Lot Size (kg)</h4></td><td><h4>Assigned Lot Size (kg)</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="needed<%=tlb.getLotnum() %>" type="text" onclick="quantneeded<%=tlb.getLotnum()%>()"   value="<%=tlb.getQuantityneeded()%>" style="width:144px" readonly></td>
	<td class="clspadt5"><input class="form-control clsheight" id="demo7<%=tlb.getLotnum() %>" type="text" value="<%=mfcb.getQuantityassigned()%>" style="width:164px"readonly></td></tr>
	<tr><td><h4>Best Bid (Rs/kg)</h4></td><td><h4>My Bid(Rs/kg)</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="demo5<%=tlb.getLotnum()%>" type="text" value="<%=mfcb.getBestbid()%>" style="height:30px;" readonly></td><td class="inp clspad10"><input data-toggle="tooltip" title="Enter your bid here" data-placement=bottom class="form-control" id="demo6<%=tlb.getLotnum()%>" type="number" min="<%= mfcb.getPrice()%>"  max="999" maxlength="3" value="<%= mfcb.getPrice()%>" style="width:164px; height:30px;">
	</td>
	</tr>
	</tbody>
	</table><p style="font-size: 14px; position:absolute; left: 64%;"><b>Enter your bid here</b></p>
	<script>
		function quantneeded<%=tlb.getLotnum()%>() {
		 swal('You can increase the lotsize  in Product Search tab');
	    }
		<%-- document.getElementById("needed<%=tlb.getLotnum() %>").addEventListener("keypress ", function(){
			 console.log('here');
		   	 swal('You can increase the lotsize  in Product Search tab');		    
            }); --%>
		
		var bestbids=document.getElementById("demo5<%=tlb.getLotnum()%>").value;
		var bestbid=new  Number(bestbids);		
		var mybids=document.getElementById("demo6<%=tlb.getLotnum()%>").value;
		var mybid=new  Number(mybids);
		/* console.log("best bid is"+bestbid);
		console.log(" my bid is"+mybid+" ");
		 *///console.log(mybid==0);
		if(mybid<bestbid&&mybid>0)
		{
				console.log("mybid<bestbid")
				document.getElementById("demo6<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 75px #FFA500 inset";
		}
		else if(mybid-bestbid==0||mybid>bestbid)
		{
			document.getElementById("demo6<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 75px green inset";
			console.log("mybid-bestbid==0");
		}
		else if(mybid==0)
		{
			document.getElementById("demo6<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 65px red inset";
			console.log("mybid==0");
		}	
		
		document.getElementById("demo6<%=tlb.getLotnum()%>").addEventListener("keyup", function(event1){
            event1.preventDefault();
            if(event1.which == 13 || event1.keyCode == 13) 
            {
            	fun<%out.print(tlb.getLotnum());%>();
            }
            });
		//**********************************************************THIS IS FOR AUTOREFRESH**************************************************************************************
		setInterval(function()
				  {
					funny();
				  },2000);
		
		function funny()
 		{		  
			var needed=document.getElementById("needed<%=tlb.getLotnum() %>").value;
			 		    xmlhttp = new XMLHttpRequest();
					    xmlhttp.onreadystatechange = function() {
					    if (this.readyState == 4 && this.status == 200) 
					    {	
					    	 var msg=document.getElementById("timer").textContent;
							 var msg1=document.getElementById("auction1").textContent;							
					    	 var string=xmlhttp.responseText;
					    	 console.log(msg);
					    	 if(msg!=null && (msg.includes('begun'))&&!(msg1.includes("end"))&& string.includes("block"))
					    	 {
					    		   swal('Your final cost has exceeded the amount blocked for trade. You will be redirected to the Hold fund page to block sufficient funds ');
					  	  	       //window.location='TraderBlock.do';
					    	}
					    	else
					    	{	
					    	 var startlotnum=xmlhttp.responseText.indexOf('lotnum');
					         var endlotnum=xmlhttp.responseText.lastIndexOf('lotnum');
					         startlotnum=startlotnum+6;
					         
					         var startlotcost=xmlhttp.responseText.indexOf('lotcost');
					         var endlotcost=xmlhttp.responseText.lastIndexOf('lotcost');
					         startlotcost=startlotcost+7;
					         
					         var startcommission=xmlhttp.responseText.indexOf('commission');
					         var endcommission=xmlhttp.responseText.lastIndexOf('commission');
					         startcommission=startcommission+10;
					         
					         var startmarket=xmlhttp.responseText.indexOf('market');
					         var endmarket=xmlhttp.responseText.lastIndexOf('market');
					         startmarket=startmarket+6;
					         
					         var startbestbid=xmlhttp.responseText.indexOf('bestbid');
					         var endbestbid=xmlhttp.responseText.lastIndexOf('bestbid');
					         startbestbid=startbestbid+7;
					         
					         var startmybid=xmlhttp.responseText.indexOf('mybid');
					         var endmybid=xmlhttp.responseText.lastIndexOf('mybid');
					         startmybid=startmybid+5;
					         
					         var startassigned=xmlhttp.responseText.indexOf('assigned');
					         var endassigned=xmlhttp.responseText.lastIndexOf('assigned');
					         startassigned=startassigned+8;
					         
					         var startfinal=xmlhttp.responseText.indexOf('final');
					         var endfinal=xmlhttp.responseText.lastIndexOf('final');
					         startfinal=startfinal+5;

					         document.getElementById("demo1<%= tlb.getLotnum() %>").innerHTML = string.substring(startlotnum,endlotnum);
					         var assigned=string.substring(startassigned,endassigned);
					        // console.log("assigned is "+string.substring(startassigned,endassigned));
					         if(assigned=="0")
					         {					        	 
					        	 var symbol="-";
					        	 var number=0;
					        	 var assigned=string.substring(startassigned,endassigned);
					        	 var bestbid=string.substring(startbestbid,endbestbid);
							     var mybid=string.substring(startmybid,endmybid);
							         
					        	 document.getElementById("demo2<%= tlb.getLotnum() %>").innerHTML = number;
						         document.getElementById("demo3<%= tlb.getLotnum() %>").innerHTML = number;
						         document.getElementById("demo4<%= tlb.getLotnum() %>").innerHTML = number;
						         document.getElementById("transportation<%= tlb.getLotnum() %>").innerHTML = number;
						         
						         document.getElementById("demo2<%= tlb.getLotnum() %>").value = number;
						         document.getElementById("demo3<%= tlb.getLotnum() %>").value = number;
						         document.getElementById("demo4<%= tlb.getLotnum() %>").value = number;
						         document.getElementById("transportation<%= tlb.getLotnum() %>").value = number;
						      
						         document.getElementById("demo5<%= tlb.getLotnum() %>").innerHTML =bestbid;
						         document.getElementById("demo5<%= tlb.getLotnum() %>").value =bestbid;
						       //  console.log(string.substring(startbestbid,endbestbid));
						       //  document.getElementById("demo6<%= tlb.getLotnum() %>").innerHTML = mybid;
						      //   document.getElementById("demo6<%= tlb.getLotnum() %>").value = mybid;
						         document.getElementById("demo7<%= tlb.getLotnum() %>").innerHTML = assigned;
						         document.getElementById("demo8<%= tlb.getLotnum() %>").innerHTML = number;
						         document.getElementById("demo7<%= tlb.getLotnum() %>").value = assigned;
						         document.getElementById("demo8<%= tlb.getLotnum() %>").value = number;
						         
						     //    document.getElementById("mybid<%= tlb.getLotnum() %>").innerHTML = mybid;
						      //   document.getElementById("mybid<%= tlb.getLotnum() %>").value = mybid;
						         
						         var bid=new  Number(string.substring(startmybid,endmybid));
						         bid=bid+1;
						         document.getElementById("demo6<%= tlb.getLotnum() %>").setAttribute("min",mybid);
						        
						         var quantityneededs=document.getElementById("needed<%=tlb.getLotnum()%>").value;
						 		 var quantityneeded=new  Number(quantityneededs);	
						 		//console.log(quantityneededs);
						 		 var assigneds=new Number(assigned);
						 		if(assigneds==0)
								{
									//console.log("quantityneeded==0");
									document.getElementById("demo7<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 65px red inset";
								}	
								
								else if(quantityneeded-assigneds==0)
								{
									document.getElementById("demo7<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 65px green inset";
								//	console.log("quantityneeded-quantityassigned==0");
								}
								else if(assigneds<quantityneeded&&assigneds>0)
								{
									//console.log("quantityneeded="+quantityneeded+"quantityassigned"+assigneds);
										document.getElementById("demo7<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 65px #FFA500 inset";
								}
						 		
						 		var bestbids=document.getElementById("demo5<%=tlb.getLotnum()%>").value;
								var bestbid=new  Number(bestbids);		
								var mybids=document.getElementById("demo6<%=tlb.getLotnum()%>").value;
								var mybid=new  Number(mybids);
							//	console.log("best bid is"+bestbid+" my bid is"+mybid+" ");
								//console.log(mybid==0);
								if(mybid<bestbid&&mybid>0)
								{
								//	console.log("mybid<bestbid")
										document.getElementById("demo6<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 75px #FFA500 inset";
								}
								else if(mybid-bestbid==0||mybid>bestbid)
								{
									document.getElementById("demo6<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 75px green inset";
									//console.log("mybid-bestbid==0");
								}
								else if(mybid==0)
								{
									document.getElementById("demo6<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 65px red inset";
									//console.log("mybid==0");
								}	
								// console.log(" best bid is"+string.substring(startbestbid,endbestbid));
						         //console.log("assigned =0");
						     //    console.log("my bid is "+mybid);
						      //   console.log("needed is "+needed);
						       //  console.log("asssigned="+assigned);
						       //  console.log("trans= 0");
					         }
					         else
					         {
					        	 var number=0;
					        	 var assigned=string.substring(startassigned,endassigned);
					        	 var bestbid=string.substring(startbestbid,endbestbid);
							     var mybid=string.substring(startmybid,endmybid);
							     var lotcost=string.substring(startlotcost,endlotcost);
							     var commission=string.substring(startcommission,endcommission);
							     var marketcess=string.substring(startmarket,endmarket);
							     var final=string.substring(startfinal,endfinal);
							     
							   //  console.log("assigned="+assigned+" bestbid "+bestbid+" ");
							     
						         document.getElementById("demo2<%= tlb.getLotnum() %>").innerHTML = lotcost;
						         document.getElementById("demo2<%= tlb.getLotnum() %>").value = lotcost;
						         
						         document.getElementById("demo3<%= tlb.getLotnum() %>").innerHTML = commission;
						         document.getElementById("demo3<%= tlb.getLotnum() %>").value = commission;
						         
						         document.getElementById("transportation<%= tlb.getLotnum() %>").innerHTML = 3000;
						         document.getElementById("transportation<%= tlb.getLotnum() %>").value = 3000;
						         
						         document.getElementById("demo4<%= tlb.getLotnum() %>").innerHTML = marketcess;
						         document.getElementById("demo4<%= tlb.getLotnum() %>").value = marketcess;
						         
					        	 document.getElementById("demo5<%= tlb.getLotnum() %>").innerHTML =bestbid;
					        	 document.getElementById("demo5<%= tlb.getLotnum() %>").value =bestbid;
					        	 
						       //  document.getElementById("demo6<%= tlb.getLotnum() %>").innerHTML = mybid;
						       //  document.getElementById("demo6<%= tlb.getLotnum() %>").value = mybid;
						         
						         document.getElementById("demo7<%= tlb.getLotnum() %>").innerHTML = assigned;
						         document.getElementById("demo7<%= tlb.getLotnum() %>").value =assigned;
						         
						         document.getElementById("demo8<%= tlb.getLotnum() %>").innerHTML =final;
						         document.getElementById("demo8<%= tlb.getLotnum() %>").value =final;
						         
						      //   document.getElementById("mybid<%= tlb.getLotnum() %>").innerHTML = mybid;
						      //   document.getElementById("mybid<%= tlb.getLotnum() %>").value = mybid;
						         
						         var bid=new  Number(string.substring(startmybid,endmybid));
						         bid=bid+1;
						         document.getElementById("demo6<%= tlb.getLotnum() %>").setAttribute("min",mybid);
						    //   console.log("input is "+input+"symbol is"+symbol+" best bid is"+string.substring(startbestbid,endbestbid));
						       /*  console.log("lotcost "+string.substring(startlotcost,endlotcost));
						         console.log("commssion "+string.substring(startcommission,endcommission));
						         console.log("marketcess "+string.substring(startmarket,endmarket));
						         console.log("my bid "+string.substring(startmybid,endmybid));
						         console.log("bestbid "+string.substring(startbestbid,endbestbid));
						         console.log("assigned "+string.substring(startassigned,endassigned));
						         console.log("final "+string.substring(startfinal,endfinal));
						         console.log("quantityassigned "+assigned);*/
					        
						         var quantityneededs=document.getElementById("needed<%=tlb.getLotnum()%>").value;
						 		 var quantityneeded=new  Number(quantityneededs);	
					         
						 		 var assigneds=new Number(assigned);
						 		if(assigneds==0)
								{
									//console.log("quantityneeded==0");
									document.getElementById("demo7<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 65px red inset";
								}	
								
								else if(quantityneeded-assigneds==0)
								{
									document.getElementById("demo7<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 65px green inset";
									//console.log("quantityneeded-quantityassigned==0");
								}
								else if(assigneds<quantityneeded&&assigneds>0)
								{
										//console.log("quantityneeded<quantityassigned");
										document.getElementById("demo7<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 65px #FFA500 inset";
								}						 		
						 		var bestbids=document.getElementById("demo5<%=tlb.getLotnum()%>").value;
								var bestbid=new  Number(bestbids);		
								var mybids=document.getElementById("demo6<%=tlb.getLotnum()%>").value;
								var mybid=new  Number(mybids);
								//	console.log("best bid is"+bestbid+" my bid is"+mybid+" ");
								//console.log(mybid==0);
								if(mybid<bestbid&&mybid>0)
								{
									//console.log("mybid<bestbid")
										document.getElementById("demo6<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 75px #FFA500 inset";
								}
								else if(mybid-bestbid==0||mybid>bestbid)
								{
									document.getElementById("demo6<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 75px green inset";
								//	console.log("mybid-bestbid==0");
								}
								else if(mybid==0)
								{
									document.getElementById("demo6<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 65px red inset";
									//console.log("mybid==0");
								}
							//	 console.log(" best bid is"+string.substring(startbestbid,endbestbid));
						        // console.log("assigned ="+assigneds);
						    //     console.log("my bid is "+mybid);
						     //    console.log("needed is "+needed);
						      //   console.log("asssigned="+assigned);
						      //   console.log("trans= 3000");
					         }
					    	}
					    }};
					    xmlhttp.open("POST", "refresh.do", true);
						xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded"); 
						xmlhttp.send("number="+1+"&lotnumber="+1);
 		}
		</script>
		</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
		<table align="center"><tbody><tr><td><button class="btn btn-primary" id="increment" style="width:143px; text-align:enter; border-color:#BDD102; color:#3C4DA0; background-color:#BDD102" data-toggle="tooltip" title="Click here to Increment your bid by One Rupee" onclick="submitbutton<%out.print(tlb.getLotnum());%>();" class="reg" style="white-space:nowrap">Increment by 1</button></td></tr>
		<script>
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip();   
		}); 
		</script>
		<% 
			String quantityneededs=tlb.getQuantityneeded();
			int quantityneeded=Integer.parseInt(quantityneededs); 
			String quantityassigneds=mfcb.getQuantityassigned();
			int quantityassigned=Integer.parseInt(quantityassigneds);
		%>
		<input type="hidden" name="lotnum" id="mybid<%out.print(tlb.getLotnum());%>" value="<%out.print(mfcb.getPrice());%>"/>
		<input type="hidden" name="lotnum" id="lotnumber<%out.print(tlb.getLotnum());%>" value="<%out.print(tlb.getLotnum());%>"/>
		<input type="hidden" name="quantityassigned" value="<%=quantityassigned %>" id="<%=tlb.getLotnum()%>"/>
		<input type="hidden" name="quantityneeded" value="<%=quantityneeded %>" id="quantityneeded<%=tlb.getLotnum()%>"/>
		<script>
		var quantityneededs=document.getElementById("needed<%=tlb.getLotnum()%>").value;
		var quantityneeded=new  Number(quantityneededs);		
		var quantityassigneds=document.getElementById("demo7<%=tlb.getLotnum()%>").value;
		var quantityassigned=new  Number(quantityassigneds);
		console.log("quantityassigned"+quantityassigned+" quantityneeded"+quantityneeded+" ");
		console.log("quantityneeded<quantityassigned");
		console.log(quantityneeded<quantityassigned);
		console.log("quantityneeded>0"+quantityneeded>0);
		if(quantityassigned==0)
		{
			console.log("quantityneeded==0");
			document.getElementById("demo7<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 65px red inset";
		}	
		
		else if(quantityneeded-quantityassigned==0)
		{
			document.getElementById("demo7<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 65px green inset";
			console.log("quantityneeded-quantityassigned==0");
		}
		else if(quantityassigned<quantityneeded&&quantityassigned>0)
		{
			console.log("quantityneeded<quantityassigned");
			document.getElementById("demo7<%=tlb.getLotnum()%>").style["boxShadow"]="0 0 65px #FFA500 inset";
		}		
		var input = document.getElementById("demo6<%out.print(tlb.getLotnum());%>").value;
		var bid=new  Number(document.getElementById("demo6<%= tlb.getLotnum() %>").value);
		bid=bid+1;
		
		function submitbutton<%out.print(tlb.getLotnum());%>()
		{	
		 var Etime=document.getElementById("time").value;
		 var Btime="10:30:00";
		 var Btime1="10:35:00";
	   	 start = Etime.split(":");
		 end =Btime.split(":");
		 var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
		 var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
		 diff = endDate.getTime() - startDate.getTime();
		console.log("***********INCREMENT**********");
		var hours = Math.floor(diff / 1000 / 60 / 60);
		//diff -= hours* 60 * 60;
		var seconds= Math.floor(diff /1000);
		var minutes = Math.floor(diff / 1000 / 60);
		var res3=0;	
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

	var timedifference=+hours+":"+minutes+":"+seconds;
	//console.log("time difference is "+timedifference);
	/*if(!timedifference.includes("-"))
	{
		swal('YOU CANNOT BID BEFORE AUCTION STARTS');
	}*/
	//else
	/*if((document.getElementById('POSTAUCTION').value).includes('end'))
	{																			THIS IS THE MOST RECENT WORKING CODE
			swal("YOU CANT BID AFTER AUCTION IS OVER");
	}
	else*/
	var msg=document.getElementById("timer").textContent;
	var msg1=document.getElementById("auction1").textContent;
	console.log(msg);
	console.log(msg1);
	if(!(msg.includes('begun')))
	{
	//	if(!(msg.includes('begun'))&&(msg1.includes("end")))
		{
			swal("You can bid only during auction time");
		}
		//else
		//	window.location='logout.do';
	}
	else if(msg1!=null &&msg1.includes("end"))
		{
				swal("You can bid only during auction time");
		}
	else
	{
		//console.log(document.getElementById('POSTAUCTION').value);
    var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
    
    var j= document.getElementById("lotnumber<%out.print(tlb.getLotnum());%>").value;
    var currentbid=document.getElementById("demo6<%=tlb.getLotnum()%>").value;
	var currentbids=new Number(currentbid);
	console.log("****************current bid*************** "+currentbid);
	var bestbids=document.getElementById("demo5<%=tlb.getLotnum()%>").value;
	var bestbid=new Number(bestbids);
	console.log("best bid is"+bestbid);
	var result=currentbids+1;
    var assigneds=document.getElementById("demo7<%=tlb.getLotnum()%>").value;
	var assigned=new  Number(assigneds);
	var neededs=document.getElementById("needed<%=tlb.getLotnum() %>").value;
	var needed=new  Number(neededs);
	console.log("volume assigned is "+assigned+"");
	console.log("volume needed is "+needed+"");
	if(assigned-needed==0)
	{
		console.log("assigned=needed");
		//document.getElementById('submitbutton<%=tlb.getLotnum()%>').removeAttribute("href");
		swal("You cannot bid when lot needed has been assigned to you")
	}
	else if(currentbid-bestbid==0&&(currentbid!=0||bestbid!=0)&&assigned==needed)
	{
			console.log("currentbid-bestbid==0&&(currentbid!=0||bestbid!=0)&&assigned!=needed");
			swal("You cannot increase bid when your bid is equal to best bid ");
	}
	else
	{
			console.log("assigned!=needed");
			xmlhttp = new XMLHttpRequest();
		  	xmlhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) 
		    {
		    	 var string=xmlhttp.responseText;
		    	 console.log("***strng is "+string);
		    	 if(string.includes("block"))
		    	 {
		    		   swal('Your final cost has exceeded the amount blocked for trade. You will be redirected to the Hold fund page to block sufficient funds ');
		  	  	       //window.location='TraderBlock.do';
		    	}
		    	else
		    	{	
		         var startlotnum=xmlhttp.responseText.indexOf('lotnumber');
		         var endlotnum=xmlhttp.responseText.lastIndexOf('lotnumber');
		         startlotnum=startlotnum+9;
		         
		         var startlotcost=xmlhttp.responseText.indexOf('lotcost');
		         var endlotcost=xmlhttp.responseText.lastIndexOf('lotcost');
		         startlotcost=startlotcost+7;
		         
		         var startcommission=xmlhttp.responseText.indexOf('commission');
		         var endcommission=xmlhttp.responseText.lastIndexOf('commission');
		         startcommission=startcommission+10;
		         
		         var startmarket=xmlhttp.responseText.indexOf('market');
		         var endmarket=xmlhttp.responseText.lastIndexOf('market');
		         startmarket=startmarket+6;
		         
		         var startbestbid=xmlhttp.responseText.indexOf('bestbid');
		         var endbestbid=xmlhttp.responseText.lastIndexOf('bestbid');
		         startbestbid=startbestbid+7;
		         
		         var startmybid=xmlhttp.responseText.indexOf('mybid');
		         var endmybid=xmlhttp.responseText.lastIndexOf('mybid');
		         startmybid=startmybid+5;
		         
		         var startassigned=xmlhttp.responseText.indexOf('assigned');
		         var endassigned=xmlhttp.responseText.lastIndexOf('assigned');
		         startassigned=startassigned+8;
		         
		         var startfinal=xmlhttp.responseText.indexOf('final');
		         var endfinal=xmlhttp.responseText.lastIndexOf('final');
		         startfinal=startfinal+5;

		         document.getElementById("demo1<%= tlb.getLotnum() %>").innerHTML = string.substring(startlotnum,endlotnum);
		         var assigned=string.substring(startassigned,endassigned);
		         if(assigned=="0")
		         {
		        	 console.log("assigned =0");
		        	 var symbol="-";
		        	 var number=0;
		        	 var assigned=string.substring(startassigned,endassigned);
		        	 var bestbid=string.substring(startbestbid,endbestbid);
				     var mybid=string.substring(startmybid,endmybid);
				         
		        	 document.getElementById("demo2<%= tlb.getLotnum() %>").innerHTML = number;
			         document.getElementById("demo3<%= tlb.getLotnum() %>").innerHTML = number;
			         document.getElementById("demo4<%= tlb.getLotnum() %>").innerHTML = number;
			         document.getElementById("transportation<%= tlb.getLotnum() %>").innerHTML = number;
			         
			         document.getElementById("demo2<%= tlb.getLotnum() %>").value = number;
			         document.getElementById("demo3<%= tlb.getLotnum() %>").value = number;
			         document.getElementById("demo4<%= tlb.getLotnum() %>").value = number;
			         document.getElementById("transportation<%= tlb.getLotnum() %>").value = number;
			      
			         document.getElementById("demo5<%= tlb.getLotnum() %>").innerHTML =bestbid;
			         document.getElementById("demo5<%= tlb.getLotnum() %>").value =bestbid;
			         console.log(string.substring(startbestbid,endbestbid));
			         document.getElementById("demo6<%= tlb.getLotnum() %>").innerHTML = mybid;
			         document.getElementById("demo6<%= tlb.getLotnum() %>").value = mybid;
			         document.getElementById("demo7<%= tlb.getLotnum() %>").innerHTML = assigned;
			         document.getElementById("demo8<%= tlb.getLotnum() %>").innerHTML = number;
			         document.getElementById("demo7<%= tlb.getLotnum() %>").value = assigned;
			         document.getElementById("demo8<%= tlb.getLotnum() %>").value = number;
			         
			         document.getElementById("mybid<%= tlb.getLotnum() %>").innerHTML = mybid;
			         document.getElementById("mybid<%= tlb.getLotnum() %>").value = mybid;
			         
			         var bid=new  Number(string.substring(startmybid,endmybid));
			         bid=bid+1;
			         document.getElementById("demo6<%= tlb.getLotnum() %>").setAttribute("min",mybid);
			         console.log(" best bid is"+string.substring(startbestbid,endbestbid));
			         console.log("assigned ="+assigneds);
			         console.log("my bid is "+mybid);
			         console.log("needed is "+needed);
			         console.log("transportation= "+number);
			         }
		         else
		         {
		        	 var number=0;
		        	 var assigned=string.substring(startassigned,endassigned);
		        	 var bestbid=string.substring(startbestbid,endbestbid);
				     var mybid=string.substring(startmybid,endmybid);
				     var lotcost=string.substring(startlotcost,endlotcost);
				     var commission=string.substring(startcommission,endcommission);
				     var marketcess=string.substring(startmarket,endmarket);
				     var final=string.substring(startfinal,endfinal);
				     
				   //  console.log("assigned="+assigned+" bestbid "+bestbid+" ");
				     
			         document.getElementById("demo2<%= tlb.getLotnum() %>").innerHTML = lotcost;
			         document.getElementById("demo2<%= tlb.getLotnum() %>").value = lotcost;
			         
			         document.getElementById("demo3<%= tlb.getLotnum() %>").innerHTML = commission;
			         document.getElementById("demo3<%= tlb.getLotnum() %>").value = commission;
			         
			         document.getElementById("transportation<%= tlb.getLotnum() %>").innerHTML = 3000;
			         document.getElementById("transportation<%= tlb.getLotnum() %>").value = 3000;
				        
			         document.getElementById("demo4<%= tlb.getLotnum() %>").innerHTML = marketcess;
			         document.getElementById("demo4<%= tlb.getLotnum() %>").value = marketcess;
			         
		        	 document.getElementById("demo5<%= tlb.getLotnum() %>").innerHTML =bestbid;
		        	 document.getElementById("demo5<%= tlb.getLotnum() %>").value =bestbid;
		        	 
			         document.getElementById("demo6<%= tlb.getLotnum() %>").innerHTML = mybid;
			         document.getElementById("demo6<%= tlb.getLotnum() %>").value = mybid;
			         
			         document.getElementById("demo7<%= tlb.getLotnum() %>").innerHTML = assigned;
			         document.getElementById("demo7<%= tlb.getLotnum() %>").value =assigned;
			         
			         document.getElementById("demo8<%= tlb.getLotnum() %>").innerHTML =final;
			         document.getElementById("demo8<%= tlb.getLotnum() %>").value =final;
			         
			         document.getElementById("mybid<%= tlb.getLotnum() %>").innerHTML = mybid;
			         document.getElementById("mybid<%= tlb.getLotnum() %>").value = mybid;
			         
			         var bid=new  Number(string.substring(startmybid,endmybid));
			         bid=bid+1;
			         document.getElementById("demo6<%= tlb.getLotnum() %>").setAttribute("min",mybid);
			    //   console.log("input is "+input+"symbol is"+symbol+" best bid is"+string.substring(startbestbid,endbestbid));
			         console.log(" best bid is"+string.substring(startbestbid,endbestbid));
			         console.log("assigned ="+assigneds);
			         console.log("my bid is "+mybid);
			         console.log("needed is "+needed);
			         console.log("transportation= 3000");}}}};
		  xmlhttp.open("POST", "ajaxIncrement.do", true);
		  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xmlhttp.send("number="+result+"&lotnumber="+j);
	 }
	}
 }
	</script>
	<tr><td><br><button class="btn btn-primary" id="increment1" style="width:143px;border-color:#BDD102; color:#3C4DA0; background-color:#BDD102"  data-toggle="tooltip" data-placement="bottom"  title="Click here to submit your bid" onclick="fun<%out.print(tlb.getLotnum());%>();" class="sub">Submit</button></td></tr></tbody></table>
	</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" onclick="remove()" class="btn btn-danger lotbtn" id="remove" >Remove<br>lot</button> </td></tr></tbody></table>
	</td></tr>
	<% SimpleDateFormat sdf=new SimpleDateFormat("hh:mm:ss");%>
	<input type="hidden" id="time" value="<%=sdf.format(new Date())%>"/>	
	<script>
	function remove()
	{
		var quantityneededs=document.getElementById("needed<%=tlb.getLotnum()%>").value;
		var quantityneeded=new  Number(quantityneededs);		
		var quantityassigneds=document.getElementById("demo7<%=tlb.getLotnum()%>").value;
		var quantityassigned=new  Number(quantityassigneds);
		console.log("quantityassigneds"+quantityassigneds+" quantityneeded"+quantityneeded+" ");
		console.log(mybid==0);
		if(quantityassigned>0)
		{
			swal("Lot could be removed only when no lot has been assigned to you during auction")
		}
		else
			{
			swal(
		        	{
		        		  title:"",
			        	  text: "Do you want to remove the lot?",
			        	 /*  text: "You will not be able to recover this imaginary file!",
			        	  */ type: "warning",
			        	  showCancelButton: true,
			        	  confirmButtonColor: "green",
			        	  confirmButtonText: "Yes",
			        	  cancelButtonText: "No",
			        	  closeOnConfirm: false,
			        	  closeOnCancel: false
		        	},
		        	function(isConfirm)
		        	{
		        		  if(isConfirm)
		        		  {
		        			swal({text:"Removed lot Successfully",title:"",timer: 5000, type:"success"},function (){setTimeout(function(){ }, 3000);});		        			
		        			window.location.href="removelotnumber.do?lotnum=<%=tlb.getLotnum() %>";
						  }
		        		  else 
		        		  { 
		        			 // swal({text:"",title:"The lot has not been removed"});
		        			  window.location='TradeorAuction.do';
			        	 }
		            });		
			//window.location.href="removelotnumber.do?lotnum=<%=tlb.getLotnum() %>";
			}
	}
	
	function fun<%=tlb.getLotnum()%>()
	{
		var Etime=document.getElementById("time").value;
		console.log("**********************SUBMIT************************")
		var Btime="10:30:00";
		var Btime1="10:35:00";
		start = Etime.split(":");
		end =Btime.split(":");
		var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
		var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
		 diff = endDate.getTime() - startDate.getTime();
		var hours = Math.floor(diff / 1000 / 60 / 60);
		//diff -= hours* 60 * 60;
		var seconds= Math.floor(diff /1000);
		var minutes = Math.floor(diff / 1000 / 60);
		var res3=0;	
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
		var timedifference=+hours+":"+minutes+":"+seconds;
		//if((document.getElementById('POSTAUCTION').value).includes('end'))
		{
		//	swal("YOU CANT BID AFTER AUCTION IS OVER");
		}
		var msg=document.getElementById("timer").textContent;
		var msg1=document.getElementById("auction1").textContent;
		console.log(msg);
		console.log(msg1);
		if(!(msg.includes('begun')))
		{
		//	if(!(msg.includes('begun'))&&(msg1.includes("end")))
				swal("You can bid only during auction time");
			//else
			//	window.location='logout.do';
		}
		else if(msg1!=null &&msg1.includes("end"))
		{
					swal("You can bid only during auction time");
		}
		else
		{
		      var i= document.getElementById("mybid<%out.print(tlb.getLotnum());%>").value;
		      var k=document.getElementById("demo6<%out.print(tlb.getLotnum());%>").value;
		      console.log("old bid in front end is "+i+"new bid is "+demo6<%out.print(tlb.getLotnum());%>.value);
			  var j= document.getElementById("lotnumber<%out.print(tlb.getLotnum());%>").value;
			  if(k==""||document.getElementById("demo6<%out.print(tlb.getLotnum());%>").value==null)
			  { 
				  swal('YOU SHOULD ENTER YOUR NEW BID BEFORE SUBMITING');
			  }
		      else
			  {
				var assigneds=document.getElementById("demo7<%=tlb.getLotnum()%>").value;
				var assigned=new  Number(assigneds);
				var neededs=document.getElementById("quantityneeded<%=tlb.getLotnum()%>").value;
				var needed=new  Number(neededs);
				
				if(assigned-needed==0)
				{
					swal("You cannot bid when lot needed has been assigned to you")
					console.log("assigned=needed");
				}
				else
				{
				  var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
				  var currentbid=document.getElementById("mybid<%= tlb.getLotnum() %>").value;
				  var currentbids=new Number(currentbid);
				  var newbid=document.getElementById("demo6<%out.print(tlb.getLotnum());%>").value;
				  var newbids=new Number(newbid);
				  var assigneds=document.getElementById("demo7<%=tlb.getLotnum()%>").value;
				  var assigned=new  Number(assigneds);
				  var neededs=document.getElementById("needed<%=tlb.getLotnum() %>").value;
				  var needed=new  Number(neededs);
				  console.log("current is"+currentbids);
				//  console.log(" new bid is "+newbids);
				//  console.log("quantityneeded is "+needed);
				//  console.log("currentbids-bestbid!=0");
				//  console.log(currentbids-bestbid!=0);
				  console.log(currentbids);
				  console.log(newbids>999);
				  var bestbids=document.getElementById("demo5<%out.print(tlb.getLotnum());%>").value;
				  var bestbid=new Number(bestbids);
				  if(currentbids===newbids)
				  {
						  swal('YOU SHOULD INCREASE YOUR BID BY ATLEAST ONE RUPEE BEFORE SUBMITTING');
				  }
				  else if(newbids>999)
					  {
					  		swal("You cannot bid more than 999 Rs for any lot");
					  		document.getElementById("demo6<%out.print(tlb.getLotnum());%>").value='999'
					  }
				  else if(currentbids>newbids)
				  {	  
					  swal('You are allowed only to increment the bid.');
					  console.log(currentbids);
					  document.getElementById('demo6<%out.print(tlb.getLotnum());%>').value=currentbids;
				  }				  
				  else if(currentbids-bestbid==0 && currentbid!=0 &&(currentbid!=0||bestbid!=0)&&assigned==needed)
				  {
					  		swal('You cannot increase bid when your bid is equal to best bid');
				  }
				  else// if(!(currentbids-bestbid==0 && assigned==needed))
				  {
					  	console.log("inside else");
					  	xmlhttp = new XMLHttpRequest();
					  	xmlhttp.onreadystatechange = function() {
					    if (this.readyState == 4 && this.status == 200) 
					    {					     
					    	 var string=xmlhttp.responseText;		
					    	if(string.includes("block"))
					    	{
					    		   swal('Your final cost has exceeded the amount blocked for trade. You will be redirected to the Hold fund page to block sufficient funds ');
					  	  	      // window.location='TraderBlock.do';
					    	}
					    	else
					    	{	
					         var startlotnum=xmlhttp.responseText.indexOf('lotnumber');
					         var endlotnum=xmlhttp.responseText.lastIndexOf('lotnumber');
					         startlotnum=startlotnum+9;
					         
					         var startlotcost=xmlhttp.responseText.indexOf('lotcost');
					         var endlotcost=xmlhttp.responseText.lastIndexOf('lotcost');
					         startlotcost=startlotcost+7;
					         
					         var startcommission=xmlhttp.responseText.indexOf('commission');
					         var endcommission=xmlhttp.responseText.lastIndexOf('commission');
					         startcommission=startcommission+10;
					         
					         var startmarket=xmlhttp.responseText.indexOf('market');
					         var endmarket=xmlhttp.responseText.lastIndexOf('market');
					         startmarket=startmarket+6;
					         
					         var startbestbid=xmlhttp.responseText.indexOf('bestbid');
					         var endbestbid=xmlhttp.responseText.lastIndexOf('bestbid');
					         startbestbid=startbestbid+7;
					         
					         var startmybid=xmlhttp.responseText.indexOf('mybid');
					         var endmybid=xmlhttp.responseText.lastIndexOf('mybid');
					         startmybid=startmybid+5;
					         
					         var startassigned=xmlhttp.responseText.indexOf('assigned');
					         var endassigned=xmlhttp.responseText.lastIndexOf('assigned');
					         startassigned=startassigned+8;
					         
					         var startfinal=xmlhttp.responseText.indexOf('final');
					         var endfinal=xmlhttp.responseText.lastIndexOf('final');
					         startfinal=startfinal+5;
					         
					         document.getElementById("demo1<%= tlb.getLotnum() %>").innerHTML = string.substring(startlotnum,endlotnum);
					         var assigned=string.substring(startassigned,endassigned);
					         if(assigned=="0")
					         {
					        	 var bid=new  Number(string.substring(startmybid,endmybid));
						         bid=bid+1;
						         //input.setAttribute("min",bid);
						         
						         console.log("assigned =0");
					        	 var symbol="-";
					        	 var number=0;
					        	 var assigned=string.substring(startassigned,endassigned);
					        	 var bestbid=string.substring(startbestbid,endbestbid);
							     var mybid=string.substring(startmybid,endmybid);
							         
					        	 document.getElementById("demo2<%= tlb.getLotnum() %>").innerHTML = number;
						         document.getElementById("demo3<%= tlb.getLotnum() %>").innerHTML = number;
						         document.getElementById("demo4<%= tlb.getLotnum() %>").innerHTML = number;
						         document.getElementById("transportation<%= tlb.getLotnum() %>").innerHTML = number;
						         
						         document.getElementById("demo2<%= tlb.getLotnum() %>").value = number;
						         document.getElementById("demo3<%= tlb.getLotnum() %>").value = number;
						         document.getElementById("demo4<%= tlb.getLotnum() %>").value = number;
						         document.getElementById("transportation<%= tlb.getLotnum() %>").value = number;
						      
						         document.getElementById("demo5<%= tlb.getLotnum() %>").innerHTML =bestbid;
						         document.getElementById("demo5<%= tlb.getLotnum() %>").value =bestbid;
						         console.log(string.substring(startbestbid,endbestbid));
						         document.getElementById("demo6<%= tlb.getLotnum() %>").innerHTML = mybid;
						         document.getElementById("demo6<%= tlb.getLotnum() %>").value = mybid;
						         document.getElementById("demo7<%= tlb.getLotnum() %>").innerHTML = assigned;
						         document.getElementById("demo8<%= tlb.getLotnum() %>").innerHTML = number;
						         document.getElementById("demo7<%= tlb.getLotnum() %>").value = assigned;
						         document.getElementById("demo8<%= tlb.getLotnum() %>").value = number;
						         
						         document.getElementById("mybid<%= tlb.getLotnum() %>").innerHTML = mybid;
						         document.getElementById("mybid<%= tlb.getLotnum() %>").value = mybid;
						         
						         var bid=new  Number(string.substring(startmybid,endmybid));
						         bid=bid+1;
						         document.getElementById("demo6<%= tlb.getLotnum() %>").setAttribute("min",mybid);
						         console.log(" best bid is"+string.substring(startbestbid,endbestbid));
						         console.log("assigned ="+assigneds);
						         console.log("my bid is "+mybid);
						         console.log("needed is "+needed);  }
					         else
					         {
					        	 var number=0;
					        	 var assigned=string.substring(startassigned,endassigned);
					        	 var bestbid=string.substring(startbestbid,endbestbid);
							     var mybid=string.substring(startmybid,endmybid);
							     var lotcost=string.substring(startlotcost,endlotcost);
							     var commission=string.substring(startcommission,endcommission);
							     var marketcess=string.substring(startmarket,endmarket);
							     var final=string.substring(startfinal,endfinal);
							     
							   //  console.log("assigned="+assigned+" bestbid "+bestbid+" ");
							     
						         document.getElementById("demo2<%= tlb.getLotnum() %>").innerHTML = lotcost;
						         document.getElementById("demo2<%= tlb.getLotnum() %>").value = lotcost;
						         
						         document.getElementById("demo3<%= tlb.getLotnum() %>").innerHTML = commission;
						         document.getElementById("demo3<%= tlb.getLotnum() %>").value = commission;
						         
						         document.getElementById("transportation<%= tlb.getLotnum() %>").innerHTML = 3000;
						         document.getElementById("transportation<%= tlb.getLotnum() %>").value = 3000;
							        
						         document.getElementById("demo4<%= tlb.getLotnum() %>").innerHTML = marketcess;
						         document.getElementById("demo4<%= tlb.getLotnum() %>").value = marketcess;
						         
					        	 document.getElementById("demo5<%= tlb.getLotnum() %>").innerHTML =bestbid;
					        	 document.getElementById("demo5<%= tlb.getLotnum() %>").value =bestbid;
					        	 
						         document.getElementById("demo6<%= tlb.getLotnum() %>").innerHTML = mybid;
						         document.getElementById("demo6<%= tlb.getLotnum() %>").value = mybid;
						         
						         document.getElementById("demo7<%= tlb.getLotnum() %>").innerHTML = assigned;
						         document.getElementById("demo7<%= tlb.getLotnum() %>").value =assigned;
						         
						         document.getElementById("demo8<%= tlb.getLotnum() %>").innerHTML =final;
						         document.getElementById("demo8<%= tlb.getLotnum() %>").value =final;
						         
						         document.getElementById("mybid<%= tlb.getLotnum() %>").innerHTML = mybid;
						         document.getElementById("mybid<%= tlb.getLotnum() %>").value = mybid;
						         
						        
						    //   console.log("input is "+input+"symbol is"+symbol+" best bid is"+string.substring(startbestbid,endbestbid));
						         console.log(" best bid is"+string.substring(startbestbid,endbestbid));
						         console.log("assigned ="+assigneds);
						         console.log("best bid is "+bestbid);						         
						         console.log("needed is "+needed); var bid=new  Number(string.substring(startmybid,endmybid));
						         document.getElementById("demo6<%= tlb.getLotnum() %>").setAttribute("min",mybid);
					         }}}};
					        // console.log("before sending");
			  xmlhttp.open("POST", "ajaxIncrement.do", true);
			  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			  xmlhttp.send("number=" +k+"&lotnumber="+j);
	  }}}}
	/*else
		{	console.log(!timedifference.includes("-"));
			swal('YOU CANNOT BID BEFORE AUCTION STARTS');
		}*/}
	</script>
	</tbody></table></div>
	</div>
	</div>
    </div></div>
    <%}if(p==0) {}}}}}
			else//removed row
            {	
	 		  int j=0;
	  		  HttpSession remove=request.getSession(false);
			  List<TradeListBean> l=(List<TradeListBean>)remove.getAttribute("list");
			  if(l.size()==0){System.out.println("hey");%><br>
				<center><div id='div' style=' top: 100px; left: 140px;'><p ><b>No produce has been chosen by you for the auction. Please go to Product Search page to add a lot of the produce to participate in the auction.</b></p></div></center>
		<br>
		<%	}
		  	  for(Object m:l)		
		   	  {
		   		TradeListBean tlbr=(TradeListBean)m;
		   		System.out.println("inside tlbr->"+tlbr);
		   		if(tlbr.getSlotnumber()!=null && (tlbr.getSlotnumber().equals("slot1")||tlbr.getSlotnumber().equals("Slot1")))
				{
		   		  System.out.println("lotnum which belongs to slot1 "+tlbr.getLotnum());			   		
				  {
					HttpSession MyFinalCost=request.getSession(false);
					List ll=(List)MyFinalCost.getAttribute("MyFinalCost"); 
		   			for(Object mm:ll)
					{
						MyFinalCostBean mfcb=(MyFinalCostBean)mm;						
						System.out.println("MyFinalCostBeanlotnumber->"+mfcb.getLotnum());	
						if(mfcb.getLotnum().equals(tlbr.getLotnum()))
						{
			%>
      <!----row1--->
	<div class="one">
	<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
	<div class="table-responsive"> 
 <table>
	<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold"><%out.println(z);z++; %></td>
	<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="demo1<%=tlbr.getLotnum()%>" type="text" value="<%= tlbr.getLotnum() %>" readonly></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text" value="<%= tlbr.getProduce() %>"readonly ></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text" value="<%=tlbr.getQualitygrade() %>" readonly></td></tr>
	<tr><td><h4>Available Lot Size (kg) (kg)</h4></td><td><input class="form-control" id="usr" type="text" value="<%= tlbr.getQuantity()%>"readonly ></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;font-weight:bold">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Cost (Rs)</h4></td><td><input class="form-control" id="demo2<%=tlbr.getLotnum()%>" type="text" value="<%= mfcb.getLotcost() %>"style="text-align: right;" readonly></td></tr>
	<tr><td><h4>Commission Charges (Rs)</h4></td><td><input class="form-control" id="demo3<%=tlbr.getLotnum()%>" type="text" value="<%= mfcb.getCommission() %>" style="text-align: right;"readonly></td></tr>
	<tr><td><h4>Market Cess (Rs)</h4></td><td><input class="form-control" id="demo4<%=tlbr.getLotnum()%>"style="text-align: right;" type="text" value="<%= mfcb.getMarketcess()%>"readonly ></td></tr>
<tr><td><h4>Transportation Charges (Rs)</h4></td><td><input class="form-control" id="transportation<%=tlbr.getLotnum()%>" style="text-align: right;" type="text" value="<%if(mfcb.getLotcost().equals("0")) out.println("0"); else out.println("3000"); %>" readonly></td></tr>
	<tr><td><h4>My Final Cost (Rs)</h4></td><td><input class="form-control" id="demo8<%=tlbr.getLotnum()%>" style="text-align: right;"type="text" value="<%= mfcb.getMyfinalcost() %>"readonly></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table >
	<tbody>
	<tr><td><h4>Required Lot Size (kg)</h4></td><td><h4>Assigned Lot Size (kg)</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"  value="<%=tlbr.getQuantityneeded()%>" readonly></td>
	<td class="clspadt5"><input class="form-control clsheight" id="demo7<%=tlbr.getLotnum() %>"style="width:164px; height:30px;" type="text" value="<%=mfcb.getQuantityassigned()%>" readonly></td></tr>
	<tr><td><h4>Best Bid (Rs/kg)</h4></td><td><h4>My Bid(Rs/kg)</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="demo5<%=tlbr.getLotnum()%>" type="text" value="<%=mfcb.getBestbid()%>" readonly></td><td class="inp clspad10"><input class="form-control" id="demo6<%=tlbr.getLotnum()%>" max="999" maxlength="3" data-toggle="tooltip" title="Enter your bid here" data-placement=bottom  type="number" min="<%= mfcb.getPrice()%>" style="width:164px; height:30px;"value="<%= mfcb.getPrice()%>"></td></tr>
	</tbody>
	</table>
	<script>
		var bestbids=document.getElementById("demo5<%=tlbr.getLotnum()%>").value;
		var bestbid=new  Number(bestbids);		
		var mybids=document.getElementById("demo6<%=tlbr.getLotnum()%>").value;
		var mybid=new  Number(mybids);
		console.log("best bid is"+bestbid+" my bid is"+mybid+" ");
		console.log(mybid==0);
		if(mybid<bestbid&&mybid>0)
		{
				console.log(mybid<bestbid);
				document.getElementById("demo6<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px #FFA500 inset";
		}
		else if(mybid-bestbid==0||mybid>bestbid)
		{
			console.log(mybid-bestbid==0);
			document.getElementById("demo6<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px green inset";
			console.log("after if ");
		}
		else if(mybid==0)
		{
			console.log("mybid==0");
			document.getElementById("demo6<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px red inset";
			console.log("after if ");
		}		
		
		document.getElementById("demo6<%=tlbr.getLotnum()%>").addEventListener("keyup", function(event1){
            event1.preventDefault();
            if(event1.which == 13 || event1.keyCode == 13) 
            {
            	fun<%=tlbr.getLotnum()%>();
            }
            });
	</script>
	</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><button class="btn btn-primary" id="increment" style="width:143px;border-color:#BDD102; color:#3C4DA0; background-color:#BDD102" data-toggle="tooltip" title="Click here to Increment your bid by One Rupee" onclick="submitbutton<%out.print(tlbr.getLotnum());%>();" class="reg" style="white-space:nowrap">Increment by 1</button></td></tr>
	<% 
	String quantityneededs=tlbr.getQuantityneeded();
	int quantityneeded=Integer.parseInt(quantityneededs);
	String quantityassigneds=mfcb.getQuantityassigned();
	int quantityassigned=Integer.parseInt(quantityassigneds);%>
	<input type="hidden" name="lotnum" id="mybid<%out.print(tlbr.getLotnum());%>" value="<%out.print(mfcb.getPrice());%>"/>
	<input type="hidden" name="lotnum" id="lotnumber<%out.print(tlbr.getLotnum());%>" value="<%out.print(tlbr.getLotnum());%>"/>
	<input type="hidden" name="quantityassigned" value="<%=quantityassigned %>" id="<%=tlbr.getLotnum()%>"/>
	<input type="hidden" name="quantityneeded" value="<%=quantityneeded %>" id="needed<%=tlbr.getLotnum()%>"/>
	<script>
	var quantityneededs=document.getElementById("needed<%=tlbr.getLotnum()%>").value;
	var quantityneeded=new  Number(quantityneededs);		
	var quantityassigneds=document.getElementById("demo7<%=tlbr.getLotnum()%>").value;
	var quantityassigned=new  Number(quantityassigneds);
	console.log("quantityassigned"+quantityassigned+" quantityneeded"+quantityneeded+" ");
	console.log("quantityneeded<quantityassigned");
	console.log(quantityneeded<quantityassigned);
	console.log("quantityneeded>0"+quantityneeded>0);
	if(quantityassigned==0)
	{
		console.log("quantityneeded==0");
		document.getElementById("demo7<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px red inset";
	}	
	
	else if(quantityneeded-quantityassigned==0)
	{
		document.getElementById("demo7<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px green inset";
		console.log("quantityneeded-quantityassigned==0");
	}
	else if(quantityassigned<quantityneeded&&quantityassigned>0)
	{
		console.log("quantityneeded<quantityassigned");
			document.getElementById("demo7<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px #FFA500 inset";
	}	
	
	var bestbids=document.getElementById("demo5<%=tlbr.getLotnum()%>").value;
	var bestbid=new  Number(bestbids);		
	var mybids=document.getElementById("demo6<%=tlbr.getLotnum()%>").value;
	var mybid=new  Number(mybids);
	console.log("best bid is"+bestbid);
	console.log(" my bid is"+mybid+" ");
	console.log(mybid==0);
	if(mybid<bestbid&&mybid>0)
	{
			console.log("mybid<bestbid")
			document.getElementById("demo6<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 75px #FFA500 inset";
	}
	else if(mybid-bestbid==0||mybid>bestbid)
	{
		document.getElementById("demo6<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 75px green inset";
		console.log("mybid-bestbid==0");
	}
	else if(mybid==0)
	{
		document.getElementById("demo6<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px red inset";
		console.log("mybid==0");
	}	
	//***************************************************************************THIS IS FOR AUTOREFRESH**************************************************************************************
	window.setInterval(function()
			  {
				funny2();
			  },3000);
	
	function funny2()
		{		  
		var needed=document.getElementById("needed<%=tlbr.getLotnum() %>").value;
		 		    xmlhttp = new XMLHttpRequest();
				    xmlhttp.onreadystatechange = function() {
				    if (this.readyState == 4 && this.status == 200) 
				    {	
				    	 var string=xmlhttp.responseText;
				    	 var startlotnum=xmlhttp.responseText.indexOf('lotnum');
				         var endlotnum=xmlhttp.responseText.lastIndexOf('lotnum');
				         startlotnum=startlotnum+6;
				         
				         var startlotcost=xmlhttp.responseText.indexOf('lotcost');
				         var endlotcost=xmlhttp.responseText.lastIndexOf('lotcost');
				         startlotcost=startlotcost+7;
				         
				         var startcommission=xmlhttp.responseText.indexOf('commission');
				         var endcommission=xmlhttp.responseText.lastIndexOf('commission');
				         startcommission=startcommission+10;
				         
				         var startmarket=xmlhttp.responseText.indexOf('market');
				         var endmarket=xmlhttp.responseText.lastIndexOf('market');
				         startmarket=startmarket+6;
				         
				         var startbestbid=xmlhttp.responseText.indexOf('bestbid');
				         var endbestbid=xmlhttp.responseText.lastIndexOf('bestbid');
				         startbestbid=startbestbid+7;
				         
				         var startmybid=xmlhttp.responseText.indexOf('mybid');
				         var endmybid=xmlhttp.responseText.lastIndexOf('mybid');
				         startmybid=startmybid+5;
				         
				         var startassigned=xmlhttp.responseText.indexOf('assigned');
				         var endassigned=xmlhttp.responseText.lastIndexOf('assigned');
				         startassigned=startassigned+8;
				         
				         var startfinal=xmlhttp.responseText.indexOf('final');
				         var endfinal=xmlhttp.responseText.lastIndexOf('final');
				         startfinal=startfinal+5;

				         document.getElementById("demo1<%= tlbr.getLotnum() %>").innerHTML = string.substring(startlotnum,endlotnum);
				         var assigned=string.substring(startassigned,endassigned);
				         console.log("assigned is "+string.substring(startassigned,endassigned));
				         if(assigned=="0")
				         {					        	 
				        	 var symbol="-";
				        	 var number=0;
				        	 var assigned=string.substring(startassigned,endassigned);
				        	 var bestbid=string.substring(startbestbid,endbestbid);
						     var mybid=string.substring(startmybid,endmybid);
						         
				        	 document.getElementById("demo2<%=tlbr.getLotnum() %>").innerHTML = number;
					         document.getElementById("demo3<%=tlbr.getLotnum() %>").innerHTML = number;
					         document.getElementById("demo4<%=tlbr.getLotnum() %>").innerHTML = number;
					         document.getElementById("transportation<%=tlbr.getLotnum() %>").innerHTML = number;
					         
					         document.getElementById("demo2<%=tlbr.getLotnum() %>").value = number;
					         document.getElementById("demo3<%=tlbr.getLotnum() %>").value = number;
					         document.getElementById("demo4<%=tlbr.getLotnum() %>").value = number;
					         document.getElementById("transportation<%=tlbr.getLotnum() %>").value = number;
					      
					         document.getElementById("demo5<%=tlbr.getLotnum() %>").innerHTML =bestbid;
					         document.getElementById("demo5<%=tlbr.getLotnum() %>").value =bestbid;
					         console.log(string.substring(startbestbid,endbestbid));
					 //        document.getElementById("demo6<%=tlbr.getLotnum() %>").innerHTML = mybid;
					  //       document.getElementById("demo6<%=tlbr.getLotnum() %>").value = mybid;

					         document.getElementById("demo7<%=tlbr.getLotnum() %>").innerHTML = assigned;
					         document.getElementById("demo8<%=tlbr.getLotnum() %>").innerHTML = number;
					         document.getElementById("demo7<%=tlbr.getLotnum() %>").value = assigned;
					         document.getElementById("demo8<%=tlbr.getLotnum() %>").value = number;
					         
					      //   document.getElementById("mybid<%=tlbr.getLotnum() %>").innerHTML = mybid;
					      //   document.getElementById("mybid<%=tlbr.getLotnum() %>").value = mybid;

					         var bid=new  Number(string.substring(startmybid,endmybid));
					         bid=bid+1;
					         document.getElementById("demo6<%= tlbr.getLotnum() %>").setAttribute("min",mybid);
					        
					         var quantityneededs=document.getElementById("needed<%=tlbr.getLotnum()%>").value;
					 		 var quantityneeded=new  Number(quantityneededs);	
					 		console.log(quantityneededs);
					 		 var assigneds=new Number(assigned);
					 		if(assigneds==0)
							{
								//console.log("quantityneeded==0");
								document.getElementById("demo7<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px red inset";
							}	
							
							else if(quantityneeded-assigneds==0)
							{
								document.getElementById("demo7<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px green inset";
							//	console.log("quantityneeded-quantityassigned==0");
							}
							else if(assigneds<quantityneeded&&assigneds>0)
							{
								//console.log("quantityneeded="+quantityneeded+"quantityassigned"+assigneds);
									document.getElementById("demo7<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px #FFA500 inset";
							}
					 		
					 		var bestbids=document.getElementById("demo5<%=tlbr.getLotnum()%>").value;
							var bestbid=new  Number(bestbids);		
							var mybids=document.getElementById("demo6<%=tlbr.getLotnum()%>").value;
							var mybid=new  Number(mybids);
						//	console.log("best bid is"+bestbid+" my bid is"+mybid+" ");
							console.log(mybid==0);
							if(mybid<bestbid&&mybid>0)
							{
							//	console.log("mybid<bestbid")
									document.getElementById("demo6<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 75px #FFA500 inset";
							}
							else if(mybid-bestbid==0||mybid>bestbid)
							{
								document.getElementById("demo6<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 75px green inset";
								//console.log("mybid-bestbid==0");
							}
							else if(mybid==0)
							{
								document.getElementById("demo6<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px red inset";
								//console.log("mybid==0");
							}	
							 console.log(" best bid is"+string.substring(startbestbid,endbestbid));
					         //console.log("assigned =0");
					         console.log("my bid is "+mybid);
					         console.log("needed is "+needed);
				         }
				         else
				         {
				        	 var number=0;
				        	 var assigned=string.substring(startassigned,endassigned);
				        	 var bestbid=string.substring(startbestbid,endbestbid);
						     var mybid=string.substring(startmybid,endmybid);
						     var lotcost=string.substring(startlotcost,endlotcost);
						     var commission=string.substring(startcommission,endcommission);
						     var marketcess=string.substring(startmarket,endmarket);
						     var final=string.substring(startfinal,endfinal);
						     
						   //  console.log("assigned="+assigned+" bestbid "+bestbid+" ");
						     
					         document.getElementById("demo2<%= tlbr.getLotnum() %>").innerHTML = lotcost;
					         document.getElementById("demo2<%= tlbr.getLotnum() %>").value = lotcost;
					         
					         document.getElementById("demo3<%= tlbr.getLotnum() %>").innerHTML = commission;
					         document.getElementById("demo3<%= tlbr.getLotnum() %>").value = commission;
					         
					         document.getElementById("transportation<%= tlbr.getLotnum() %>").innerHTML = 3000;
					         document.getElementById("transportation<%= tlbr.getLotnum() %>").value = 3000;
					         
					         document.getElementById("demo4<%= tlbr.getLotnum() %>").innerHTML = marketcess;
					         document.getElementById("demo4<%= tlbr.getLotnum() %>").value = marketcess;
					         
				        	 document.getElementById("demo5<%= tlbr.getLotnum() %>").innerHTML =bestbid;
				        	 document.getElementById("demo5<%= tlbr.getLotnum() %>").value =bestbid;

					    //     document.getElementById("demo6<%= tlbr.getLotnum() %>").innerHTML = mybid;

					     //    document.getElementById("demo6<%= tlbr.getLotnum() %>").value = mybid;
					         
					         document.getElementById("demo7<%= tlbr.getLotnum() %>").innerHTML = assigned;
					         document.getElementById("demo7<%= tlbr.getLotnum() %>").value =assigned;
					         
					         document.getElementById("demo8<%= tlbr.getLotnum() %>").innerHTML =final;
					         document.getElementById("demo8<%= tlbr.getLotnum() %>").value =final;

					   //      document.getElementById("mybid<%= tlbr.getLotnum() %>").innerHTML = mybid;
					    //     document.getElementById("mybid<%= tlbr.getLotnum() %>").value = mybid;

					         
					         var bid=new  Number(string.substring(startmybid,endmybid));
					         bid=bid+1;
					         document.getElementById("demo6<%= tlbr.getLotnum() %>").setAttribute("min",mybid);
					    //   console.log("input is "+input+"symbol is"+symbol+" best bid is"+string.substring(startbestbid,endbestbid));
					       /*  console.log("lotcost "+string.substring(startlotcost,endlotcost));
					         console.log("commssion "+string.substring(startcommission,endcommission));
					         console.log("marketcess "+string.substring(startmarket,endmarket));
					         console.log("my bid "+string.substring(startmybid,endmybid));
					         console.log("bestbid "+string.substring(startbestbid,endbestbid));
					         console.log("assigned "+string.substring(startassigned,endassigned));
					         console.log("final "+string.substring(startfinal,endfinal));
					         console.log("quantityassigned "+assigned);*/
				        
					         var quantityneededs=document.getElementById("needed<%=tlbr.getLotnum()%>").value;
					 		 var quantityneeded=new  Number(quantityneededs);	
				         
					 		 var assigneds=new Number(assigned);
					 		if(assigneds==0)
							{
								//console.log("quantityneeded==0");
								document.getElementById("demo7<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px red inset";
							}	
							
							else if(quantityneeded-assigneds==0)
							{
								document.getElementById("demo7<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px green inset";
								//console.log("quantityneeded-quantityassigned==0");
							}
							else if(assigneds<quantityneeded&&assigneds>0)
							{
							//	console.log("quantityneeded<quantityassigned");
									document.getElementById("demo7<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px #FFA500 inset";
							}
					 		
					 		var bestbids=document.getElementById("demo5<%=tlbr.getLotnum()%>").value;
							var bestbid=new  Number(bestbids);		
							var mybids=document.getElementById("demo6<%=tlbr.getLotnum()%>").value;
							var mybid=new  Number(mybids);
						//	console.log("best bid is"+bestbid+" my bid is"+mybid+" ");
							console.log(mybid==0);
							if(mybid<bestbid&&mybid>0)
							{
								//console.log("mybid<bestbid")
									document.getElementById("demo6<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 75px #FFA500 inset";
							}
							else if(mybid-bestbid==0||mybid>bestbid)
							{
								document.getElementById("demo6<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 75px green inset";
							//	console.log("mybid-bestbid==0");
							}
							else if(mybid==0)
							{
								document.getElementById("demo6<%=tlbr.getLotnum()%>").style["boxShadow"]="0 0 65px red inset";
								//console.log("mybid==0");
							}
							 console.log(" best bid is"+string.substring(startbestbid,endbestbid));
					        // console.log("assigned ="+assigneds);
					         console.log("my bid is "+mybid);
					         console.log("needed is "+needed);
				         }
				    }};
				    xmlhttp.open("POST", "refresh.do", true);
					xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded"); 
					xmlhttp.send("number="+1+"&lotnumber="+1);
		}
	
	var input = document.getElementById("demo6<%out.print(tlbr.getLotnum());%>").value;
	var bid=new  Number(document.getElementById("demo6<%= tlbr.getLotnum() %>").value);
	bid=bid+1;
	function submitbutton<%out.print(tlbr.getLotnum());%>()
	{
	 var Etime=document.getElementById("time").value;
	 var Btime="10:30:00";
	 var Btime1="10:35:00";
   	 start = Etime.split(":");
	 end =Btime.split(":");
	 var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
	 var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
	 diff = endDate.getTime() - startDate.getTime();
	console.log("current time is "+Etime);
	var hours = Math.floor(diff / 1000 / 60 / 60);
	//diff -= hours* 60 * 60;
	var seconds= Math.floor(diff /1000);
	var minutes = Math.floor(diff / 1000 / 60);
	var res3=0;	
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

	var timedifference=+hours+":"+minutes+":"+seconds;
	console.log("time difference is "+timedifference);
	/*if(!timedifference.includes("-"))
	{
		swal('YOU CANNOT BID BEFORE AUCTION STARTS');
	}*/
	//else
		var msg=document.getElementById("timer").textContent;
	var msg1=document.getElementById("auction1").textContent;
	console.log(msg);
	console.log(msg1);
	if(!(msg.includes('begun')))
	{
	//	if(!(msg.includes('begun'))&&(msg1.includes("end")))
		{
			swal("You can bid only during auction time");
		}
		//else
		//	window.location='logout.do';
	}
	else if(msg1!=null &&msg1.includes("end"))
		{
				swal("You can bid only during auction time");
		}
	else
	{
    var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
    var j= document.getElementById("lotnumber<%out.print(tlbr.getLotnum());%>").value;
    var currentbid=document.getElementById("mybid<%=tlbr.getLotnum()%>").value;
	var currentbids=new Number(currentbid);
	console.log("current bid is "+currentbids);
	var result=currentbids+1;
    var assigneds=document.getElementById("<%=tlbr.getLotnum()%>").value;
	var assigned=new  Number(assigneds);
	var neededs=document.getElementById("needed<%=tlbr.getLotnum()%>").value;
	var needed=new  Number(neededs);
	console.log("volume assigned is "+assigned+"");
	console.log("volume needed is "+needed+"");
	if(assigned-needed==0)
	{
		swal("You cannot bid when lot needed has been assigned to you")
		console.log("assigned=needed");
		document.getElementById('submit1<%=tlbr.getLotnum()%>').removeAttribute("href");
	}
	var bestbids=document.getElementById("demo5<%out.print(tlbr.getLotnum());%>").value;
	var bestbid=new Number(bestbids);
	if(currentbids-bestbid==0 && currentbids!=0 &&(currentbid!=0||bestbid!=0)&&assigned==needed)
		  {
				console.log("currentbids-bestbid==0");
		  		swal('YOU CANNOT INCREASE YOUR BID WHEN YOUR BID IS THE BEST BID');
		  }
	else if(currentbids-bestbid!=0 &&assigned!=needed)
	{
		console.log("assigned!=needed");
		 xmlhttp = new XMLHttpRequest();
		  xmlhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) 
		    {
		    	 var string=xmlhttp.responseText;
		    	 if(string.includes("block"))
		    		{
		    		   swal('Your final cost has exceeded the amount blocked for trade. You will be redirected to the Hold fund page to block sufficient funds ');
		  	  	       window.location='TraderBlock.do';
		    		}
		    	else
		    	{	
		         var startlotnum=xmlhttp.responseText.indexOf('lotnumber');
		         var endlotnum=xmlhttp.responseText.lastIndexOf('lotnumber');
		         startlotnum=startlotnum+9;
		         
		         var startlotcost=xmlhttp.responseText.indexOf('lotcost');
		         var endlotcost=xmlhttp.responseText.lastIndexOf('lotcost');
		         startlotcost=startlotcost+7;
		         
		         var startcommission=xmlhttp.responseText.indexOf('commission');
		         var endcommission=xmlhttp.responseText.lastIndexOf('commission');
		         startcommission=startcommission+10;
		         
		         var startmarket=xmlhttp.responseText.indexOf('market');
		         var endmarket=xmlhttp.responseText.lastIndexOf('market');
		         startmarket=startmarket+6;
		         
		         var startbestbid=xmlhttp.responseText.indexOf('bestbid');
		         var endbestbid=xmlhttp.responseText.lastIndexOf('bestbid');
		         startbestbid=startbestbid+7;
		         
		         var startmybid=xmlhttp.responseText.indexOf('mybid');
		         var endmybid=xmlhttp.responseText.lastIndexOf('mybid');
		         startmybid=startmybid+5;
		         
		         var startassigned=xmlhttp.responseText.indexOf('assigned');
		         var endassigned=xmlhttp.responseText.lastIndexOf('assigned');
		         startassigned=startassigned+8;
		         
		         var startfinal=xmlhttp.responseText.indexOf('final');
		         var endfinal=xmlhttp.responseText.lastIndexOf('final');
		         startfinal=startfinal+5;

		         document.getElementById("demo1<%= tlbr.getLotnum() %>").innerHTML = string.substring(startlotnum,endlotnum);
		         var assigned=string.substring(startassigned,endassigned);
		         if(assigned=="0")
		         {
		        	 console.log("assigned =0");
		        	 var symbol="-";
		        	 var number=0;
		        	 var assigned=string.substring(startassigned,endassigned);
		        	 var bestbid=string.substring(startbestbid,endbestbid);
				     var mybid=string.substring(startmybid,endmybid);
				         
		        	 document.getElementById("demo2<%= tlbr.getLotnum() %>").innerHTML = number;
			         document.getElementById("demo3<%= tlbr.getLotnum() %>").innerHTML = number;
			         document.getElementById("demo4<%= tlbr.getLotnum() %>").innerHTML = number;
			         document.getElementById("transportation<%= tlbr.getLotnum() %>").innerHTML = number;
			         
			         document.getElementById("demo2<%= tlbr.getLotnum() %>").value = number;
			         document.getElementById("demo3<%= tlbr.getLotnum() %>").value = number;
			         document.getElementById("demo4<%= tlbr.getLotnum() %>").value = number;
			         document.getElementById("transportation<%= tlbr.getLotnum() %>").value = number;
			      
			         document.getElementById("demo5<%= tlbr.getLotnum() %>").innerHTML =bestbid;
			         document.getElementById("demo5<%= tlbr.getLotnum() %>").value =bestbid;
			         console.log(string.substring(startbestbid,endbestbid));
			         document.getElementById("demo6<%= tlbr.getLotnum() %>").innerHTML = mybid;
			         document.getElementById("demo6<%= tlbr.getLotnum() %>").value = mybid;
			         document.getElementById("demo7<%= tlbr.getLotnum() %>").innerHTML = assigned;
			         document.getElementById("demo8<%= tlbr.getLotnum() %>").innerHTML = number;
			         document.getElementById("demo7<%= tlbr.getLotnum() %>").value = assigned;
			         document.getElementById("demo8<%= tlbr.getLotnum() %>").value = number;
			         
			         document.getElementById("mybid<%= tlbr.getLotnum() %>").innerHTML = mybid;
			         document.getElementById("mybid<%= tlbr.getLotnum() %>").value = mybid;
			         
			         var bid=new  Number(string.substring(startmybid,endmybid));
			         bid=bid+1;
			         document.getElementById("demo6<%= tlbr.getLotnum() %>").setAttribute("min",mybid);
			         console.log("input is "+input+"symbol is"+symbol+" best bid is"+string.substring(startbestbid,endbestbid));
			     }
		         else
		         {
		        	 var number=0;
		        	 var assigned=string.substring(startassigned,endassigned);
		        	 var bestbid=string.substring(startbestbid,endbestbid);
				     var mybid=string.substring(startmybid,endmybid);
				     var lotcost=string.substring(startlotcost,endlotcost);
				     var commission=string.substring(startcommission,endcommission);
				     var marketcess=string.substring(startmarket,endmarket);
				     var final=string.substring(startfinal,endfinal);
				     
				   //  console.log("assigned="+assigned+" bestbid "+bestbid+" ");
				     
			         document.getElementById("demo2<%= tlbr.getLotnum() %>").innerHTML = lotcost;
			         document.getElementById("demo2<%= tlbr.getLotnum() %>").value = lotcost;
			         
			         document.getElementById("demo3<%= tlbr.getLotnum() %>").innerHTML = commission;
			         document.getElementById("demo3<%= tlbr.getLotnum() %>").value = commission;
			         
			         document.getElementById("transportation<%= tlbr.getLotnum() %>").innerHTML = 3000;
			         document.getElementById("transportation<%= tlbr.getLotnum() %>").value = 3000;
			         
			         document.getElementById("demo4<%= tlbr.getLotnum() %>").innerHTML = marketcess;
			         document.getElementById("demo4<%= tlbr.getLotnum() %>").value = marketcess;
			         
		        	 document.getElementById("demo5<%= tlbr.getLotnum() %>").innerHTML =bestbid;
		        	 document.getElementById("demo5<%= tlbr.getLotnum() %>").value =bestbid;
		        	 
			         document.getElementById("demo6<%= tlbr.getLotnum() %>").innerHTML = mybid;
			        document.getElementById("demo6<%= tlbr.getLotnum() %>").value = mybid;
			         
			         document.getElementById("demo7<%= tlbr.getLotnum() %>").innerHTML = assigned;
			         document.getElementById("demo7<%= tlbr.getLotnum() %>").value =assigned;
			         
			         document.getElementById("demo8<%= tlbr.getLotnum() %>").innerHTML =final;
			         document.getElementById("demo8<%= tlbr.getLotnum() %>").value =final;
			         
			         document.getElementById("mybid<%= tlbr.getLotnum() %>").innerHTML = mybid;
			         document.getElementById("mybid<%= tlbr.getLotnum() %>").value = mybid;
			         
			         var bid=new  Number(string.substring(startmybid,endmybid));
			         bid=bid+1;
			         document.getElementById("demo6<%= tlbr.getLotnum() %>").setAttribute("min",mybid);
			    //   console.log("input is "+input+"symbol is"+symbol+" best bid is"+string.substring(startbestbid,endbestbid));
			         console.log("lotcost"+string.substring(startlotcost,endlotcost)+"commssion"+string.substring(startcommission,endcommission)+"marketcess"+string.substring(startmarket,endmarket)+"my bid"+string.substring(startmybid,endmybid)+"bestbid"+string.substring(startbestbid,endbestbid)+"assigned"+string.substring(startassigned,endassigned)+"final "+string.substring(startfinal,endfinal));
		         }}}};
		  var bid1=new  Number(document.getElementById("demo6<%= tlbr.getLotnum() %>").value);
		  console.log("current bid is "+bid1);
		  bid1=bid1+1;
		  xmlhttp.open("POST", "ajaxIncrement.do", true);
		  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xmlhttp.send("number="+result+"&lotnumber="+j);
	 }
	}
	}
 
	</script>
	<tr><td><br><button class="btn btn-primary" id="increment" style="width:143px;border-color:#BDD102; color:#3C4DA0; background-color:#BDD102"  data-toggle="tooltip" data-placement="bottom"  title="Click here to submit your bid" onclick="fun<%out.print(tlbr.getLotnum());%>();" class="sub">Submit</button></td></tr></tbody></table>
	</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" onclick="remove()" id="remove" class="btn btn-danger lotbtn" >Remove<br>lot</button> </td></tr></tbody></table>
	</td></tr>
	<% SimpleDateFormat sdf=new SimpleDateFormat("hh:mm:ss");%>
	<input type="hidden" id="time" value="<%=sdf.format(new Date())%>"/>	
	<script>
	function remove()
	{
		var quantityneededs=document.getElementById("needed<%=tlbr.getLotnum()%>").value;
		var quantityneeded=new  Number(quantityneededs);		
		var quantityassigneds=document.getElementById("demo7<%=tlbr.getLotnum()%>").value;
		var quantityassigned=new  Number(quantityassigneds);
		console.log("quantityassigneds"+quantityassigneds+" quantityneeded"+quantityneeded+" ");
		console.log(mybid==0);
		if(quantityassigned>0)
		{
			swal("YOU CANNOT REMOVE THE LOT WHEN IT HAS BEEN ASSIGNED TO YOU PARTIALLY OR COMPLETELY")
		}
		else
			window.location.href="removelotnumber.do?lotnum=<%=tlbr.getLotnum() %>";
	}
	function fun<%=tlbr.getLotnum()%>()
	{
	var Etime=document.getElementById("time").value;
	var Btime="10:30:00";
	var Btime1="10:35:00";
	start = Etime.split(":");
	end =Btime.split(":");
	var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
	var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
	 diff = endDate.getTime() - startDate.getTime();
	var hours = Math.floor(diff / 1000 / 60 / 60);
	//diff -= hours* 60 * 60;
	var seconds= Math.floor(diff /1000);
	var minutes = Math.floor(diff / 1000 / 60);
	var res3=0;	
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

	var timedifference=+hours+":"+minutes+":"+seconds;
	console.log("time difference isss "+timedifference);	
	//if(timedifference.includes("-"))
		var msg=document.getElementById("timer").textContent;
	var msg1=document.getElementById("auction1").textContent;
	console.log(msg);
	console.log(msg1);
	if(!(msg.includes('begun')))
	{
	//	if(!(msg.includes('begun'))&&(msg1.includes("end")))
		{
			swal("You can bid only during auction time");
		}
		//else
		//	window.location='logout.do';
	}
	else if(msg1!=null &&msg1.includes("end"))
		{
				swal("You can bid only during auction time");
		}
	else
	{
	      var i= document.getElementById("mybid<%out.print(tlbr.getLotnum());%>").value;
	      var k=document.getElementById("demo6<%out.print(tlbr.getLotnum());%>").value;
	      console.log("old bid in front end is "+i+"new bid is "+demo6<%out.print(tlbr.getLotnum());%>.value);
		  var j= document.getElementById("lotnumber<%out.print(tlbr.getLotnum());%>").value;
		  if(k==""||document.getElementById("demo6<%out.print(tlbr.getLotnum());%>").value==null)
		  { 
			  swal('YOU SHOULD ENTER YOUR NEW BID BEFORE SUBMITING');
		  }
	      else
		  {
			var assigneds=document.getElementById("<%=tlbr.getLotnum()%>").value;
			var assigned=new  Number(assigneds);
			var neededs=document.getElementById("needed<%=tlbr.getLotnum()%>").value;
			var needed=new  Number(neededs);
			
			if(assigned-needed==0)
			{
				swal("You cannot bid when lot needed has been assigned to you");
				console.log("assigned=needed");
			}
			else
			{
			  var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
			  var currentbid=document.getElementById("mybid<%= tlbr.getLotnum() %>").value;
			  var currentbids=new Number(currentbid);
			  var newbid=document.getElementById("demo6<%out.print(tlbr.getLotnum());%>").value;
			  var newbids=new Number(newbid);
			  console.log("current bid is"+currentbids+" new bid is "+newbids);
			  var bestbids=document.getElementById("demo5<%out.print(tlbr.getLotnum());%>").value;
				var bestbid=new Number(bestbids);
			  if(currentbids===newbids)
				  {
					  swal('YOU SHOULD INCREASE YOUR BID BY ATLEAST ONE RUPEE BEFORE SUBMITTING');
				  }
			  else if(currentbids>newbids)
			  {	  
				  swal('You are allowed only to increment the bid.');
				  document.getElementById('demo6<%out.print(tlbr.getLotnum());%>').value=currentbids;
			  }
			 
			  else if(currentbid-bestbid==0&&(currentbid!=0||bestbid!=0)&&assigned==needed)
					  {
					  		swal('YOU CANNOT INCREASE YOUR BID WHEN YOUR BID IS THE BEST BID');
					  }
			  else if(currentbids-bestbid!=0)
			  {
					  xmlhttp = new XMLHttpRequest();
					  xmlhttp.onreadystatechange = function() {
					    if (this.readyState == 4 && this.status == 200) 
					    {					     
					    	 var string=xmlhttp.responseText;			  
					    	if(string.includes("block"))
					    	{
					    		   swal('Your final cost has exceeded the amount blocked for trade. You will be redirected to the Hold fund page to block sufficient funds ');
					  	  	      // window.location='TraderBlock.do';
					    		}
					    	else
					    	{	
					         var startlotnum=xmlhttp.responseText.indexOf('lotnumber');
					         var endlotnum=xmlhttp.responseText.lastIndexOf('lotnumber');
					         startlotnum=startlotnum+9;
					         
					         var startlotcost=xmlhttp.responseText.indexOf('lotcost');
					         var endlotcost=xmlhttp.responseText.lastIndexOf('lotcost');
					         startlotcost=startlotcost+7;
					         
					         var startcommission=xmlhttp.responseText.indexOf('commission');
					         var endcommission=xmlhttp.responseText.lastIndexOf('commission');
					         startcommission=startcommission+10;
					         
					         var startmarket=xmlhttp.responseText.indexOf('market');
					         var endmarket=xmlhttp.responseText.lastIndexOf('market');
					         startmarket=startmarket+6;
					         
					         var startbestbid=xmlhttp.responseText.indexOf('bestbid');
					         var endbestbid=xmlhttp.responseText.lastIndexOf('bestbid');
					         startbestbid=startbestbid+7;
					         
					         var startmybid=xmlhttp.responseText.indexOf('mybid');
					         var endmybid=xmlhttp.responseText.lastIndexOf('mybid');
					         startmybid=startmybid+5;
					         
					         var startassigned=xmlhttp.responseText.indexOf('assigned');
					         var endassigned=xmlhttp.responseText.lastIndexOf('assigned');
					         startassigned=startassigned+8;
					         
					         var startfinal=xmlhttp.responseText.indexOf('final');
					         var endfinal=xmlhttp.responseText.lastIndexOf('final');
					         startfinal=startfinal+5;
					         
					         document.getElementById("demo1<%= tlbr.getLotnum() %>").innerHTML = string.substring(startlotnum,endlotnum);
					         var assigned=string.substring(startassigned,endassigned);
					         if(assigned=="0")
					         {
					        	 var bid=new  Number(string.substring(startmybid,endmybid));
						         bid=bid+1;
						         input.setAttribute("min",bid);
						         
						         console.log("assigned =0");
					        	 var symbol="-";
					        	 var number=0;
					        	 var assigned=string.substring(startassigned,endassigned);
					        	 var bestbid=string.substring(startbestbid,endbestbid);
							     var mybid=string.substring(startmybid,endmybid);
							         
					        	 document.getElementById("demo2<%= tlbr.getLotnum() %>").innerHTML = number;
						         document.getElementById("demo3<%= tlbr.getLotnum() %>").innerHTML = number;
						         document.getElementById("demo4<%= tlbr.getLotnum() %>").innerHTML = number;
						         document.getElementById("transportation<%= tlbr.getLotnum() %>").innerHTML = number;
						         
						         document.getElementById("demo2<%= tlbr.getLotnum() %>").value = number;
						         document.getElementById("demo3<%= tlbr.getLotnum() %>").value = number;
						         document.getElementById("demo4<%= tlbr.getLotnum() %>").value = number;
						         document.getElementById("transportation<%= tlbr.getLotnum() %>").value = number;
						      
						         document.getElementById("demo5<%= tlbr.getLotnum() %>").innerHTML =bestbid;
						         document.getElementById("demo5<%= tlbr.getLotnum() %>").value =bestbid;
						         console.log(string.substring(startbestbid,endbestbid));
						         document.getElementById("demo6<%= tlbr.getLotnum() %>").innerHTML = mybid;
						         document.getElementById("demo6<%= tlbr.getLotnum() %>").value = mybid;
						         document.getElementById("demo7<%= tlbr.getLotnum() %>").innerHTML = assigned;
						         document.getElementById("demo8<%= tlbr.getLotnum() %>").innerHTML = number;
						         document.getElementById("demo7<%= tlbr.getLotnum() %>").value = assigned;
						         document.getElementById("demo8<%= tlbr.getLotnum() %>").value = number;
						         
						         document.getElementById("mybid<%= tlbr.getLotnum() %>").innerHTML = mybid;
						         document.getElementById("mybid<%= tlbr.getLotnum() %>").value = mybid;
						         
						         var bid=new  Number(string.substring(startmybid,endmybid));
						         bid=bid+1;
						         document.getElementById("demo6<%= tlbr.getLotnum() %>").setAttribute("min",mybid);
						         console.log("input is "+input+"symbol is"+symbol+" best bid is"+string.substring(startbestbid,endbestbid));						   
						     }
					         else
					         {
					        	 var number=0;
					        	 var assigned=string.substring(startassigned,endassigned);
					        	 var bestbid=string.substring(startbestbid,endbestbid);
							     var mybid=string.substring(startmybid,endmybid);
							     var lotcost=string.substring(startlotcost,endlotcost);
							     var commission=string.substring(startcommission,endcommission);
							     var marketcess=string.substring(startmarket,endmarket);
							     var final=string.substring(startfinal,endfinal);
							     
							   //  console.log("assigned="+assigned+" bestbid "+bestbid+" ");
							     
						         document.getElementById("demo2<%= tlbr.getLotnum() %>").innerHTML = lotcost;
						         document.getElementById("demo2<%= tlbr.getLotnum() %>").value = lotcost;
						         
						         document.getElementById("demo3<%= tlbr.getLotnum() %>").innerHTML = commission;
						         document.getElementById("demo3<%= tlbr.getLotnum() %>").value = commission;
						         
						         document.getElementById("transportation<%= tlbr.getLotnum() %>").innerHTML = 3000;
						         document.getElementById("transportation<%= tlbr.getLotnum() %>").value = 3000;
						         
						         document.getElementById("demo4<%= tlbr.getLotnum() %>").innerHTML = marketcess;
						         document.getElementById("demo4<%= tlbr.getLotnum() %>").value = marketcess;
						         
					        	 document.getElementById("demo5<%= tlbr.getLotnum() %>").innerHTML =bestbid;
					        	 document.getElementById("demo5<%= tlbr.getLotnum() %>").value =bestbid;
					        	 
						         document.getElementById("demo6<%= tlbr.getLotnum() %>").innerHTML = mybid;
						         document.getElementById("demo6<%= tlbr.getLotnum() %>").value = mybid;
						         
						         document.getElementById("demo7<%= tlbr.getLotnum() %>").innerHTML = assigned;
						         document.getElementById("demo7<%= tlbr.getLotnum() %>").value =assigned;
						         
						         document.getElementById("demo8<%= tlbr.getLotnum() %>").innerHTML =final;
						         document.getElementById("demo8<%= tlbr.getLotnum() %>").value =final;
						         
						         document.getElementById("mybid<%= tlbr.getLotnum() %>").innerHTML = mybid;
						         document.getElementById("mybid<%= tlbr.getLotnum() %>").value = mybid;
						         
						        
						    //   console.log("input is "+input+"symbol is"+symbol+" best bid is"+string.substring(startbestbid,endbestbid));
						         console.log("lotcost"+string.substring(startlotcost,endlotcost)+"commssion"+string.substring(startcommission,endcommission)+"marketcess"+string.substring(startmarket,endmarket)+"my bid"+string.substring(startmybid,endmybid)+"bestbid"+string.substring(startbestbid,endbestbid)+"assigned"+string.substring(startassigned,endassigned)+"final "+string.substring(startfinal,endfinal));
					           var bid=new  Number(string.substring(startmybid,endmybid));
						         bid=bid+1;
						         document.getElementById("demo6<%= tlbr.getLotnum() %>").setAttribute("min",mybid);
					         }}}};
			//document.getElementById('number<%out.print(tlbr.getLotnum());%>').value="";
			  xmlhttp.open("POST", "ajaxIncrement.do", true);
			  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			  xmlhttp.send("number=" +k+"&lotnumber="+j);
	  }}}}
	/*else
		{	console.log(!timedifference.includes("-"));
			swal('YOU CANNOT BID BEFORE AUCTION STARTS');
		}*/}
	</script>
	</tbody></table></div>
	</div>
	</div>
    </div></div>
    <%}}}}}}}}}%>    
    </div>
    
    <div id="slot2" class="container-fluid slot"><h5 class="text-center"  data-toggle="collapse" data-target="#accord2"><span>Auction Slot-2</span> <span class="pull-right"><i  class="fa fa-chevron-down" aria-hidden="true"></i></span></h5></div>
  <div id="accord2" class="collapse">
    <div class="one">
	<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
	<div class="table-responsive"> 
  	<table>
	<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf; width:9%;text-align:center;font-weight:bold"><%out.println(1); %></td>
	<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
	<table align="center" >
	<tbody >
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control"  type="text" value="198BEAA0060" readonly></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text" value="Beans"readonly ></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text" value="A" readonly></td></tr>
	<tr><td><h4>Available Lot Size (kg)</h4></td><td><input class="form-control" id="usr" type="text" value="5000"readonly ></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf;  padding:5px;white-space:nowrap;font-weight:bold">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Cost (Rs)</h4></td><td><input class="form-control"  type="text" value="0" style="text-align: right;" readonly></td></tr>
	<tr><td><h4>Commission Charges (Rs)</h4></td><td><input class="form-control"  style="text-align: right;" type="text" value="0" readonly></td></tr>
	<tr><td><h4>Market Cess (Rs)</h4></td><td><input class="form-control"  type="text" style="text-align: right;" value="0"readonly ></td></tr>
	<tr><td><h4>Transportation Charges (Rs)</h4></td><td><input class="form-control" style="text-align: right;" type="text" value="0" readonly></td></tr>
	<tr><td><h4>My Final Cost (Rs)</h4></td><td><input class="form-control"  type="text"style="text-align: right;"  value="0"readonly></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table >
	<tbody>
	<tr><td><h4>Required Lot Size (kg)</h4></td><td><h4>Assigned Lot Size (kg)</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" type="text"   value="2000" style="width:144px" readonly></td>
	<td class="clspadt5"><input class="form-control clsheight" type="text" value="0" style="width:164px"readonly></td></tr>
	<tr><td><h4>Best Bid (Rs/kg)</h4></td><td><h4>My Bid(Rs/kg)</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" type="text" value="0" style="height:30px;" readonly></td><td class="inp clspad10"><input data-toggle="tooltip" title="Enter your bid here" data-placement=bottom class="form-control"  type="number"  max="999" maxlength="3" value="0" style="width:164px; height:30px;">
	</td>
	</tr>
	</tbody>
	</table><p style="font-size: 14px; position:absolute; left: 64%;"><b>Enter your bid here</b>
	</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><button class="btn btn-primary" id="increment" style="width:143px; text-align:enter; border-color:#BDD102; color:#3C4DA0; background-color:#BDD102" data-toggle="tooltip" title="Click here to Increment your bid by One Rupee" onclick="submitbutton<%%>();" class="reg" style="white-space:nowrap">Increment by 1</button></td></tr>
	<script>
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip();   
		});
	</script>
	<tr><td><br><button class="btn btn-primary" id="increment" style="width:143px;border-color:#BDD102; color:#3C4DA0; background-color:#BDD102"  data-toggle="tooltip" data-placement="bottom"  title="Click here to submit your bid" onclick="" class="sub">Submit</button></td></tr></tbody></table>
	</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" onclick="remove()" class="btn btn-danger lotbtn" id="remove" >Remove<br>lot</button> </td></tr></tbody></table>
	</td></tr>
	</tbody></table></div>
	</div>
	</div>
    </div></div>
    </div>
 <!-- in documents auctionslot2.txt has working slot2 -->    <!--********************************************THIS DUMMY SLOT-2******************************************     
        <div id="slot" class="container-fluid slot"><h5 class="text-center"  data-toggle="collapse" data-target="#accord2"><span>Auction Slot-3</span> <span class="pull-right"><i  class="fa fa-chevron-down" aria-hidden="true"></i></span></h5></div>
<!-- <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#accord">Simple collapsible</button> --
  <div id="accord2" class="collapse">
        <!----row1---
	 <div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
<table>
<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold">1</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text" value="876GARA0304"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" value="Garlic" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" value="A" type="text"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" value="5600" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;font-weight:bold">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Cost</h4></td><td><input class="form-control" id="usr" type="text" style="text-align: center;"value="0"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text" value="0"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text" value="0"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text" value="0"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text" value="0"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table >
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"  size="10" value="3000"></td><td  class="clspadt5"><input value="0" class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text" value="0" ></td><td value="0" class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><button class="btn btn-primary" id="increment" style="width:143px;border-color:#BDD102; color:#3C4DA0; background-color:#BDD102" data-toggle="tooltip" title="Click here to Increment your bid by One Rupee" onclick="submitbutton
();" class="reg" style="white-space:nowrap">Increment by 1</button></td></tr>
				 <tr><td><br><button class="btn btn-primary" id="increment" style="width:143px;border-color:#BDD102; color:#3C4DA0; background-color:#BDD102"  data-toggle="tooltip" data-placement="bottom"  title="Click here to submit your bid"  class="sub">Submit</button></td></tr></tbody></table>

</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" class="btn btn-danger lotbtn" id="remove">Remove<br>lot</button> </td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
    </div>    
<div id="slot" class="container-fluid slot"><h5 class="text-center"  data-toggle="collapse" data-target="#accord3"><span>Auction Slot-3</span> <span class="pull-right"><i  class="fa fa-chevron-down" aria-hidden="true"></i></span></h5></div>
<!-- <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#accord">Simple collapsible</button> --
  <div id="accord3" class="collapse">
	<!---row 4 end--->
	 
    <div id="slot3" class="container-fluid slot"><h5 class="text-center"  data-toggle="collapse" data-target="#accord3"><span>Auction Slot-3</span> <span class="pull-right"><i  class="fa fa-chevron-down" aria-hidden="true"></i></span></h5></div>
  <div id="accord3" class="collapse">
    <div class="one">
	<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
	<div class="table-responsive"> 
  	<table>
	<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf; width:9%;text-align:center;font-weight:bold"><%out.println(1); %></td>
	<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
	<table align="center" >
	<tbody >
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control"  type="text" value="198CARA0060" readonly></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text" value="Carrot"readonly ></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text" value="A" readonly></td></tr>
	<tr><td><h4>Available Lot Size (kg)</h4></td><td><input class="form-control" id="usr" type="text" value="5000"readonly ></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf;  padding:5px;white-space:nowrap;font-weight:bold">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Cost (Rs)</h4></td><td><input class="form-control"  type="text" value="0" style="text-align: right;" readonly></td></tr>
	<tr><td><h4>Commission Charges (Rs)</h4></td><td><input class="form-control"  style="text-align: right;" type="text" value="0" readonly></td></tr>
	<tr><td><h4>Market Cess (Rs)</h4></td><td><input class="form-control"  type="text" style="text-align: right;" value="0"readonly ></td></tr>
	<tr><td><h4>Transportation Charges (Rs)</h4></td><td><input class="form-control" style="text-align: right;" type="text" value="0" readonly></td></tr>
	<tr><td><h4>My Final Cost (Rs)</h4></td><td><input class="form-control"  type="text"style="text-align: right;"  value="0"readonly></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table >
	<tbody>
	<tr><td><h4>Required Lot Size (kg)</h4></td><td><h4>Assigned Lot Size (kg)</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" type="text"   value="2000" style="width:144px" readonly></td>
	<td class="clspadt5"><input class="form-control clsheight" type="text" value="0" style="width:164px"readonly></td></tr>
	<tr><td><h4>Best Bid (Rs/kg)</h4></td><td><h4>My Bid(Rs/kg)</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" type="text" value="0" style="height:30px;" readonly></td><td class="inp clspad10"><input data-toggle="tooltip" title="Enter your bid here" data-placement=bottom class="form-control"  type="number"  max="999" maxlength="3" value="0" style="width:164px; height:30px;">
	</td>
	</tr>
	</tbody>
	</table><p style="font-size: 14px; position:absolute; left: 64%;"><b>Enter your bid here</b>
	</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><button class="btn btn-primary" id="increment" style="width:143px; text-align:enter; border-color:#BDD102; color:#3C4DA0; background-color:#BDD102" data-toggle="tooltip" title="Click here to Increment your bid by One Rupee" onclick="submitbutton<%%>();" class="reg" style="white-space:nowrap">Increment by 1</button></td></tr>
	
	<tr><td><br><button class="btn btn-primary" id="increment" style="width:143px;border-color:#BDD102; color:#3C4DA0; background-color:#BDD102"  data-toggle="tooltip" data-placement="bottom"  title="Click here to submit your bid" onclick="" class="sub">Submit</button></td></tr></tbody></table>
	</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" onclick="remove()" class="btn btn-danger lotbtn" id="remove" >Remove<br>lot</button> </td></tr></tbody></table>
	</td></tr>
	</tbody></table></div>
	</div>
	</div>
    </div></div>
    </div>
    <script>
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip();   
		});
	</script>
 </div>
</div>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script>
var tt = $( window ).height();
$(".maindiv").height(parseInt(tt)-60);
</script>
</body>
</html>