<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp" import=" java.text.SimpleDateFormat,java.util.Date,com.neomandi.prototype.*,com.neomandi.prototype.MyFinalCostBean, com.neomandi.prototype.MyFinalCostBean,java.util.*, com.neomandi.prototype.TradeListBean, java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--  <meta http-equiv="refresh"  content="3; URL=http://192.173.6.16:8080/NeomandiPrototype/TradeorAuction.do"> 
 <meta http-equiv="refresh"  content="3; URL=http://localhost:8080/NeomandiPrototype/TradeorAuction.do">-->
<title>Bidding Screen</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<style type = "text/css">
#biding
{
	position: absolute;
    left: 400px;
    top: 240px;
}
#t2
{
	border-collapse: collapse;
	width: 25%;
	text-align: left;
	
}
#t1
{
	border-collapse: collapse;
	width: 90%;
	
}
th,td
{
	border-collapse: collapse;
	text-align: left;
}
#countdown
{
	font-weight: bold;
}
p
{
	text-align: center;
	font-size: 50px;
}
input[type=submit]
{
	padding: 14px 40px;
	font-size: 16px;
	border-radius: 12px;
}

a.more {
    text-align: center;
    border: 1px solid black;
    border-radius: 9px 9px 9px 9px;
    background-color: red;   
	display: inline;
	display: block;
    color: white;
	width: 60px;
	text-decoration: none;
	padding: 10px 20px;
}

a.moree {
	text-align: center;
    border: 1px solid black;
    border-radius: 9px 9px 9px 9px;
    background-color: green;   
	display: inline;
	display: block;
    color: white;
	width: 110px;
	height: 19px;
	text-decoration: none;
	padding: 10px 10px;
}
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
	width: 160px;
	text-decoration: none;
	padding: 10px 20px;
}

a.more {
    text-align: center;
    border: 1px solid black;
    border-radius: 9px 9px 9px 9px;
    background-color: red;   
	display: inline;
	display: block;
    color: white;
	width: 110px;
	text-decoration: none;
	padding: 10px 20px;
}


a.more1 {
    text-align: center;
    border: 1px solid black;
    border-radius: 9px 9px 9px 9px;
    background-color: #1E90FF;   
	display: inline;
	display: block;
    color: white;
	width: 110px;
	text-decoration: none;
	padding: 10px 20px;
}

a.one { border-radius: 1px 1px 1px 1px;
    text-align: center;
    border: 1px solid black;
    background-color: #7CFC00;   
	display: inline;
	display: block;
    color: black;
	width: 110px;
	text-decoration: none;
	padding: 10px 20px;
}

a.two { border-radius: 1px 1px 1px 1px;
    text-align: center;
    border: 1px solid black;
    background-color: #FFD700;   
	display: inline;
	display: block;
    color: black;
	width: 110px;
	text-decoration: none;
	padding: 10px 20px;
}

a.three {
    text-align: center;
    border: 1px solid black;
    background-color: red;   
	display: inline;
	display: block;
    color: black;
	width: 110px;
	text-decoration: none;
	padding: 10px 20px;
	 border-radius: 1px 1px 1px 1px;
}

#timer1
{
    position: right;
   
}

table
{
border-collapse: collapse;
}

td
{
text-align:center
}

.not-active {
   pointer-events: none;
   cursor: default;
}

</style></head>
<body>
 <%@ include file="TRibbon.jsp" %><br><br>
<ul><li><a href="product.jsp">Product Search</a></li>
  <li><a  href="TraderBlock.do">Hold Funds</a></li>
  <li><a class="active"  href="TradeorAuction.do">Trade/Auction</a></li>
  <li><a href="TradeSummary.jsp">Trade Summary</a></li>
  <li><a href = "OrderStatus.do">Order Status</a></li>  <li><a href="TraderProfile.jsp">Your Profile</a></li></ul><br><br><br>
<br><br><h2>AUCTION SLOT:1</h2><br><div id="timer"><input type="text" id="timer1"><br></div>
<div id="auction"></div>
				<div id="auction1"></div><br>
<%
SimpleDateFormat sdf=new SimpleDateFormat("hh:mm:ss"); 
%>
<input type="hidden" id="time" value="<%=sdf.format(new Date())%>"/>

<script>
var Etime=document.getElementById("time").value;
var Btime="10:30:00";
var Btime1="10:35:00";

start = Etime.split(":");
end =Btime.split(":");
var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
 diff = endDate.getTime() - startDate.getTime();
console.log("end time is "+Btime);
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

countdown(minutes,seconds,hours);
var five=300000;
timedif=diff+five;	
var t=setTimeout(nextPage,timedif);
function nextPage()
{
	<% 
		//out.println("<script type=\"text/javascript\">");
		//out.println("alert('AUCTION IS OVER WE ARE DIRECTING YOU TO ORDER STATUS PAGE');");
	//	out.println("location='OrderStatus.do';");
	%>
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
	           /* document.getElementById('ts').onclick = function() {
		            	console.log("inside the count function");
		            	//alert("Auction under progress");
		            	   location="http://localhost:8080/NeomandiPrototype/BeforeAuction.do";
		            	}*/
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
						
		            	var str="<center><b><h4><font color='blue' ><div id='a1'> Auction has begun</div></font></h4></b></center>";
		            	str+="<center><b><h4><font color='blue' ><div id='a2'> Auction will ends in</div></font></h4></b></center>";
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
		            	function count(minutes1,seconds1) 
		            	{
		        		    var seconds =seconds1;
		        		    var mins = minutes1
		        		    var timedifference=+hours+":"+minutes1+":"+seconds1;
		        		    function tick() 
		        		    {
		        		        var counter = document.getElementById("hms");
		        		        var current_minutes = mins
		        		       	seconds--;
		        		        counter.innerHTML =current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
		        		        if( seconds > 0 ) {
		        		            setTimeout(tick,1000);
		        		            /*document.getElementById('ts').onclick = function() {
		        		            	   location="http://localhost:8080/NeomandiPrototype/DuringAuction.do";
		        		            	}*/
		        		        } 
		        		        else 
		        		        {
			        		       if(mins > 0)
			        		       {
			        		 		setTimeout(function () { count(mins - 1,60); },1000);
			        			   }
			        		       else
			        		       {
			        		    	   console.log("aucton has enede");
			        		           	var str1="<center><h4><font color='blue' >Your Auction has ended</font></h4><center>";
			        		           	var strCmd2 = "document.getElementById('hms').style.display = 'none'";
						            	var waitseconds = seconds;
						            	var timeOutPeriod = waitseconds * 1000;
						            	var hideTimer = setTimeout(strCmd2, timeOutPeriod);
						            	var strCmd3 = "document.getElementById('a1').style.display = 'none'";
						            	var waitseconds = seconds;
						            	var timeOutPeriod = waitseconds * 1000;
						            	var hideTimer = setTimeout(strCmd3, timeOutPeriod);
						            	var strCmd4 = "document.getElementById('a2').style.display = 'none'";
						            	var waitseconds = seconds;
						            	var timeOutPeriod = waitseconds * 1000;
						            	var hideTimer = setTimeout(strCmd4, timeOutPeriod);
						            //	document.getElementById('ts').onclick = function() {
			        		            	
			        		            	//alert("Auction under progress");
			        		          //  	   location="http://localhost:8080/NeomandiPrototype/GetSummary.do";
			        		            	//}
						            	/*document.getElementById('accept').onclick = function() {
			        		            	console.log("inside the count function");
			        		            	//alert("Auction under progress");
			        		            	   location="http://localhost:8080/NeomandiPrototype/AfterAccept.do";
			        		            	}*/
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

</script>
<table id = "t1" border = "border">
	<tr bgcolor="#7cfc00">
		<th>Lot Number</th>
		<th>Lot_Cost</th>
		<th>Transportation Charges</th>
		<th>Commission Charges</th>
		<th>Market Cess</th>
		<th>Market Code</th>
		<th>Produce</th>
		<th>Quality Grade</th>
		<th>Best_Bid(Rs/kg)</th>
		<th>My_Bid(Rs/kg)</th>
		<th>Increase Bid by</th>
		<th>Submit Increment</th>
		<th>Increase Bid</th>
		<th>Volume Available(kg)</th>
		<th>Volume_Bidding_for(kg)</th>
		<th>Volume_Assigned(kg)</th>
		<th>My_Final_Cost</th>
		<th>Remove Lot</th>
	</tr>
<tr>
	<td><input type="text" id="lotnumber200CABA2103" value=" 200CABA2103">
	<td><input type="number" id="number200CABA2103"/>
	<td><input type="submit" onclick="fun1200CABA2103();" class="more1" value="SUBMIT"/></td>
	<script>
function fun1200CABA2103()
{
  var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
  var i= document.getElementById("number200CABA2103").value;
  var j= document.getElementById("lotnumber200CABA2103").value;
  //obj={"increment":i};
  //var h={"lotnumber":j};
  //dbParam = JSON.stringify(obj);
  //dbParam1 = JSON.stringify(h);
  xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) 
    {
     // myObj = JSON.parse( );      
      //document.getElementById("demo").innerHTML = xmlhttp.responseText;
    	 var string=xmlhttp.responseText;
         var start=xmlhttp.responseText.indexOf('lotnumber');
         var end=xmlhttp.responseText.lastIndexOf('lotnumber');
//         int end=xmlhttp.responseText.lastindexOf("lotnumber",1);
         document.getElementById("demo1").innerHTML = string;
         document.getElementById("demo2").innerHTML = start;
         document.getElementById("demo3").innerHTML = string.substring(9,20);
   }
  };
  xmlhttp.open("POST", "ajax.do", true);
  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xmlhttp.send("number=" + i+"&lotnumber="+j);
}
</script>
	<td><a onclick="submitbutton200CABA2103();" class="moree">SUBMIT</a></td>
	<script>
function submitbutton200CABA2103()
{
  var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
  var j= document.getElementById("lotnumber200CABA2103").value;
  //obj={"increment":i};
  //var h={"lotnumber":j};
  //dbParam = JSON.stringify(obj);
  //dbParam1 = JSON.stringify(h);
  xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) 
    {
     // myObj = JSON.parse( );
     /* txt += "<table border='1'>"
      for (x in myObj) {
        txt += "<tr><td>" + myObj[x].name + "</td></tr>";
   //   }
     // txt += "</table>"*/
    	 var string=xmlhttp.responseText;
         var start=xmlhttp.responseText.indexOf('lotnumber');
         var end=xmlhttp.responseText.lastIndexOf('lotnumber');
//         int end=xmlhttp.responseText.lastindexOf("lotnumber",1);
         document.getElementById("demo1").innerHTML = string;
         document.getElementById("demo2").innerHTML = start;
         document.getElementById("demo3").innerHTML = string.substring(9,20);
   }
  };
  xmlhttp.open("POST", "ajax.do", true);
  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xmlhttp.send("lotnumber="+j+"&number=1");
}
</script>
</tr>
</body>
</html>
<th></th>
</table>
<br/>
<br/>
</div>
</body>
</html>
 