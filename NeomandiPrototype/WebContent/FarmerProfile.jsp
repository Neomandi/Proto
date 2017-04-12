<%@page import="java.sql.SQLException"%>
<%@page import="com.neomandi.prototype.JDBCHelper,java.sql.Connection,java.sql.ResultSet,
     java.sql.PreparedStatement,
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
	 java.text.SimpleDateFormat,
	 java.util.*,
     java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp"%>
<!doctype html>
<html>
<head>
	<link rel="icon" type="image1/png" href="Images/Neomandi1.png">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NeoMandi</title>
    <link rel="stylesheet" href="libs/pure-min.css">
    <link rel="stylesheet" href="libs/grids-responsive-min.css">
	<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pure/0.6.0/grids-responsive-min.css">-->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
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
    #basic-table{
    	width: 300px;
    }
    #basic-table th {
    	height: 50px;
	}
	#tbl2{
		width: 300px;
	}
	.det h4, .bank h4, .pass h4, .aut h4, .hold h4, .release h4, .gen h4, .pass1 h4 {
    background: #bdd102;
    padding: 10px;
    color: #f5f5f5;
    text-align: center;
    margin-bottom: 0px;
}
body {
		    background-image: url("images/nm-white-background-pattern.png");
		    background-repeat:no-repeat;
		    background-size:cover;
		}
</style>
</head>
<body class="">
    <div class="logo_relative">
        <div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
        <div class="container-fluid headertop">
            <div class="">
				<%HttpSession hs=request.getSession(false);
				if((String)hs.getAttribute("name")==null){
					out.println("<script>swal({title: 'You have not logged in. Please login',text: 'You will be redirected to login page.',timer: 2000,showConfirmButton: false},function(){window.location='http://neomandi.in/Login.html';});</script>");
				}
				String name=(String)hs.getAttribute("name"); %>
				
                <div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far">
                    <p style="font-size:16px; color:white;"><%=name %>, welcome to e-auction at NeoMandi.</p></div>
                <div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="FLogout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
            </div>
        </div>
		<%

	
     SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss");
  	String time=df1.format(new Date());
	 
%>
        <div class="container-fluid tradtab">
            <div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
                <ul class="nav nav-tabs">
                    <li><a href="FarmerMaster.jsp">Auction</a></li>
                    <li><a href="Lotdetails.jsp">My Lots</a></li>
                    <li><a class="classbeauty" id="ts" href="#"> Summary </a></li>
                    <li class="active"><a href="FarmerProfile.jsp">My Profile</a></li>
                     <li><a href="FarmerSummaryInt.jsp">History</a></li>
                </ul>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-offset-1 col-xs-10 det">
                <h4 style="color:black;">My Details</h4>
                <div class="detail">
                
<%	 	
		 
	 		  
	     	String pass=(String)hs.getAttribute("pass");  
	     	// String time=(String)hs.getAttribute("time");
	    	 
		 	System.out.println("password="+pass);
		 	
	     	// String time=(String)hs.getAttribute("time");
	    	
			HttpSession hs1=request.getSession(false);  
	   	     hs1.setAttribute("pass",pass); 
		     Connection con = null;
		Statement statement = null;
		     ResultSet rs = null;    
		       
		     con = JDBCHelper.getConnection();
			//display aadhar number 
		    String adhar="";
		     try
		     	{	
		     
		     	statement = con.createStatement();
		     	String sql = "select * from freg where pass='"+pass+"' ";
		     	//System.out.println(sql);
		     	rs = statement.executeQuery(sql);
		    	while(rs.next()){
		    		 adhar=rs.getString("aadharnum");
				    String name1=rs.getString("name");
				    Long mobile=rs.getLong("mobile");
				    String email=  rs.getString("email");
				    String state= rs.getString("state");
				    String district= rs.getString("district"); 
				    String taluk= rs.getString("taluk"); 
				    String bankname= rs.getString("bankname");
				    String accountnumber= rs.getString("accountnum");
				    String ifsc= rs.getString("ifsccode");
				    String branch= rs.getString("branch"); 
				    String pin=rs.getString("pin");
				    String address=rs.getString("address");
				%>
                    <form>
                        <table class="table" id="basic-table">
                            <tr>
                                <td>
                                    <label for="name">Name</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="name" value="<%=name1%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="aadhar">Aadhar Number</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="aadhar" value="<%=adhar %>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="mobno">Mobile Number</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="mobile" value="<%=mobile%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="email">Email:</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="email" value="<%=email%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="address">Address</label>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <input type="text" class="form-control" id="address" value="<%=address%>" readonly/>

                                    
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label for="name">State</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="email" value="<%=state%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="name">District</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="email" value="<%=district%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="name">Taluk</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="email" value="<%=taluk%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pin">Pin</label>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                  

                                    <input type="text" class="form-control" id="email" value="  <%=pin %>" readonly/>

                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-offset-1 col-xs-10 aut">
                <h4 style="color:black;">My Account Details</h4>
                <div class="bankacc">
                    <form>
                        <table class="table" id="tbl2">

                            <tr>
                                <td>
                                    <label for="aadhar">Bank Name</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="email" value="<%=bankname%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="name">Account Number</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="email" value="<%=accountnumber%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="address">IFSC</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="email" value="<%=ifsc %>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="mobno">Bank Branch</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="email" value="<%=branch%>" readonly/>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <%
						}
					}
					catch(SQLException e)
					{
						e.printStackTrace();
					}
		     		
					%>
                </div>
                <br>
                <br>
                <table align="center">
                    <tr>
                        <td><!-- <a href="#" id="download-btn" class="reg">Export as PDF</a> --></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    
    <script src="libs/jspdf.min.js"></script>
	<script src="libs/jspdf.plugin.autotable.src.js"></script>
	<script src="js/profile.js"></script>
    <script>
		    $(function() {
		        $('#download-btn').click(function() {
		            $('#basic-table > tbody:last').append($('#tbl2 > tbody').html());
		            //$('#tbl2').remove();
		            update(true);
		        })
		    });
		
		
		window.onhashchange = function () {
		    update();
		};
		
		// document.getElementById('download-btn').onclick = function () {
		//     update(true);
		// };
		
		function update(shouldDownload) {
		    var funcStr = window.location.hash.replace(/#/g, '') || 'auto';
		    var doc = profile['html']();
		
// 		    doc.setProperties({
// 		        title: 'Example: ' + funcStr,
// 		        subject: 'A jspdf-autotable example pdf (' + funcStr + ')'
// 		    });
		
		    if (shouldDownload) {
		        doc.save('<%=name %>.pdf');
		    } else {
		        document.getElementById("output").src = doc.output('datauristring');
		    }
		}
		
		update();
    </script>
    
     <%
//fetching lotdetails
	String imgsrc="";
    String date="";
    String slot="";
	String s1="";
	try{	

			statement = con.createStatement();
			String sql5 = "select * from productentry where farmerid='"+ adhar+"'";
			System.out.println(sql5);		
			rs = statement.executeQuery(sql5);
			List<String> l=new ArrayList<String>();
			while(rs.next()){
				String lotnumber=rs.getString("lotnumber");
				date+=rs.getString("Date");
				slot+=rs.getString("slotnumber");
				l.add(slot);
				System.out.println(" in farmer profile date="+date);
				System.out.println("slot="+slot);
				for(String obj:l)  {
					 s1=obj;
					}
               	
		}
	} catch (Exception e) {
	e.printStackTrace();
}
	finally
	{
		JDBCHelper.Close(rs);
		JDBCHelper.Close(statement);
		JDBCHelper.Close(con);
	}
	%>
	<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<div id="msg" style="visibility:hidden;" ></div>&nbsp;<font color='blue' ><div id="timer" style="visibility:hidden;" ></div></font></h4>
<div id="auction" style="visibility:hidden;"></div>
<div id="auction1" style="visibility:hidden;"></div>
<%ServletContext context = request.getSession().getServletContext();
String	starttime=(String)context.getAttribute("starttime");
	String endtime=(String)context.getAttribute("endtime"); %>

<!-- fetching date and time for summary -->
<form>
	
<input type="hidden" value="<%=time%>" id="time" />
	<input type="hidden" value="<%=starttime%>" id="stime" />
	<input type="hidden" value="<%=endtime%>" id="etime" />
	<input type="hidden" value="<%=s1%>" id="slot" />
	<input type="hidden" value="<%=date%>" id="date" />
</form>
<script>
	

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
    <script>
    </script> 

</body>
</html>
