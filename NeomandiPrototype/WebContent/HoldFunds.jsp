<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="Error.jsp" pageEncoding="ISO-8859-1" import=" java.text.SimpleDateFormat,java.util.Date,com.neomandi.prototype.*,com.neomandi.prototype.MyFinalCostBean, com.neomandi.prototype.MyFinalCostBean,java.util.*, com.neomandi.prototype.TradeListBean, java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image1/png" href="Images/Neomandi1.png">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
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
<script src="js/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
<style>
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
}
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
a
{
	cursor:pointer;
}
.tradtab a{
    background-color:#0082B2;
    }
    body {
		    background-image: url("images/nm-white-background-pattern.png");
		    background-repeat:no-repeat;
		    background-size:cover;
		}
</style>
</head>
<body>
<%
	SimpleDateFormat sdf=new SimpleDateFormat("HH");
	SimpleDateFormat sdf1=new SimpleDateFormat("mm");
	String hours=sdf.format(new Date());
	String minutes=sdf1.format(new Date());
	int hour=Integer.parseInt(hours);
	int minute=Integer.parseInt(minutes);
	System.out.println("current time is "+hour+":"+minute+"  ");
%>
<input type="hidden" value="<%=hour%>" id="hour">
<input type="hidden" value="<%=minute%>" id="minute">
<script>
var hour=document.getElementById("hour");
var minute=document.getElementById("minute");
//console.log("current time is "+hour+":"+minute+" hour!=10"+hour!=10);
if(hour!=10){}
	// alert("YOU CAN CHECK STATUS ONLY AFTER AUCTION IS DONE ")
	 else
		 {
			 console.log("minute<35"+minute<35)
			 if(minute<35){}
			//	 alert("YOU CAN CHECK STATUS ONLY AFTER AUCTION IS DONE ")
		 }
</script>
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
	HttpSession tlog=request.getSession(false);
	TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
	if((String)tlbn.getTname()==null)
	{   
		%> 
		<script type="text/javascript\">
	  	 swal({title:'YOU HAVE NOT LOGGED IN PLEASE LOGIN '});  	
	  	 location='TraderLogin.jsp';
	 	 </script>						 	 
	<%
	}
%>
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><p style="font-size:16px; color:white;"><%=tlbn.getTname()%>, welcome to e-auction at NeoMandi.</p></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right"  data-placement="bottom" data-toggle="tooltip" title="Logout" href="logout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    					<li ><a href="product.jsp">Product Search</a></li>
                        <li  class="active"><a href="TraderBlock.do">Hold Funds</a></li>
                        <li><a href="TradeorAuction.do">Trade</a></li>
                        <li><a href="OrderStatus.do">Status</a></li>
                        <li><a href="Summary1.do">Summary</a></li>
                        <li><a href="TraderProfile.jsp">My Profile</a></li>
  </ul>
</div>
</div>
</div> <div class="container">
	  <br><br>
<div class="row">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass" style=" border-radius: 25px;">
<% 
HttpSession hcs=request.getSession(false);
TraderBlockBean tbb=(TraderBlockBean)hcs.getAttribute("bean");
hcs.setAttribute("bean",tbb);
if((String)tlbn.getTname()==null)
{    out.println("<script type=\"text/javascript\">");
  	 out.println("swal('YOU HAVE NOT LOGGED IN PLEASE LOGIN ');");
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
<h4 style="background: #bdd102;color:black;">My Account Details</h4>
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
      <tr><td><input type="text" class="form-control" id="email" value="<%if(tbb.getBranch()==null) out.println("--"); else out.println(tbb.getBranch()); %>" readonly></td></tr>
      <tr><td><label for="address">Available Balance</label></td></tr><br/>
	  <tr><td><input type="text"  class="form-control" id="balance" readonly></td></tr>
	  <tr><td><table align="center"><tr><td><a onclick="getbalance()" class="reg">Get Balance</a></td></tr></table></td></tr>
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
<h4 style="background: #bdd102;color:black;">Hold Funds</h4>
<div class="bankacc">
<br><br>
<form id="form"><table class="table" >      
	<tr><td><input type="number" min="0" class="form-control" id="hold" placeholder="Enter Amount(Rs)"></td></tr>
	<tr><td><table align="center"><tr><td><a id="hld" onclick="hold1()"class="reg" >Hold</a></td></tr></table></td></tr>
    </table></form>
      <script>
    document.getElementById("hold").addEventListener("keyup", function(event1){
    event1.preventDefault();
    if(event1.which == 13 || event1.keyCode == 13) 
    {
	      	  event1.preventDefault();      	   
	      	  var balance=document.getElementById("balance").value;
	  		  var bal=new Number(balance);
	  		  var account=document.getElementById("a1").value;
	  		  var bank=document.getElementById("a2").value;
	  		  var hold=document.getElementById("hold").value;
	  		  var hld=new Number(hold);
	  		  console.log("balance"+balance+"block"+hold+"bank is "+bank+"account is "+account);
	  		  console.log(hld<0);
	  		  if(hold.length==0)
	  		  {
	  			 	swal("PLEASE ENTER AMOUNT TO BE HELD ");	  			  	
	  		  }
	  		  if(hold.length>6)
			  {
	  			  swal("Please enter valid amount ");
			  }
	  		  else if(balance!=null&&balance.length!=0)
	  		  {
	  			  console.log("inside balance!=null&")
	  			if(bal<hld)
	  			{
	  					swal("You are trying to hold funds more than the balance in your bank account. Please enter an amount same or less than the available balance")
	  					document.getElementById("hold").value="";
	  			}
	  			else if(hld<0||hld==0)
	  			{
	  					console.log("hld<0");
	  					swal("Please enter positive number");
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
	  		   			     swal('SUCCESSFULLY BLOCKED AMOUNT Rs. '+ hold);	
	  		   			     
	  				  }};
	  					  xmlhttp.open("POST", "ajaxBlockfunds.do", true);
	  					  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  					  xmlhttp.send("block="+hold+"&account="+account+"&bank="+bank);
	  			 }
	  		  }
	  		  else
	  		  {
	  			  if(hld<0||hld==0)
	  				{
	  					console.log("hld<0");
	  					swal("PLEASE ENTER POSITIVE NUMBER");
	  				}
	  			  else
	  				  {
	  			  xmlhttp = new XMLHttpRequest();
	  			  xmlhttp.onreadystatechange = function() {
	  			  if (this.readyState == 4 && this.status == 200) 
	  			  {
	  				  	 var string=xmlhttp.responseText;
	  				  	 console.log("string is"+string);
	  				  	 if(string.includes("fail"))
	  				  		 swal("YOU DONT HAVE SUFFICIENT BANK BALANCE TO BLOCK MONEY");
	  				  	 else
	  				  	 {
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
	  		   			     swal('SUCCESSFULLY BLOCKED AMOUNT Rs. '+ hold);	
	  				  	 }
	  	   			     
	  			  }};
	  				  xmlhttp.open("POST", "ajaxBlockfunds.do", true);
	  				  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  				  xmlhttp.send("block="+hold+"&account="+account+"&bank="+bank);
	  			 }
	  		  }    }   	
      	});
	$('#form').submit(function(e){
	    e.preventDefault();
	});
	function hold1()
	{
		 var balance=document.getElementById("balance").value;
 		  var bal=new Number(balance);
 		  var account=document.getElementById("a1").value;
 		  var bank=document.getElementById("a2").value;
 		  var hold=document.getElementById("hold").value;
 		  var hld=new Number(hold);
 		  console.log("balance"+balance+"block"+hold+"bank is "+bank+"account is "+account);
 		  console.log(hld<0);
 		  if(hold.length==0)
 			  {swal("PLEASE ENTER AMOUNT TO BE HELD ");}
 		  console.log("hold.length"+hold.length);
 		 if(hold.length>7)
		  {swal("Please enter valid amount ");}
 		  else if(balance!=null&&balance.length!=0)
 		  {
 			  console.log("inside balance!=null&")
 			if(bal<hld)
 			{
 					swal("You are trying to hold funds more than the balance in your bank account. Please enter an amount same or less than the available balance")
 					document.getElementById("hold").value="";
 			}
 			else if(hld<0||hld==0)
 			{
 					console.log("hld<0");
 					swal("Please enter positive number");
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
 		   			     swal('Successfully blocked amount Rs. '+ hold);	
 		   			     
 				  }};
 					  xmlhttp.open("POST", "ajaxBlockfunds.do", true);
 					  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 					  xmlhttp.send("block="+hold+"&account="+account+"&bank="+bank);
 			 }
 		  }
 		  else
 		  {
 			  if(hld<0||hld==0)
 				{
 					console.log("hld<0");
 					swal("Please enter positive number");
 				}
 			  else
 				  {
 			  xmlhttp = new XMLHttpRequest();
 			  xmlhttp.onreadystatechange = function() {
 			  if (this.readyState == 4 && this.status == 200) 
 			  {
 				  	 var string=xmlhttp.responseText;
 				  	 console.log("string is"+string);
 				  	 if(string.includes("fail"))
 				  		 swal("YOU DONT HAVE SUFFICIENT BANK BALANCE TO BLOCK MONEY");
 				  	 else
 				  	 {
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
 		   			     swal('Successfully blocked amount  Rs. '+ hold);	
 				  	 }
 	   			     
 			  }};
 				  xmlhttp.open("POST", "ajaxBlockfunds.do", true);
 				  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 				  xmlhttp.send("block="+hold+"&account="+account+"&bank="+bank);
 			 }
 		  }    
	}
	</script>
  <br><br>
  </div>
</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 release">
<h4 style="background:#149DDA;">Release Funds</h4>
<div class="password">
    <%	tlbn = (TraderLoginBean)tlog.getAttribute("tlog");
		if(tlbn.getTname()==null)
			{}
	  	Connection con = null;
		ResultSet rs = null;	
    	PreparedStatement ps = null;
    	int result=0;
    	 int funds=0;
			
		try
		{
			result=0;
			con = JDBCHelper.getConnection();
			ps =con.prepareStatement("SELECT tb.fund_utilized,tb.blockamount FROM traders_blocked_amount tb,treg tr where tr.name=? and tr.aadharnumber=tb.aadharnumber ");
			ps.setString(1, tlbn.getTname());
			ps.execute();
			System.out.println(ps);
			rs = ps.getResultSet();	
			while(rs.next())
			{
				result=rs.getInt("blockamount");	
				funds=rs.getInt("fund_utilized");
			}	
			System.out.println(result+" "+funds);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		 %><input type="hidden" value="<%=result%>" id="amount">
	  <form>
      <table class="table">   
	  <tr><td><label for="name">Fund Utilized</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" value="<%=funds %>" readonly></td></tr>
      <tr><td><label for="aadhar">Net Amount on Hold</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="netamount" value="<%=result %>" readonly/></td></tr>
	  <tr><td><input type="number" min="0" class="form-control" id="release" placeholder="Enter Amount"/></td ></tr>	  
	  <tr><td><table align="center"><tr><td><a id="release" onclick="holdfundsrelease()" class="reg">Release</a></td></tr></table></td></tr>
      <script>
      document.getElementById("release").addEventListener("keyup", function(event) {
      	event.preventDefault();
      	if (event.keyCode == 13) 
      	{
      	  //  document.getElementById("release").click();
      		holdfundsrelease();
      	}
      	});
      	console.log("blocked amoutn is +"+document.getElementById("amount").value)
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
					swal("You cannot release more funds than the net amount on hold ");
			}
			else if(release.length==0)
			{
					swal("Please enter the amount to be released")
			}
			else if(rel<0)
			{
				swal("Please Enter positive number");	
			}
		 	else
		    {
			  xmlhttp = new XMLHttpRequest();
			  xmlhttp.onreadystatechange = function() 
			  {
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
		   			     swal('Successfully released amount Rs. '+ release);	
		   			     
				  }
			  };
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