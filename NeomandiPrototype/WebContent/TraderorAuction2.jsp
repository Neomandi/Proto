<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp" import=" java.text.SimpleDateFormat,java.util.Date,com.neomandi.prototype.*,com.neomandi.prototype.MyFinalCostBean, com.neomandi.prototype.MyFinalCostBean,java.util.*, com.neomandi.prototype.TradeListBean, java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="refresh"  content="3; URL=http://localhost:8080/NeomandiPrototype/TradeorAuction.do"> -->
<title>Bidding Screen</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script> /*
$(function(){
  $("#header").load("Header.html"); 
  $("#footer").load("Footer.html");
 
});

var timeInSecs;
var ticker;

function startTimer(secs){
timeInSecs = parseInt(secs)-1;
ticker = setInterval("tick()",1000);   // every second
}
*/
 
function Block() {
    var ask = window.confirm("Your final cost has crossed blocked amount??..please enter more amount to continue");
    if (ask) 
    {
        window.alert("This post was successfully deleted.");
        document.location.href = "http://localhost:8080/NeomandiPrototype/TraderBlock.jsp";
    }
}
</script> 
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
</style></head>
<body>
 <%@ include file="TRibbon.jsp" %><br><br>
<ul><li><a href="product.jsp">Product Search</a></li>
  <li><a  href="TraderBlock.do">Hold Funds</a></li>
  <li><a class="active"  href="TradeorAuction.do">Trade/Auction</a></li>
  <li><a href="TradeSummary.jsp">Trade Summary</a></li>
  <li><a href = "OrderStatus.do">Order Status</a></li>  <li><a href="TraderProfile.jsp">Your Profile</a></li></ul><br><br><br>
<br><br><h2>AUCTION SLOT:1</h2><br>AUCTION STARTS IN<div id="timer"><input type="text" id="timer1"><br></div>
<%
SimpleDateFormat sdf=new SimpleDateFormat("hh:mm:ss"); 
%>
<input type="hidden" id="time" value="<%=sdf.format(new Date())%>"/>

<script>
var Etime=document.getElementById("time").value;
var Btime="2:08:00:00";
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
//console.log("differences in minutes is "+minutes);
//console.log("differences in seconds is "+seconds);
//console.log("differences in hours is "+hours);
 
var timedifference=+hours+":"+minutes+":"+seconds;
console.log("differences in time is "+timedifference);
var idiff = parseInt("timedifference") + "<br>";
countdown(minutes,seconds,hours);
console.log(diff);
diff=diff+300000;
console.log(diff);
var t=setTimeout(auction, diff);
function auction()
{
	//window.location='http://localhost:8080/NeomandiPrototype/ProductBuyingScreen.html'
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
				        /*if(seconds==0)
				        {
				        	var current_minutes = mins-1
				        	seconds=59;
				        }
				        else*/
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
					            	var str="<center><b><h4><font color='black'>Your Auction ends in</font></h4></b></center>";
					            	str+="<center><h4><font color='red' ><div id='hms' >5:00</div></font></h4></center>";
					            //	var strCmd = "document.getElementById('auction').style.display = 'none'";
					            	var waitseconds = seconds;
					            	// Calculate time out period then execute the command
					            	var timeOutPeriod = waitseconds * 1000;
					            	//var hideTimer = setTimeout(strCmd, timeOutPeriod);
					            	document.getElementById("timer").innerHTML=str;
					            	function count(minutes,seconds1) 
					            	{
					            		console.log("minutes is"+minutes);
					            		console.log("seconds is"+seconds1);
					        		    var seconds =seconds1;
					        		    var mins = minutes
					        		    var timedifference=+hours+":"+minutes+":"+seconds;
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
						        		           	var str1="<center><h4><font color='blue' >Your Auction has ended</font></h4><center>";
						        		           	document.getElementById("auction1").innerHTML=str1;
						        		       }
					        		    	}
				        		     	}
				        		   	 	tick();
				        			}		
					            	var Etime1=document.getElementById("time").value;
					            	var Btime1="02:13:00:00";
					            	start1 = Etime1.split(":");
					            	end1 =Btime1.split(":");
					            	var startDate1 = new Date(0, 0, 0, start1[0], start1[1], start1[2]);
					            	var endDate1 = new Date(0, 0, 0, end1[0], end1[1], end1[2]);
					            	var diff1 = endDate1.getTime() - startDate1.getTime();					            	
					            	var hours1 = Math.floor(diff1 / 1000 / 60 / 60);
					            	var seconds1= Math.floor(diff1 /1000);
					            	var minutes1 = Math.floor(diff1 / 1000 / 60);
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
	<tr>
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
		<th>My_Final_Cost</th>
		<th>Remove Lot</th>
	</tr>
<%
String msg1=(String)request.getAttribute("notlogged");
if(msg1!=null)
{
	 out.println("<script type=\"text/javascript\">");
  	 out.println("alert('YOU HAVE NOT LOGGED IN PLEASE LOGIN ');");
  	 out.println("location='TraderLogin.jsp';");
 	 out.println("</script>");
}
else
{
String msg=(String)request.getAttribute("msg");
if(msg!=null)
{
	 out.println("<script type=\"text/javascript\">");
  	 out.println("alert('your final coast has increased blocked amount!!! we are taking you to block funds page...block more money for more profit ');");
  	 out.println("location='TraderBlock.do';");
 	 out.println("</script>");
}
else
{	
	int i=0;
	int finalcostlist=0;
	int tradelist=0;
	if(request.getAttribute("remove")==null)//not removed any row
	{
		HttpSession traderlistbean=request.getSession(false);
		List<TradeListBean> al=(List<TradeListBean>)traderlistbean.getAttribute("tlb");
		System.out.println("inside trderlist bean"+al);
		for(Object o:al)
		{
			TradeListBean tlb=(TradeListBean)o;
			System.out.println("we are bidding for "+tlb.getProduce()+" slotnumber of that produce is "+tlb.getSlotnumber());
			if(tlb.getSlotnumber()!=null && tlb.getSlotnumber().equals("slot1"))
			{						
				HttpSession MyFinalCost=request.getSession(false);
				List l=(List)MyFinalCost.getAttribute("MyFinalCost"); 
				for(Object m:l)
				{	
					MyFinalCostBean mfcb=(MyFinalCostBean)m;
					System.out.println("list of lotnum inside mfcb is "+mfcb);
					if(mfcb.getLotnum().equals(tlb.getLotnum()))
					{
%>
<tr>
<td align="center"><%=tlb.getLotnum()%></td>
<td align="center"><%if(tlb.getLotnum().equals(mfcb.getLotnum())){ System.out.println("lotcost"+mfcb.getLotcost()); out.println(" "+mfcb.getLotcost()+" ");} else{ System.out.println(""); System.out.println("");}%></td>
<td align="center" width="180">3000</td>
<td width="160"><%if(tlb.getLotnum().equals(mfcb.getLotnum())){System.out.println("commission"+mfcb.getCommission());  out.println(mfcb.getCommission());} %></td>
<td align="center" width="100"><%if(tlb.getLotnum().equals(mfcb.getLotnum())){System.out.println("marketcess"+mfcb.getMarketcess());  out.println(mfcb.getMarketcess());}%></td>
<td align="center" width="110"><%= tlb.getMarketcode() %></td>
<td align="center" width="90"><%= tlb.getProduce() %></td>
<td align="center" width="110"><%= tlb.getQualitygrade() %></td>
<td align="center" width="160"><% if(mfcb.getBestbid()==null)out.println("--"); else  out.println(mfcb.getBestbid()); %></td>
<td align="center"><%if(tlb.getLotnum().equals(mfcb.getLotnum())){ out.println(mfcb.getPrice());}%> </td>
<form id="form<%=tlb.getLotnum()%>" action="increment.do">
<input type="hidden" name="lotnum" id="lotnum<%=tlb.getLotnum()%>" value="<%out.print(tlb.getLotnum());%>"></input>
<td><input type="number" min="0" name="increment" id="number<%out.println(tlb.getLotnum());%>" required></td>
<td><a href="#" onclick="document.getElementById('form<%=tlb.getLotnum()%>').submit();" class=" moree">Submit</a></td>
</form>
<script>
function funct<%=tlb.getLotnum()%>()
{
	var lotnum=$("#lotnum<%=tlb.getLotnum()%>").val()
	var value=$("#number<%=tlb.getLotnum()%>").val()
	console.log("increment is "+document.getElementById('number<%out.println(tlb.getLotnum());%>').value))
    $( "form" ).on( "submit", function() {
	event.preventDefault();
	location.href='http://localhost:8080/NeomandiPrototype/increment.do?increment=' + value+' &&lotnum='+lotnum
});	
}
</script>
<td><a href="SubmitIncrement1.do?lotnum=<%=tlb.getLotnum() %>" id="submit1" onclick = "fun<%= tlb.getLotnum() %>()" class=" moree"> BY 1 RUPEE</a></td> 
<script>
function fun<%=tlb.getLotnum() %>()
{
   var valu = parseInt(document.getElementById('<%= tlb.getLotnum()%>').value, 10);
   valu = isNaN(valu) ? 1 : valu;
   if(valu==1){}
   else	   
   	valu++;
   document.getElementById('<%= tlb.getLotnum() %>').value =valu;
}
</script>
<!--  <td align="center"><a href="SubmitIncrement2.do?lotnum=<%=tlb.getLotnum() %>" onclick = "fun2<%= tlb.getLotnum() %>()" class=" moree"> BY 2 RUPEE</a></td>
<script>
function fun2<%=tlb.getLotnum() %>()
{
   	var valu = parseInt(document.getElementById('<%= tlb.getLotnum()%>').value, 10);
   	valu = isNaN(valu) ? 2 : valu;
   	if(valu==1){}
    else	
   	valu++;
  	valu++;
   	document.getElementById('<%= tlb.getLotnum() %>').value =valu;
}	
</script>-->
<td align="center" width="160"><%= tlb.getQuantity()%> </td>	
<td align="right"><%=tlb.getQuantityneeded() %></td>			
<td align="center"><%if(tlb.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getMyfinalcost());%></td>
</form>
<td><a href="removelotnumber.do?lotnum=<%=tlb.getLotnum() %>" class="more"> REMOVE</a></td>
</tr>
<%				 }
			   }
			 }	
		}
	}
	else//removed row
	{	
			int j=0;
			HttpSession remove=request.getSession(false);
			List<TradeListBean> l=(List<TradeListBean>)remove.getAttribute("list");
		  	for(Object m:l)		
		   	{
		   		TradeListBean tlbr=(TradeListBean)m;
		   		System.out.println("inside tlbr->"+tlbr);
		   		if(tlbr.getSlotnumber()!=null && tlbr.getSlotnumber().equals("slot1"))
				{
		   			System.out.println("lotnum which belongs to slot1 "+tlbr.getLotnum());
			   		if(request.getAttribute("smsg")!=null)// incremented
					{				
			   			HttpSession MyFinalCost=request.getSession(false);
						List ll=(List)MyFinalCost.getAttribute("MyFinalCost"); 
			   			for(Object mm:ll)
						{
							MyFinalCostBean mfcb=(MyFinalCostBean)mm;						
							System.out.println("MyFinalCostBeanlotnumber->"+mfcb.getLotnum());		
							
 %>
<tr>
<td><%out.println(tlbr.getLotnum());%></td>
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getLotcost()); else out.println("");%></td>
<td>3000</td>
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getCommission());%></td>
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getMarketcess());%></td>
<td><%= tlbr.getMarketcode() %></td>
<td><%= tlbr.getProduce() %></td>
<td><%= tlbr.getQualitygrade() %></td>
<td align="center"><% if(mfcb.getBestbid()==null)out.println("-");  else  out.println(mfcb.getBestbid());  %></td>		
<td align="center"><%if(tlbr.getLotnum().equals(mfcb.getLotnum())){ out.println(mfcb.getPrice());}%> </td>
<input type="hidden" id="lotnum<%=tlbr.getLotnum()%>" values="<%out.println(tlbr.getLotnum());%>">
<form id="form<%=tlbr.getLotnum()%>" action="increment.do">
<input type="hidden" name="lotnum" id="lotnum<%=tlbr.getLotnum()%>" value="<%out.print(tlbr.getLotnum());%>"></input>
<td><input type="number" min="0" name="increment" id="number<%out.println(tlbr.getLotnum());%>" required></td>
<td><a href="#" onclick="document.getElementById('form<%=tlbr.getLotnum()%>').submit();" class=" moree">Submit</a></td>
</form>
<script>
	function funct<%=tlbr.getLotnum()%>()
	{
			var lotnum=$("#lotnum<%=tlbr.getLotnum()%>").val()
			var value=$("#number<%=tlbr.getLotnum()%>").val()
	        $( "form" ).on( "submit", function() {
			event.preventDefault();
			location.href='http://localhost:8080/NeomandiPrototype/increment.do?increment=' + value+'&&lotnum='+lotnum
			console.log("value is " + value+"&&lotnum="+lotnum)
	});	
	}
</script>
<form method="increment.do"><td><input type="number" min="0" ><td><input type="submit"></form></td><td><a href="SubmitIncrement1.do?lotnum=<%=tlbr.getLotnum() %>" onclick = "fun<%= tlbr.getLotnum() %>()" class=" moree"> BY 1 RUPEE</a></td>
<script>
function fun<%=tlbr.getLotnum() %>()
{
   var valu = parseInt(document.getElementById('<%= tlbr.getLotnum()%>').value, 10);
   valu = isNaN(valu) ? 1 : valu;
   valu++;
   document.getElementById('<%= tlbr.getLotnum() %>').value =valu;
}
</script>
<!--  <td><a href="SubmitIncrement2.do?lotnum=<%=tlbr.getLotnum() %>" onclick = "fun2<%= tlbr.getLotnum() %>()" class=" moree"> BY 2 RUPEE</a></td>-->
<script>
			function fun2<%=tlbr.getLotnum() %>()
				{
			    	var valu = parseInt(document.getElementById('<%= tlbr.getLotnum()%>').value, 10);
				   	valu = isNaN(valu) ? 0 : valu;
				   	valu++;
				   	valu++;
			   		document.getElementById('<%= tlbr.getLotnum() %>').value =valu;
				}
</script>
<td><%= tlbr.getQuantity()%> </td>	
<td><%=tlbr.getQuantityneeded() %></td>			
<td><%if(request.getAttribute("smsg")==null) out.println(""); else{if(tlbr.getLotnum().equals(mfcb.getLotnum())) System.out.println("tlbr ="+tlbr.getLotnum()+" mfcb"+mfcb.getLotnum());  out.println(mfcb.getMyfinalcost());}%></td>
</form>
<td><a href="removelotnumber.do?lotnum=<%=tlbr.getLotnum() %>" class="more"> REMOVE</a></td>
</tr><% 
			}	
		}	
		else//not incremnted
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
<tr>
<td><%out.println(tlbr.getLotnum());%></td>
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getLotcost()); else out.println("");%></td>
<td>3000</td>
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getCommission());%></td>
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getMarketcess());%></td>
<td><%= tlbr.getMarketcode() %></td>
<td><%= tlbr.getProduce() %></td>
<td><%= tlbr.getQualitygrade() %></td>
<td align="center"><% if(mfcb.getBestbid()==null)out.println("-"); else  out.println(mfcb.getBestbid());  %></td>		
<td align="center"><%if(tlbr.getLotnum().equals(mfcb.getLotnum())){ out.println(mfcb.getPrice());}%> </td>			
<input type="hidden" id="lotnum<%=tlbr.getLotnum()%>" values="<%out.println(tlbr.getLotnum());%>">
<form id="form<%=tlbr.getLotnum()%>" action="increment.do">
<input type="hidden" name="lotnum" id="lotnum<%=tlbr.getLotnum()%>" value="<%out.print(tlbr.getLotnum());%>"></input>
<td><input type="number" min="0" name="increment" id="number<%out.println(tlbr.getLotnum());%>" ></td>
<td><a href="#" onclick="document.getElementById('form<%=tlbr.getLotnum()%>').submit();" class=" moree">Submit</a></td>
</form>
<script>
function funct<%=tlbr.getLotnum()%>()
{
					var lotnum=$("#lotnum<%=tlbr.getLotnum()%>").val()
					var value=$("#number<%=tlbr.getLotnum()%>").val()
				  $( "form" ).on( "submit", function() {
				   event.preventDefault();
				   location.href='http://localhost:8080/NeomandiPrototype/increment.do?increment=' + value+'&&lotnum='+lotnum
				   console.log("value is " + value+"&&lotnum="+lotnum)
				   });	
				}
				</script>
<td><a href="SubmitIncrement1.do?lotnum=<%=tlbr.getLotnum() %>" onclick = "fun<%= tlbr.getLotnum() %>()" class=" moree"> BY 1 RUPEE</a></td>
<script>
function fun<%=tlbr.getLotnum() %>()
{
	   var valu = parseInt(document.getElementById('<%= tlbr.getLotnum()%>').value, 10);
	   valu = isNaN(valu) ? 1 : valu;
	   if(valu==1){}
	   else	   
	   valu++;
	   document.getElementById('<%= tlbr.getLotnum() %>').value =valu;
}
</script>
<!--  <td><a href="SubmitIncrement2.do?lotnum=<%=tlbr.getLotnum() %>" onclick = "fun2<%= tlbr.getLotnum() %>()" class=" moree"> BY 2 RUPEE</a></td>-->
<script>
function fun2<%=tlbr.getLotnum() %>()
{
	   	var valu = parseInt(document.getElementById('<%= tlbr.getLotnum()%>').value, 10);
	   	valu = isNaN(valu) ? 2 : valu;
	   	if(valu==1){}
	   	else	
		valu++;
		valu++;
		document.getElementById('<%= tlbr.getLotnum() %>').value =valu;
}	
</script>
<td><%= tlbr.getQuantity()%> </td>	
<td><%=tlbr.getQuantityneeded() %></td>			
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getMyfinalcost()); System.out.println("tlbr ="+tlbr.getLotnum()+" mfcb"+mfcb.getLotnum());%></td>
</form>
<td><a href="removelotnumber.do?lotnum=<%=tlbr.getLotnum() %>" class="more"> REMOVE</a></td>
</tr>
<% }}}}}}}%>
<tr>
<th></th>
</table>
<br/>
<br/>

<!-- from here auction2 starts  -->
<h2>AUCTION SLOT:2</h2>
<br>AUCTION STARTS AT 11:45 AM<br><br>
<table id = "t1" border = "border">
	<tr>
		<th>Lot Number</th>
		<th>Lot Cost</th>
		<th>Transportation Charges</th>
		<th>Commission Charges</th>
		<th>Market Cess</th>
		<th>Market Code</th>
		<th>Produce</th>
		<th>Quality Grade</th>
		<th>Volume Available(kg)</th>
		<th>Volume_Bidding_for(kg)</th>
		<th>My Final Cost</th>
	</tr>
<%
String msg11=(String)request.getAttribute("notlogged");
if(msg11!=null)
{
	 out.println("<script type=\"text/javascript\">");
  	 out.println("alert('YOU HAVE NOT LOGGED IN PLEASE LOGIN ');");
  	 out.println("location='TraderLogin.jsp';");
 	 out.println("</script>");
}
else
{
	String ms=(String)request.getAttribute("msg");
	if(ms!=null)
	{
		 out.println("<script type=\"text/javascript\">");
	  	 out.println("alert('your final coast has increased blocked amount!!! we are taking you to block funds page...block more money for more profit ');");
	  	 out.println("location='TraderBlock.jsp';");
	 	 out.println("</script>");
	}
	else
	{	
		System.out.println("final lot cost is less than blocekd moaney");
		int i=0;
		int finalcostlist=0;
		int tradelist=0;
		if(request.getAttribute("remove")==null)//not removed any row
		{
			HttpSession traderlistbean=request.getSession(false);
			List<TradeListBean> al=(List<TradeListBean>)traderlistbean.getAttribute("tlb");
			System.out.println("inside trderlist bean"+al);
			for(Object o:al)
			{
				if(al.size()==0)
				{
					out.println("None of The lotnumber selected come under auction 2 slot");
				}
				TradeListBean tlb=(TradeListBean)o;//***********     added on dec 8
				if(tlb.getSlotnumber()==null)
				{
					System.out.println("lotnum which trader will bid for is "+tlb.getLotnum()+" slotnumebr is "+tlb.getSlotnumber());
					HttpSession MyFinalCost=request.getSession(false);
					List l=(List)MyFinalCost.getAttribute("MyFinalCost"); 
					for(Object m:l)
					{					
						MyFinalCostBean mfcb=(MyFinalCostBean)m;
						System.out.println("list of lotnum inside mfcb is "+mfcb);
						if(mfcb.getLotnum().equals(tlb.getLotnum()) &&tlb.getSlotnumber()==null)
						{
							System.out.println("lotnum which has slot number as none "+tlb.getLotnum());
%>
<tr>
<td><%out.println(tlb.getLotnum());%></td>
<td><output name = "lotcost" id = "lotcost"/> </td>
<td>3000</td>
<td><output type="text" name = "commission" id = "commission"> </td>
<td><output type="text" name = "marketcess" id = "marketcess"> <!--  value="<%//if(tlb.getLotnum().equals(mfcb.getLotnum())){System.out.println("marketcess"+mfcb.getMarketcess());  out.println(mfcb.getMarketcess());}%>"/>--></td>
<td><%= tlb.getMarketcode() %></td>
<td><%= tlb.getProduce() %></td>
<td><%= tlb.getQualitygrade() %></td> <!-- 

<td><output name="BestBid" id="BestBid" readonly/></td>						
<td><output type="text" name="MyBid" id="<%= tlb.getLotnum()%>">  value="<%//if(tlb.getLotnum().equals(mfcb.getLotnum())){System.out.println("my bidprice"+mfcb.getPrice()+"my lotnumber is"+mfcb.getLotnum()); out.println(mfcb.getPrice());}%>"/> </td>
<td> </td>
<script>
function fun<%=tlb.getLotnum() %>()
{
   var valu = parseInt(document.getElementById('<%= tlb.getLotnum()%>').value, 10);
   valu = isNaN(valu) ? 1 : valu;
   if(valu==1){}
   else	   
   	valu++;
   document.getElementById('<%= tlb.getLotnum() %>').value =valu;
}
</script>
<td></td>
<script>
function fun2<%=tlb.getLotnum() %>()
{
   	var valu = parseInt(document.getElementById('<%= tlb.getLotnum()%>').value, 10);
   	valu = isNaN(valu) ? 2 : valu;
   	if(valu==1){}
    else	
   	valu++;
  	valu++;
   	document.getElementById('<%= tlb.getLotnum() %>').value =valu;
}	
</script> --> 
<td><%= tlb.getQuantity()%> </td>	
<td><%=tlb.getQuantityneeded() %></td>			
<td><%out.println(" "); %></td>
</form>
<td><a href="removelotnumber.do?lotnum=<%=tlb.getLotnum() %>" class="more"> REMOVE</a></td>
</tr>
<%					}	
				}
			}//txt file slot2aucton removed lot
	 	}
	}
	else//removed row
	{	
			int j=0;
			HttpSession remove=request.getSession(false);
			List<TradeListBean> l=(List<TradeListBean>)remove.getAttribute("list");
		  	for(Object m:l)		
		   	{
			   		TradeListBean tlbr=(TradeListBean)m;				
		   			if(tlbr.getSlotnumber()==null)
					{
						System.out.println("lotnum which trader will bid for is "+tlbr.getLotnum()+" slotnumebr is "+tlbr.getSlotnumber());
						HttpSession MyFinalCost=request.getSession(false);
						List ll=(List)MyFinalCost.getAttribute("MyFinalCost"); 						
			   			for(Object mm:ll)
						{
							MyFinalCostBean mfcb=(MyFinalCostBean)mm;									
							System.out.println("MyFinalCostBeanlotnumber->"+mfcb.getLotnum());		
							if(tlbr.getLotnum().equals(mfcb.getLotnum()))
							{
 %>
<tr>
<td><%=tlbr.getLotnum()%></td>
<td><output name = "lotcost" id = "lotcost" ><!-- value="<%if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getLotcost()); else out.println("");%>">--></output></td>
<td>3000</td>
<td><output type="text" name = "commission" id = "commission"></output></td>
<td><output type="text" name = "marketcess" id = "marketcess" ><!-- value="<%if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getMarketcess());%>">--></output></td>
<td><%= tlbr.getMarketcode() %></td>
<td><%= tlbr.getProduce() %></td>
<td><%= tlbr.getQualitygrade() %></td>
<td><%= tlbr.getQuantity()%> </td>	
<td><%=tlbr.getQuantityneeded() %></td>
<td><output name="BestBid" id="BestBid" readonly/></td>				
<td><output type="text" name="MyBid" id="<%= tlbr.getLotnum()%>"><!--  value="<%if(tlbr.getLotnum().equals(mfcb.getLotnum())){System.out.println("my lotnumber is"+mfcb.getLotnum()+"bidprice is"+mfcb.getPrice()); out.println(mfcb.getPrice());}%>">--></output> </td>
<td><%out.println(" "); %>
</form>
<td><a href="removelotnumber.do?lotnum=<%=tlbr.getLotnum() %>" class="more"> REMOVE</a></td>
</tr><% 
							}
			}	
		}	//txt file slot2aucton removed lot
		}}}}}%>
<tr>
<th></th>
</table>
<br/>
<br/>
</div>
</body>
</html>