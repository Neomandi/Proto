<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.neomandi.prototype.TraderBlockBean" errorPage="Error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hold Funds</title>
<head>
<style>

function disable() {
    document.getElementById("radio").disabled = true;
}

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
input[type=text]
{
	vertical-align: middle;
	display:inline-block;
}

$(#ICICI).click(function(){$("#form0").submit();})


</style></head>
<body>
<%@ include file="TRibbon.jsp" %>
<br><br><ul>
  <li><a href="product.jsp">Product Search</a></li>
  <li><a class="active" href="TraderBlock.do">Hold Funds</a></li>
  <li><a href="TradeorAuction.do">Trade/Auction</a></li>
  <li><a href="TradeSummary.jsp">Trade Summary</a></li>
  <li><a href = "OrderStatus.do">Order Status</a></li>  <li><a href="TraderProfile.jsp">Your Profile</a></li></ul><br><br><br>
<font color="red"><br><br><br>
<h2><u>Hold Funds</u></h2><br><br>
</font>
<% 

String msg3=(String)request.getAttribute("notlogged");
System.out.println("String msg3=(String)request.getAttribute(msg);"+msg3);
if(msg3!=null)
{
	 out.println("<script type=\"text/javascript\">");
  	 out.println("alert('YOU HAVE TO LOGIN TO PEROFRM FURTHER OPERATIONS ');");
  	 out.println("location='TraderLogin.jsp';");
 	 out.println("</script>");
}
else
{	
  String msg=null;
  msg=(String)request.getAttribute("msg"); 
  String msg1=(String)request.getAttribute("blockmsg");
  System.out.println(" msg is "+msg+" msg1 is "+msg1);
 if(msg==null&&msg1==null)
  {}
  else
  {
	  HttpSession hcs=request.getSession(false);
	  TraderBlockBean tbb=(TraderBlockBean)hcs.getAttribute("bean");
	  if((msg!=null)&&msg.contains("you dont have account"))
	 		  out.println(msg);
  %><br>
<% 
	  if((msg!=null&&!msg.contains("you dont have account"))||msg1!=null)
	  {
		  String acc=tbb.getAccountnumber();
		  String bank=tbb.getDbbankname();
%>
<font color="blue">
<h3>Account Details:</h3><br/></font><font color="black" ><h5></font>
<font size="3px">
BANK NAME: <output type="text" id="a2"><%=tbb.getDbbankname() %></output><br/><br/>
ACCOUNT NUMBER: <output type="text" name="a1" id="account" ><%=tbb.getAccountnumber() %></output><br/><br/>
BANKS IFSC: <output type="text" name="a3"><%=tbb.getIfsc() %></output><br/><br/>
BALANCE AVAILABLE: <output type="text" id="a5" name="a5" ><%=tbb.getBalance() %></output><br/><br/>
TOTAL AMOUNT BLOCKED:  <output type="text" id="a6" name="a5"><%if(request.getAttribute("totalblock")==null)out.println(tbb.getBlock()); else out.println(request.getAttribute("totalblock")); %></output><br/><br/></font>
<h4><font color="black">ENTER AMOUNT TO BE BLOCKED: <input type="number" id="block" min="1" name="block" required /> <br/><br/></font>
</h4><br><br>
<input type="submit" name="blockbutton" value="BLOCK" onclick="fun()"/><br/><br/>
<script>
function fun()
{ 	   
	   var amount =document.getElementById("block").value;
	   var block=new  Number(amount);	   
	   var balance=document.getElementById("a5").value;	   
	   var bal=new Number(balance);
	   var account=document.getElementById("account").value;	   
	   var bank=document.getElementById("a2").value;	
	   
	   console.log("balance ="+balance);
	   if(block==0||block<0)
		   {
		   alert("Please enter valid amount to be blocked");	   
	   console.log(" if(amount>balance)"+ block<balance);
		   }
	   else if(block>bal)  {
		   alert("YOU CANT BLOCK MORE THAN AVAILABLE BALANCE");
		   location='TraderBlock.do';}
	   else
		   {
			   var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
			   xmlhttp = new XMLHttpRequest();
			   xmlhttp.onreadystatechange = function()
			   {
			   if(this.readyState == 4 && this.status == 200) 
			   {
			   			     // myObj = JSON.parse( );
			   			      //document.getElementById("demo").innerHTML = xmlhttp.responseText;
			   			      //values to be printed: lotnumber lotcost commission market bestbid mybid assigned final
			       			 var string=xmlhttp.responseText; 	   			      
		           			 var startbalance=xmlhttp.responseText.indexOf('balance');
			         		 var endbalance=xmlhttp.responseText.lastIndexOf('balance');
			         		 startbalance=startbalance+7;
			   			         
			   			         var starttotalblocked=xmlhttp.responseText.indexOf('totalblocked');
			   			         var endtotalblocked=xmlhttp.responseText.lastIndexOf('totalblocked');
			   			         starttotalblocked=starttotalblocked+13;
			   			         
			   			         var startblock=xmlhttp.responseText.indexOf('z');
			   			         var endblock=xmlhttp.responseText.lastIndexOf('z');
			   			         startblock=startblock+1;
			   					console.log(string.substring(startbalance,endbalance));
			   					console.log(string.substring(starttotalblocked,endtotalblocked));
			   					var balance=string.substring(startbalance,endbalance);
			   					var blocked= string.substring(starttotalblocked,endtotalblocked);
			   			         document.getElementById("a5").innerHTML = balance;
			   			         document.getElementById("a6").innerHTML = blocked;
			   			         alert('SUCCESSFULLY BLOCKED AMOUNT Rs.'+ block);
			   			       
			   			   }
			   			  };
			   			  xmlhttp.open("POST", "ajaxBlockfunds.do", true);
			   			  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			   			  xmlhttp.send("account=" + account+"&block="+block+"&bank="+bank);
		   }
}
</script>
<%}}%><font color="red">
<% 
if(msg1==null)
{}
if(msg1!=null)
{
	if((msg1.contains("not")||msg1.contains("blocked cant be null")))
	{
		out.println(msg1);
	}
	else if(request.getAttribute("blockamount")!=null)
	{
		%><p>SUCCESSFULLY BLOCKED AMOUNT:</p><p id="a1"></p><script>var amount =document.getElementById("block").value;
		   var block=new  Number(amount); document.getElementById("a1").innerHTML = block;</script>  <%
//		out.println("Total Amount blocked from your account till now: ");+request.getAttribute("totalblock"));
	}
}
}%></font>
</body>