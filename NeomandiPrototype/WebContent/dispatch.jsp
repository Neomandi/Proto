<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage = "Error.jsp" pageEncoding="ISO-8859-1" import="com.neomandi.prototype.EmployeeLoginBean,java.util.*,com.neomandi.prototype.OrderStatusResult, com.neomandi.prototype.DispatchBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <link href="css/sweetalert.css" rel="stylesheet" type="text/css">
	<script src="js/sweetalert.min.js" type="text/javascript"></script>
<style>
table:nth-child(even) {
    classname: container-fluid dispatch pad;
}
.img-responsive
{
	height:60px;
	width: 65px;
}
.tradtab a{
    background-color:#0082B2;
    }
 
.table > tbody + tbody { 
border-top:0px;
}
#div
{   		
			padding:30px;
			margin:200px;
			width:50%;
			background-color:#F2F2F2;
			text-align:center;
			color:darkblue;	 
			font-size:18px;
}
body {
		    background-image: url("images/nm-white-background-pattern.png");
		    background-repeat:no-repeat;
		    background-size:cover;
		}
</style>
</head>
<body class="" >
<%EmployeeLoginBean elbn = null;
HttpSession elog = request.getSession(); 

if((String)elog.getAttribute("ename")==null || (String)elog.getAttribute("epwd")==null)
{
	//System.out.println("Session invalid."+elog);
	out.println("<script>swal({title: 'You have not logged in. Please login',text: 'You will be redirected to login page.',timer: 2000,showConfirmButton: false},function(){window.location='Login.html';});</script>");
}
%>
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"  ></div>
<div class="container-fluid headertop">
<div class="">
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><p style="font-size:16px; color:white;"><%=((String)elog.getAttribute("ename"))%>, welcome to e-auction at NeoMandi.</p></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" data-toggle="tooltip" title="Logout" href="ELogout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>

<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li><a href="ProductEntry.jsp">Product Entry</a></li>
    <li><a href="Revenue.jsp">Revenue</a></li>
    <li class="active"><a href="Dispatch.do">Dispatch</a></li>
  </ul>
</div>
</div>
</div> 

<div class="container-fluid dispatch pad" id="text">
<div class="row">
  <div class="col-lg-offset-1 col-lg-6 col-sm-12 col-xs-12">
     <div class="row wback">
         <div class="col-lg-11 col-sm-8 col-xs-offset-0 col-xs-12 table-responsive">
			   <table class="table">
			   <tr>
			   		<th   ></th>
			   		<th   ></th>
					<th   style="text-align:center;">Lot Number</th>
					<th>
					</th>
					<th   colspan="2"></th>
					<th   style="text-align:center;">Trader Name</th>
					<th   colspan="2" style="text-align:center;">Quantity(kg)</th>
					<th></th>
			   		<th></th>
				</tr>
				</table>
				</div>
				</div>
				</div>
				</div>
				</div>
				<center><div id='div' style='position: absolute; top: 100px; left: 140px;'><p ><b>Auction yet to happen hence, no revenue summary is available.</b></p></div></center>
</body>
</html>