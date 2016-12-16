<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import=" java.text.SimpleDateFormat,java.util.Date,com.neomandi.prototype.*,com.neomandi.prototype.MyFinalCostBean, com.neomandi.prototype.MyFinalCostBean,java.util.*, com.neomandi.prototype.TradeListBean, java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 
 <meta http-equiv="refresh"  content="2; URL=http://192.173.6.16/:8080/NeomandiPrototype/TradeorAuction.do"> -->
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
</style></head>
<body>
 <%@ include file="TRibbon.jsp" %><br><br><br><br>
<ul><li><a href="ProductSearch.jsp">Product Search</a></li>
  <li><a  href="TraderBlock.jsp">Block Funds</a></li>
  <li><a class="active"  href="TradeorAuction.do">Trade/Auction</a></li>
  <li><a href="TradeSummary.jsp">Trade Summary</a></li>
  <li><a href="TradeConsignment.jsp">Track consignment</a></li></ul><br><br><br>
<nav>
	<ul id = "tradernav">
		<li><a href = "ProductBuyingScreen.html">Buy</a></li>
		<li><a href = "OrderStatusScreen.html">Order Status</a></li>
		<li><a href = "PaymentScreen.html">Payment</a></li>
		<li><a href = "tlogout.do">Logout</a></li>
	</ul>
</nav><br/><br><br><h2>AUCTION SLOT:1</h2><br>AUCTION STARTS IN<div id="timer"><input type="text" id="timer1"><br></div>
<%
SimpleDateFormat sdf=new SimpleDateFormat("hh:mm:ss"); 
System.out.println("time is "+sdf.format(new Date()));%>
<input type="hidden" id="time" value="<%=sdf.format(new Date())%>"/>

<script>
var Etime=document.getElementById("time").value;
var Btime="02:50:00:00";
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
			 				if(mins > 1)
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
					            	var str="<center><b><h4><font color='blue' >Your Auction ends in</font></h4></b></center>";
					            	str+="<center><h4><font color='red' ><div id='hms' >5:00</div></font></h4></center>";
					            //	var strCmd = "document.getElementById('auction').style.display = 'none'";
					            	var waitseconds = seconds;

					            	// Calculate time out period then execute the command
					            	var timeOutPeriod = waitseconds * 1000;
					            	//var hideTimer = setTimeout(strCmd, timeOutPeriod);
					            	document.getElementById("timer").innerHTML=str;
					            	function count(minutes) {
					        		    var seconds =60;
					        		    var mins = minutes
					        		    var timedifference=+hours+":"+minutes+":"+seconds;
					        		    function tick() 
					        		    {
					        		        var counter = document.getElementById("hms");
					        		        var current_minutes = mins-1
					        		       	seconds--;
					        		        counter.innerHTML =current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
					        		        if( seconds > 0 ) {
					        		            setTimeout(tick,1000);
					        		        } 
					        		        else 
					        		        {
						        		       if(mins > 1)
						        		       {
						        		 		setTimeout(function () { count(mins - 1); },1000);
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
				        			count(5);				            	
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
		<th>My Bid(Rs/kg)</th>
		<th>Increase Bid</th>
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
  	 out.println("location='TraderBlock.jsp';");
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
				System.out.println("lotnum which trader will bid for is "+tlb.getLotnum());
				if(request.getAttribute("smsg")!=null)// incremented
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
<td align="center"><%out.println(" "+tlb.getLotnum()+" ");%></td>
<td align="center" width="69"><%if(tlb.getLotnum().equals(mfcb.getLotnum())){ System.out.println("lotcost"+mfcb.getLotcost()); out.println(" "+mfcb.getLotcost()+" ");} else{ System.out.println(""); System.out.println("");}%></td>
<td align="center" width="180">3000</td>
<td width="160"><%if(tlb.getLotnum().equals(mfcb.getLotnum())){System.out.println("commission"+mfcb.getCommission());  out.println(mfcb.getCommission());} %></td>
<td align="center" width="100"><%if(tlb.getLotnum().equals(mfcb.getLotnum())){System.out.println("marketcess"+mfcb.getMarketcess());  out.println(mfcb.getMarketcess());}%></td>
<td align="center" width="110"><%= tlb.getMarketcode() %></td>
<td align="center" width="90"><%= tlb.getProduce() %></td>
<td align="center" width="110"><%= tlb.getQualitygrade() %></td>
<td align="center" width="160"><%= mfcb.getBestbid() %></td>
<td align="center"><input type="number" name="MyBid" id="<%= tlb.getLotnum()%>"  min="<%if(tlb.getLotnum().equals(mfcb.getLotnum())){ out.println(mfcb.getPrice());}%>"/> </td>
<td><a href="SubmitIncrement1.do?lotnum=<%=tlb.getLotnum() %>" onclick = "fun<%= tlb.getLotnum() %>()" class=" moree"> BY 1 RUPEE</a></td>
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
<td align="center"><a href="SubmitIncrement2.do?lotnum=<%=tlb.getLotnum() %>" onclick = "fun2<%= tlb.getLotnum() %>()" class=" moree"> BY 2 RUPEE</a></td>
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
</script>
<td align="center" width="160"><%= tlb.getQuantity()%> </td>	
<td align="right"><%=tlb.getQuantityneeded() %></td>			
<td align="center"><%if(tlb.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getMyfinalcost());%></td>
</form>
<td><a href="removelotnumber.do?lotnum=<%=tlb.getLotnum() %>" class="more"> REMOVE</a></td>
</tr>
<%					}	
				}
			}
			else
			{	
				HttpSession MyFinalCost=request.getSession(false);
				List l=(List)MyFinalCost.getAttribute("MyFinalCost"); 
				for(Object m:l)
				{	
					MyFinalCostBean mfcb=(MyFinalCostBean)m;
					if(mfcb.getLotnum().equals(tlb.getLotnum()))
					{
				%>
				<tr>
				<td align="center"><%out.println(tlb.getLotnum());%></td>
				<td align="center"><%if(tlb.getLotnum().equals(mfcb.getLotnum())){ System.out.println("lotcost"+mfcb.getLotcost()); out.println(" "+mfcb.getLotcost()+" ");} else{ System.out.println(""); System.out.println("");}%></td>
				<td align="center">3000</td>
				<td align="center"><% if(tlb.getLotnum().equals(mfcb.getLotnum())){System.out.println("commission"+mfcb.getCommission());  out.println(mfcb.getCommission());}%></td>
				<td align="center"><%if(tlb.getLotnum().equals(mfcb.getLotnum())){System.out.println("marketcess"+mfcb.getMarketcess());  out.println(mfcb.getMarketcess());}%></td>
				<td align="center"><%= tlb.getMarketcode() %></td>
				<td align="center"><%= tlb.getProduce() %></td>
				<td align="center"><%= tlb.getQualitygrade() %></td>
				<td align="center"><%= mfcb.getBestbid() %></td>				
							
				<td align="center"><input type="text" name="MyBid" id="<%= tlb.getLotnum()%>"  value="<% if(tlb.getLotnum().equals(mfcb.getLotnum())){ out.println(mfcb.getPrice());}%>"></input> </td>
				<td align="center"><a href="SubmitIncrement1.do?lotnum=<%=tlb.getLotnum() %>" onclick = "fun<%= tlb.getLotnum() %>()" class=" moree"> BY 1 RUPEE</a></td>
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
				<td align="center"><a href="SubmitIncrement2.do?lotnum=<%=tlb.getLotnum() %>" onclick = "fun2<%= tlb.getLotnum() %>()" class=" moree"> BY 2 RUPEE</a></td>
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
				</script>
				<td align="center"><%= tlb.getQuantity()%> </td>	
				<td align="center"><%=tlb.getQuantityneeded()%></td>			
				<td align="center"><%if(tlb.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getMyfinalcost());%></td>
				</form>
				<td align="center"><a href="removelotnumber.do?lotnum=<%=tlb.getLotnum() %>" class="more"> REMOVE</a></td>
				</tr>
				<% 
				}
				}
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
		   		if(tlbr.getSlotnumber()!=null && tlbr.getSlotnumber().equals("slot1"))
				{
			   		if(request.getAttribute("smsg")!=null)
					{				
			   			for(Object mm:l)
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
<td><%= mfcb.getBestbid() %></td>				
<td><input type="text" name="MyBid" id="<%= tlbr.getLotnum()%>"  value="<%if(tlbr.getLotnum().equals(mfcb.getLotnum())){System.out.println("my lotnumber is"+mfcb.getLotnum()+"bidprice is"+mfcb.getPrice()); out.println(mfcb.getPrice());}%>"></input> </td>
<td><a href="SubmitIncrement1.do?lotnum=<%=tlbr.getLotnum() %>" onclick = "fun<%= tlbr.getLotnum() %>()" class=" moree"> BY 1 RUPEE</a></td>
<script>
function fun<%=tlbr.getLotnum() %>()
{
   var valu = parseInt(document.getElementById('<%= tlbr.getLotnum()%>').value, 10);
   valu = isNaN(valu) ? 1 : valu;
   valu++;
   document.getElementById('<%= tlbr.getLotnum() %>').value =valu;
}
</script>
<td><a href="SubmitIncrement2.do?lotnum=<%=tlbr.getLotnum() %>" onclick = "fun2<%= tlbr.getLotnum() %>()" class=" moree"> BY 2 RUPEE</a></td>
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
<td><input type="text" name="quantity" ></td>			
<td><%if(request.getAttribute("smsg")==null) out.println(""); else{if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getMyfinalcost());}%></td>
</form>
<td><a href="removelotnumber.do?lotnum=<%=tlbr.getLotnum() %>" class="more"> REMOVE</a></td>
</tr><% 
			}	
		}	
		else
		{
%>
<tr>
<td><%out.println(tlbr.getLotnum());%></td>
<td><% out.println(""); %></td>
<td>3000</td>
<td><% out.println("");%></td>
<td><%out.println("");%>></td>
<td><%= tlbr.getMarketcode() %></td>
<td><%= tlbr.getProduce() %></td>
<td><%= tlbr.getQualitygrade() %></td>
<td><input name="BestBid" id="BestBid" readonly/></td>				
<td><input type="text" name="MyBid" id="<%= tlbr.getLotnum()%>"  value="<% out.println("");%>"></input> </td>
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
<td><a href="SubmitIncrement2.do?lotnum=<%=tlbr.getLotnum() %>" onclick = "fun2<%= tlbr.getLotnum() %>()" class=" moree"> BY 2 RUPEE</a></td>
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
<td><input type="text" name="quantity" ></td>			
<td><%out.println("");%></td>
</form>
<td><a href="removelotnumber.do?lotnum=<%=tlbr.getLotnum() %>" class="more"> REMOVE</a></td>
</tr>
<% }}}}}}%>
<tr>
<th></th>
</table>
<br/>
<br/>


<!-- from here auction2 starts  -->



<h2>AUCTION SLOT:2</h2><br><br>
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
		<th>Best Bid(Rs/kg)</th>
		<th>My Bid(Rs/kg)</th>
		<th>Increase Bid</th>
		<th>Increase Bid</th>
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
String msg=(String)request.getAttribute("msg");
if(msg!=null)
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
				if(request.getAttribute("smsg")!=null)// incremented
				{								
					HttpSession MyFinalCost=request.getSession(false);
					List l=(List)MyFinalCost.getAttribute("MyFinalCost"); 
					for(Object m:l)
					{					
						MyFinalCostBean mfcb=(MyFinalCostBean)m;
						System.out.println("list of lotnum inside mfcb is "+mfcb);
						if(mfcb.getLotnum().equals(tlb.getLotnum()) &&tlb.getSlotnumber()==null){
%>
<tr>
<td><%out.println(tlb.getLotnum());%></td>
<td><output name = "lotcost" id = "lotcost"/> </td>
<td>3000</td>
<td><output type="text" name = "commission" id = "commission"> </td>
<td><output type="text" name = "marketcess" id = "marketcess"> <!--  value="<%if(tlb.getLotnum().equals(mfcb.getLotnum())){System.out.println("marketcess"+mfcb.getMarketcess());  out.println(mfcb.getMarketcess());}%>"/>--></td>
<td><%= tlb.getMarketcode() %></td>
<td><%= tlb.getProduce() %></td>
<td><%= tlb.getQualitygrade() %></td>
<td><output name="BestBid" id="BestBid" readonly/></td>						
<td><output type="text" name="MyBid" id="<%= tlb.getLotnum()%>"> <!--  value="<%if(tlb.getLotnum().equals(mfcb.getLotnum())){System.out.println("my bidprice"+mfcb.getPrice()+"my lotnumber is"+mfcb.getLotnum()); out.println(mfcb.getPrice());}%>"/>--> </td>
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
</script>
<td><%= tlb.getQuantity()%> </td>	
<td><input type="text" name="quantity" ></td>			
<td><input name = "finalcost" id = "finalcost"/> <!--   value="<%if(tlb.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getMyfinalcost());%>"> --></td>
</form>
<td><a href="removelotnumber.do?lotnum=<%=tlb.getLotnum() %>" class="more"> REMOVE</a></td>
</tr>
<%					}	
				}
			}
			else
			{	
				%>
				<tr>
				<td><%out.println(tlb.getLotnum());%></td>
				<td><output name = "lotcost" id = "lotcost"> <!--   value="<% out.println(""); %>">--></output></td>
				<td>3000</td>
				<td><output type="text" name = "commission" id = "commission"> <!-- value="<% out.println("");%>">--></output></td>
				<td><output type="text" name = "marketcess" id = "marketcess" > <!-- value="<%out.println("");%>">--></output></td>
				<td><%= tlb.getMarketcode() %></td>
				<td><%= tlb.getProduce() %></td>
				<td><%= tlb.getQualitygrade() %></td>
				<td><output name="BestBid" id="BestBid" readonly/></td>				
							
				<td><output type="text" name="MyBid" id="<%= tlb.getLotnum()%>" > <!-- value="<% out.println("");%>">--></output> </td>
				<td><!--<a href="SubmitIncrement1.do?lotnum=<%=tlb.getLotnum() %>" onclick = "fun<%= tlb.getLotnum() %>()" class=" moree"> BY 1 RUPEE</a>--></td>
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
				<td><!--<a href="SubmitIncrement2.do?lotnum=<%=tlb.getLotnum() %>" onclick = "fun2<%= tlb.getLotnum() %>()" class=" moree"> BY 2 RUPEE</a>--></td>
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
				</script>
				<td><%= tlb.getQuantity()%> </td>	
				<td><output type="text" name="quantity" ></td>			
				<td><output name = "finalcost" id = "finalcost" > <!--  value="<%out.println("");%>">--></output></td>
				</form>
				<td><a href="removelotnumber.do?lotnum=<%=tlb.getLotnum() %>" class="more"> REMOVE</a></td>
				</tr>
				<% 
				}
		 	}
		}
	}
	else
	{	
			int j=0;
			HttpSession remove=request.getSession(false);
			List<TradeListBean> l=(List<TradeListBean>)remove.getAttribute("list");
		  	for(Object m:l)		
		   	{
		   		TradeListBean tlbr=(TradeListBean)m;
		   		if(request.getAttribute("smsg")!=null)
				{				
		   			for(Object mm:l)
					{
						MyFinalCostBean mfcb=(MyFinalCostBean)mm;									
						System.out.println("MyFinalCostBeanlotnumber->"+mfcb.getLotnum());		
						System.out.println("******************************");
						System.out.println("**removed and increment		**");
						System.out.println("******************************");	
 %>
<tr>
<td><%out.println(tlbr.getLotnum());%></td>
<td><output name = "lotcost" id = "lotcost" ><!-- value="<%if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getLotcost()); else out.println("");%>">--></output></td>
<td>3000</td>
<td><output type="text" name = "commission" id = "commission"><!-- value=<%if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getCommission());%>">--></output></td>
<td><output type="text" name = "marketcess" id = "marketcess" ><!-- value="<%if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getMarketcess());%>">--></output></td>
<td><%= tlbr.getMarketcode() %></td>
<td><%= tlbr.getProduce() %></td>
<td><%= tlbr.getQualitygrade() %></td>
<td><output name="BestBid" id="BestBid" readonly/></td>				
<td><output type="text" name="MyBid" id="<%= tlbr.getLotnum()%>"><!--  value="<%if(tlbr.getLotnum().equals(mfcb.getLotnum())){System.out.println("my lotnumber is"+mfcb.getLotnum()+"bidprice is"+mfcb.getPrice()); out.println(mfcb.getPrice());}%>">--></output> </td>
<td><!--<a href="SubmitIncrement1.do?lotnum=<%=tlbr.getLotnum() %>" onclick = "fun<%= tlbr.getLotnum() %>()" class=" moree"> BY 1 RUPEE</a>--></td>
<script>
function fun<%=tlbr.getLotnum() %>()
{
   var valu = parseInt(document.getElementById('<%= tlbr.getLotnum()%>').value, 10);
   valu = isNaN(valu) ? 1 : valu;
   valu++;
   document.getElementById('<%= tlbr.getLotnum() %>').value =valu;
}
</script>
<td><!--<a href="SubmitIncrement2.do?lotnum=<%=tlbr.getLotnum() %>" onclick = "fun2<%= tlbr.getLotnum() %>()" class=" moree"> BY 2 RUPEE</a>--></td>
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
<td><output type="text" name="quantity" ></td>			
<td><output name = "finalcost" id = "finalcost" > <!-- value="<%if(request.getAttribute("smsg")==null) out.println(""); else{if(tlbr.getLotnum().equals(mfcb.getLotnum()))  out.println(mfcb.getMyfinalcost());}%> --> </input></td>
</form>
<td><a href="removelotnumber.do?lotnum=<%=tlbr.getLotnum() %>" class="more"> REMOVE</a></td>
</tr><% 
			}	
		}	
		else
		{
%>
<tr>
<td><%out.println(tlbr.getLotnum());%></td>
<td><output name = "lotcost" id = "lotcost" value="<% out.println(""); %>"></output></td>
<td>3000</td>
<td><output type="text" name = "commission" id = "commission" ><!--value="<% out.println("");%>">--></output></td>
<td><output type="text" name = "marketcess" id = "marketcess" ><!-- value="<%out.println("");%>">--></output></td>
<td><%= tlbr.getMarketcode() %></td>
<td><%= tlbr.getProduce() %></td>
<td><%= tlbr.getQualitygrade() %></td>
<td><output name="BestBid" id="BestBid" readonly/></td>				
<td><output type="text" name="MyBid" id="<%= tlbr.getLotnum()%>" ><!-- value="<% out.println("");%>">--></output> </td>
<td><!--<a href="SubmitIncrement1.do?lotnum=<%=tlbr.getLotnum() %>" onclick = "fun<%= tlbr.getLotnum() %>()" class=" moree"> BY 1 RUPEE</a>--></td>
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
<td><!--<a href="SubmitIncrement2.do?lotnum=<%=tlbr.getLotnum() %>" onclick = "fun2<%= tlbr.getLotnum() %>()" class=" moree"> BY 2 RUPEE</a>--></td>
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
<td><output type="text" name="quantity" ></td>			
<td><output name = "finalcost" id = "finalcost"  value="<%out.println("");%>"></output></td>
</form>
<td><a href="removelotnumber.do?lotnum=<%=tlbr.getLotnum() %>" class="more"> REMOVE</a></td>
</tr>
<% }}}}}%>
<tr>
<th></th>
</table>
<br/>
<br/>
</div>
</body>
</html>