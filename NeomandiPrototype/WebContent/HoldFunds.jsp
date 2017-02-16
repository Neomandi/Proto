<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.neomandi.prototype.TraderBlockBean, com.neomandi.prototype.TraderLoginBean" errorPage="Error.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NeoMandi</title>
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
.whiteclsbc{
background-color:#ffffff;
width:5%;
border-top:1px solid #fff !important;
}
tbody:before {
    content: "-";
    display: block;
    line-height:10px;
    color: transparent;
}
.from table{
margin-top:0px;
} 
.autable .table tbody tr td, .lottable .table tbody tr td,   .sum2tab .table tbody tr td {
border-top:2px solid #fff !important;
}
.img-responsive {
	height: 60px;
	width: 65px;
}
</style>
</head>
<body class="" >
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<div class="col-lg-offset-2 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><h1>Trade1, welcome to e-aution at Neomandi.</h1></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="login.html"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
 <li ><a href="product.jsp">Product Search</a></li>
                        <li class="active"><a href="TraderBlock.do">Hold Funds</a></li>
                        <li><a href="TradeorAuction.do">Trade</a></li>
                        <li><a href="OrderStatus.do">Status</a></li>
                        <li><a href="Summary.jsp">Summary</a></li>
                        <li><a href="TraderProfile.jsp">My Profile</a></li>
  </ul>
</div>
</div>
</div>   
      <div class="container">
	  <br><br>
<div class="row">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass">
<% 
HttpSession tlog=request.getSession(false);
TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");

HttpSession hcs=request.getSession(false);
TraderBlockBean tbb=(TraderBlockBean)hcs.getAttribute("bean");
hcs.setAttribute("bean",tbb);

if((String)tlbn.getTname()==null)
{    out.println("<script type=\"text/javascript\">");
  	 out.println("alert('YOU HAVE NOT LOGGED IN PLEASE LOGIN ');");
  	 out.println("location='TraderLogin.jsp';");
 	 out.println("</script>");
}
else
{	
 /* String msg=null;
  msg=(String)request.getAttribute("msg"); 
  String msg1=(String)request.getAttribute("blockmsg");
  System.out.println(" msg is "+msg+" msg1 is "+msg1);
  if(msg==null&&msg1==null)
  {}
  else
  {
	  if((msg!=null&&!msg.contains("you dont have account"))||msg1!=null)
	  {
		  String acc=tbb.getAccountnumber();
		  String bank=tbb.getDbbankname();*/
%>
<h4>My Account Details</h4>
<div class="detail">
<form>
    <table class="table">
      <tr><td><label for="name">Bank Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="a2" value="<%=tbb.getDbbankname() %>"readonly></td></tr>
      <tr><td><label for="aadhar">Account Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="a1" value="<%=tbb.getAccountnumber() %>" readonly></td></tr>
      <tr><td><label for="mobno">IFSC</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="a3" value="<%=tbb.getIfsc() %>" readonly></td></tr>	  
      <tr><td><label for="branch">Bank Branch</label></td></tr>
      <tr><td><input type="text" class="form-control" id="email" value="<%=tbb.getBranch()%>" readonly></td></tr>
      <tr><td><label for="address">Available Balance</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="balance" readonly></td></tr> 
	  <tr><td><table align="center"><tr><td><a href="#" onclick="getbalance()" class="reg">Get Balance</a></td></tr></table></td></tr>
	  <script>
	  function getbalance()
	  {	
		  var accountnumber=document.getElementById("a1").value;
		  console.log("account number for which balance is checked is "+accountnumber);
		  xmlhttp = new XMLHttpRequest();
		  xmlhttp.onreadystatechange = function() {
		  if (this.readyState == 4 && this.status == 200) 
		  {
			    		 var string=xmlhttp.responseText;		        	 	        	 
					     console.log("balance "+string+" ");
					     
				         document.getElementById("balance").innerHTML = string;
				         document.getElementById("balance").value = string;				         
		  }};
			  xmlhttp.open("POST", "holdfundsgetbalance.do", true);
			  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			  xmlhttp.send("accountnumber="+accountnumber);
		}
		</script>
    </table>
  </form><br><br>
  </div>
</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 hold">
<h4>Hold Funds</h4>
<div class="bankacc">
<br><br>
<form>
    <table class="table">      
	<tr><td><input type="number" min="0" class="form-control" id="hold" placeholder="Enter Amount"></td></tr>
	<tr><td><table align="center"><tr><td><a href="#" onclick="hold()"class="reg" >Hold</a></td></tr></table></td></tr>
    <script>
	function hold()
	{	
		  var balance=document.getElementById("balance").value;
		  var bal=new Number(balance);
		  var account=document.getElementById("a1").value;
		  var bank=document.getElementById("a2").value;
		  var hold=document.getElementById("hold").value;
		  var hld=new Number(hold);
		  console.log("balance"+balance+"block"+hold+"bank is "+bank+"account is "+account);
		  if(balance!=null&&balance.length!=0)
		  {			 	        
			if(bal<hld)
			{
					alert("YOU CANT HOLD FUNDS MORE THAN AVAILABLE BALANCE")
			}
			 else
			  {
				  xmlhttp = new XMLHttpRequest();
				  xmlhttp.onreadystatechange = function() {
				  if (this.readyState == 4 && this.status == 200) 
				  {
					  	 var string=xmlhttp.responseText; 	   			      
	        			 var starttotalblocked=xmlhttp.responseText.indexOf('totalblocked');
		   			     var endtotalblocked=xmlhttp.responseText.lastIndexOf('totalblocked');
		   			     starttotalblocked=starttotalblocked+12;	
		   			     console.log(string);
		   			     console.log(string.substring(starttotalblocked,endtotalblocked));
		   				 var blocked= string.substring(starttotalblocked,endtotalblocked);
		   				 console.log("total blocked amount is "+blocked);
		   			     document.getElementById("netamount").innerHTML = blocked;
		   			  	 document.getElementById("netamount").value = blocked;
		   			     document.getElementById("hold").value = "";
		   			  document.getElementById("balance").value = "";
		   			     alert('SUCCESSFULLY BLOCKED AMOUNT Rs. '+ hold);	
		   			     
				  }};
					  xmlhttp.open("POST", "ajaxBlockfunds.do", true);
					  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
					  xmlhttp.send("block="+hold+"&account="+account+"&bank="+bank);
				 }
		  }
		  else  if(hold==0)
			  {
			  	alert("PLEASE HOLD MORE FUNDS");
			  }
		  else
		  {
			  xmlhttp = new XMLHttpRequest();
			  xmlhttp.onreadystatechange = function() {
			  if (this.readyState == 4 && this.status == 200) 
			  {
				  	 var string=xmlhttp.responseText; 	   			      
        			 var starttotalblocked=xmlhttp.responseText.indexOf('totalblocked');
	   			     var endtotalblocked=xmlhttp.responseText.lastIndexOf('totalblocked');
	   			     starttotalblocked=starttotalblocked+12;	
	   			     console.log(string);
	   			     console.log(string.substring(starttotalblocked,endtotalblocked));
	   				 var blocked= string.substring(starttotalblocked,endtotalblocked);
	   				 console.log("total blocked amount is "+blocked);
	   			     document.getElementById("netamount").innerHTML = blocked;
	   			  	 document.getElementById("netamount").value = blocked;
	   			     document.getElementById("hold").value = "";
	   			  document.getElementById("balance").value = "";
	   			     alert('SUCCESSFULLY BLOCKED AMOUNT Rs. '+ hold);	
	   			     
			  }};
				  xmlhttp.open("POST", "ajaxBlockfunds.do", true);
				  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				  xmlhttp.send("block="+hold+"&account="+account+"&bank="+bank);
			 }
		  }		 
		</script>
    </table>
  </form><br><br>
  </div>
</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 release">
<h4>Release Funds</h4>
<div class="password">
<form>
    <table class="table">   
	  <tr><td><label for="name">Fund Utilized</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="aadhar">Net Amount on Hold</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="netamount" value="<%=tbb.getBlock() %>" readonly></td></tr>
	  <tr><td><input type="number" min="0" class="form-control" id="release" placeholder="Enter Amount"></td></tr>	  
	  <tr><td><table align="center"><tr><td><a href="#" onclick="holdfundsrelease()" class="reg">Release</a></td></tr></table></td></tr>
     <script>
		function holdfundsrelease()
		{		  
		    var netamount=document.getElementById("netamount").value;
		    var bank=document.getElementById("a2").value;
			var release=document.getElementById("release").value;	
			var net=new Number(netamount);
			var rel=new Number(release);
			console.log("netamout"+net+" release"+rel+"bank"+bank);
			if(net<rel)
			{
					alert("YOU CANT RELEASE FUNDS MORE THAN NET AMOUNT HELD ");
			}
			else if(release.length==0)
				{
				alert("YOU HAVE TO MENTION THE AMOUNT TO BE RELASED BEFORE CLICKING ")
				}
		  else
		  {
			  xmlhttp = new XMLHttpRequest();
			  xmlhttp.onreadystatechange = function() {
			  if (this.readyState == 4 && this.status == 200) 
			  {
				  	 var string=xmlhttp.responseText; 	   			      
        			 /*var starttotalblocked=xmlhttp.responseText.indexOf('totalblocked');
	   			     var endtotalblocked=xmlhttp.responseText.lastIndexOf('totalblocked');
	   			     starttotalblocked=starttotalblocked+12;	
	   			     console.log(string);
	   			     console.log(string.substring(starttotalblocked,endtotalblocked));
	   				 var blocked= string.substring(starttotalblocked,endtotalblocked);
	   				 console.log("total blocked amount is "+blocked);*/
	   				 console.log("string is "+string);
	   			     document.getElementById("netamount").innerHTML = string;
	   			  	 document.getElementById("netamount").value = string;
	   			     document.getElementById("hold").value = "";
	   				 document.getElementById("balance").value = "";
	   				 document.getElementById("release").value = "";
	   			     alert('SUCCESSFULLY RELEASED AMOUNT Rs. '+ release);	
	   			     
			  }};
				  xmlhttp.open("POST", "ajaxReleasefunds.do", true);
				  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				  xmlhttp.send("release="+rel+"&bank="+bank);
			 }
		  }		 
		</script>
    </table>
  </form><br><br>
  <%} %>
  </div>
</div>
</div>
</div>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>