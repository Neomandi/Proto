<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import=" java.text.SimpleDateFormat,java.util.Date,com.neomandi.prototype.*,com.neomandi.prototype.MyFinalCostBean, com.neomandi.prototype.MyFinalCostBean,java.util.*, com.neomandi.prototype.TradeListBean, java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><!-- 
<meta http-equiv="refresh"  content="3; URL=http://192.173.6.16:8080/NeomandiPrototype/OrderStatus.do">-->
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
<style>
.text-center{
font-size:24px !important;
line-height:36px;
}
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
border-top:2px solid #fff !important;
}

.maindiv{

overflow:auto;
}
.img-responsive {
    height: 60px;
    width: 65px;
}
</style>
</head>
<body>
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<%HttpSession tlog=request.getSession(false);
TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
if((String)tlbn.getTname()==null)
{    out.println("<script type=\"text/javascript\">");
	out.println("alert('YOU HAVE NOT LOGGED IN PLEASE LOGIN ');");
	out.println("location='TraderLogin.jsp';");
	out.println("</script>");
} %>
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><h1><%=tlbn.getTname()%>, welcome to e-aution at Neomandi.</h1></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="logout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    					<li ><a href="product.jsp">Product Search</a></li>
                        <li><a href="TraderBlock.do">Hold Funds</a></li>
                        <li><a href="TradeorAuction.do">Trade</a></li>
                        <li class="active"><a href="OrderStatus.do">Status</a></li>
                        <li><a href="Summary1.do">Summary</a></li>
                        <li><a href="TraderProfile.jsp">My Profile</a></li>
  </ul>
</div>
</div>
</div>
    		<div class="maindiv">
<%
  int i=1;
  RequestDispatcher rd=null;
  int check=0;
  Myclass2 mc=(Myclass2)request.getAttribute("errmsg");
  List al=mc.getAl();
  for(Object o:al)
  {
	OrderStatusBean osbn=(OrderStatusBean)o;
	if(osbn.getSlotnumber()!=null && (osbn.getSlotnumber().equals("slot1")||osbn.getSlotnumber().equals("Slot1")))
	{		
%>
        <!----row1--->
	<div class="one" id="one<%= osbn.getLotnum()%>">
	<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
	<div class="table-responsive"> 
	<table>
	<tbody><tr><td  style="background: #bfbfbf;text-align:center; padding:10px;"><%out.println(i); i++; %></td>
	<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text" value="<%out.println(osbn.getLotnum());%>" readonly></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text" value="<%out.println(osbn.getProduce());%>"readonly></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text" value="<%=osbn.getQualitygrade()%>"readonly></td></tr>
	<tr><td style="white-space:nowrap !important"><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text" value="<%=osbn.getQuantityavailable() %>"readonly></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Cost</h4></td><td><input class="form-control" id="usr" type="text" value="<%= osbn.getLotcost()%>"readonly></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text" value="<%=osbn.getCommission()%>"readonly></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text" value="<%=osbn.getMarketcess()%>"readonly></td></tr>
	<tr><td  style="white-space:nowrap !important"><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text" value="3000"readonly></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text" value="<%=osbn.getMyfinalcost()%>"readonly></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table >
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"  size="10" value="<%=osbn.getQuantityneeded()%>"readonly></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text" value="<%=osbn.getVolumesold() %>"readonly></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text" value="<%= osbn.getBestbid()%>"readonly></td><td class="inp clspad10"><input class="form-control" id="usr" type="text" value="<%= osbn.getBidprice()%>"readonly></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-3 col-sm-3 col-xs-3 second" id="border">	
	<table align="center"><tbody><tr><td><header><h4 class="text-center">Auction Complete.<output id="status<%= osbn.getLotnum()%>"><%if(((String)osbn.getFarmeraccept().toUpperCase()).contains("PENDING")) {out.println("Waiting for farmer's acceptance");%>
	<meta http-equiv="refresh"  content="3; URL=http://loclahost:8080/NeomandiPrototype/OrderStatus.do">
	<%} else if(((String)osbn.getFarmeraccept().toUpperCase()).contains("ACCEPT")) out.println("Farmer has accepted your bid"); else if(((String)osbn.getFarmeraccept().toUpperCase()).contains("REJECT")) out.println("Farmer has rejected your bid");  %></output></h4></header>
	<script> 
	var status=document.getElementById("status<%= osbn.getLotnum()%>").value;
	var clas=document.getElementById("border");
//	status=status+".";
	status=status.toUpperCase();
	console.log(status);	
	if(status.includes("pending")||status.toUpperCase() ==="PENDING")
	{
	//	$("#status").css("border-left: 60px solid yellow;");
		document.getElementById("one<%= osbn.getLotnum()%>").className = 'one';
		console.log("inside pending");
		
	}
	if(status.includes("rejected")||status.toUpperCase() ==="REJECTED")
	{
	//	$("#status").css("border-left: 60px solid red;");
		document.getElementById("one<%= osbn.getLotnum()%>").className = 'three';
		console.log("inside rej");
	}
	if(status.includes("accepted")||status.includes("ACCEPTED")||status.toUpperCase() === "ACCEPTED")
	{
    	//clas.style.borderLeft= "54px solid green";
		document.getElementById("one<%= osbn.getLotnum()%>").className = 'two';
		console.log("inside acp");
	}
	</script></td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div><%}} %>
	<!---row 1 end--->
	<!----row2---><!--  
	<div class="two">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
 <table>
<tbody><tr><td  style="background: #bfbfbf;text-align:center; padding:10px;">2</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td  style="white-space:nowrap !important"><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td  style="white-space:nowrap !important"><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table >
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"  size="10"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-3 col-sm-3 col-xs-3 second">
	
	<table align="center"><tbody><tr><td><h4 class="text-center">Auction Complete. Waiting for Farmer's Acceptance.</h4></td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 2 end--->
	<!----row3-
		<div class="three">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
 <table>
<tbody><tr><td style="background: #bfbfbf;text-align:center;padding:10px">2</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td  style="white-space:nowrap !important"><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:10px;">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td  style="white-space:nowrap !important"><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table >
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"  size="10"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-3 col-sm-3 col-xs-3 second">
	
	<table align="center"><tbody><tr><td><h4 class="text-center">Auction Complete. Waiting for Farmer's Acceptance.</h4></td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 3 end--->
	<!----row 4--
		<div class="three">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
 <table>
<tbody><tr><td  style="background: #bfbfbf;text-align:center; padding:10px;">2</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td  style="white-space:nowrap !important"><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td  style="white-space:nowrap !important"><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table >
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"  size="10"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-3 col-xs-3 second">
	<table align="center"><tbody><tr><td><h4 class="text-center">Auction Complete. Waiting for Farmer's Acceptance.</h4></td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 4 end--->
 </div>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script>
var tt = $( window ).height();
$(".maindiv").height(parseInt(tt)-60);
</script>
</body>
</html>