<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="libs/pure-min.css">
    <link rel="stylesheet" href="libs/grids-responsive-min.css">
	<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pure/0.6.0/grids-responsive-min.css">-->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <style>
    	#div{
    		font-size: 40px;
    		
			padding:30px;
			margin:200px;
			width:70%;
			background-color:#E5E4E2;
				 
    	}
    	.img-responsive{
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

<div class="col-lg-offset-1 col-lg-10 col-sm-offst-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><h1>Admin ,Welcome to E-Auction at NeoMandi.</h1></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href=""><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li class="active"><a href="FarmerMaster.jsp"> Controls </a></li>
  </ul>
</div>
</div>
</div>
<center>
<div class="container" id="div" >

<form action="SchedulerServlet" method="post" name="admin">	
<input type="text" name="starttime" id="starttime" placeholder="10:30:00" style="width:200px; height: 50px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="endtime" id="endtime" placeholder="10:35:00" style="width:200px; height: 50px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name="start" value="Start Auction" class="btn btn-success btn-lg" onClick="fun()" style="width:200px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name="stop" value="Stop Auction" class="btn btn-warning btn-lg" onClick="fun1()" style="width:200px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" name="reset" value="Reset Auction" class="btn btn-primary btn-lg" style="width:200px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</form>

<script>
function fun()
{
	var starttime=document.getElementById("starttime").value;
	 var endtime=document.getElementById("endtime").value;
	  xmlhttp = new XMLHttpRequest();
	  xmlhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) 
	  {
		    				         
	  }};
		  xmlhttp.open("POST", "SchedulerServlet", true);
		  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xmlhttp.send("starttime="+starttime+"&&endtime="+endtime);
}

function fun1()
{
	var stop = 1;
	  xmlhttp = new XMLHttpRequest();
	  xmlhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) 
	  {
		    				         
	  }};
		  xmlhttp.open("POST", "PostAuctionOperationServlet", true);
		  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xmlhttp.send("stopauction="+stop);
}
</script>
</div></center>
</div>
</body>
</html>