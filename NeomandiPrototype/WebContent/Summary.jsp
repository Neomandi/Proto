<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="Error.jsp" pageEncoding="ISO-8859-1" import="com.neomandi.prototype.TradeSummaryBean,com.neomandi.prototype.TraderLoginBean,com.neomandi.prototype.TraderBlockBean,java.util.*" errorPage="Error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image1/png" href="Images/Neomandi1.png">
<title>NeoMandi</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
<link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
 <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
            <script src="js/bootstrap.js" type="text/javascript"></script>
            <script src="js/moment.js" type="text/javascript"></script>
            <script src="js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
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
.autable .table tbody tr td, .lottable .table tbody tr td, .table tbody tr td, .sum2tab .table tbody tr td {
border-top:2px solid #fff !important;
}
.img-responsive {
	height: 60px;
	width: 65px;
}
.tradtab a{
    background-color:#0082B2;
    }
</style>
</head>
<body class="" >
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<%HttpSession tlog=request.getSession(false);
TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");%>
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><p style="font-size:16px; color:white;"><%=tlbn.getTname() %>, welcome to e-auction at NeoMandi.</p></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="logout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li><a href="product.jsp">Product Search</a></li>
    <li><a href="TraderBlock.do">Hold Funds</a></li>
    <li><a href="TradeorAuction.do">Trade</a></li>
    <li><a href="OrderStatus.do">Status</a></li>
	<li class="active"><a href="Summary1.do">Summary</a></li>
    <li><a href="TraderProfile.jsp">My Profile</a></li>
  </ul>
</div>
</div>
</div>   
<div class="container-fluid today">
<div class="container1" style="padding-left:5%"><h4>Today's Summary</h4></div></div>
 <%		
 		HttpSession tradeSummary=request.getSession(false);
		if(tradeSummary.getAttribute("todaysummarymsg")!=null)
		{
			if(tradeSummary.getAttribute("todaysummarymsg")!=null &&tradeSummary.getAttribute("todaysummarymsg").equals("fail"))
			{
			  %><center><h3>YOU HAVE NOT PERFORMED ANY TRADE OPERATIONS TODAY</h3></center>
			  <input type="hidden" id="summary" value="<%=request.getAttribute("todaysummary")%>">
			  <script>
			  var summary=document.getElementById("summary").value;
			  console.log(summary);
			    if(summary=="no")
			    	{
			    	 document.getElementById("summary").style.display='none';
			    	 //document.getElementById("todaypdf").style.display="none";
			    	}
			    else
			    	{
			    	 document.getElementById("summary").style.marginLeft='10px';
			    	}
			  </script>
			  <%} 
			   else if(tradeSummary.getAttribute("todaysummarymsg")!=null && tradeSummary.getAttribute("todaysummarymsg").equals("success"))
			   {
	  %>
<div class="container-fluid sum1 tabin sum1tab  " style="padding-left:0px;padding-right:0px">
<table class="table sum1table" id="basic-table">
<thead class="none"><tr>
	  <td>&nbsp;</td>
	  <td><h4>Lot Number</h4></td>
	  <td><h4>Assigned Lot size</h4></td>
	  <td><h4>Lot Cost</h4></td>
	  <td><h4>Commission Charges</h4></td>
	  <td><h4>Transportation Charges</h4></td>
	  <td><h4>Market Cess</h4></td>
	  <td><h4>My Final cost</h4></td>
	  <td>&nbsp;</td>
	  </tr></thead>
	  <tbody class="clsm10">
	  <tr class="gradeX">	<% 
		HttpSession todaysummary=request.getSession(false);
		List al=(List)todaysummary.getAttribute("todaysummary");
		//request.setAttribute("theList", al);
		for(Object o:al)
		{
			TradeSummaryBean tsb=(TradeSummaryBean)o;%>
	  <td class="whiteclsbc"></td><td><h4><%=tsb.getLotnum() %></h4></td><td><h4><%=tsb.getVolumesold() %></h4></td><td><h4><%=tsb.getLotcost() %></h4></td><td><h4><%=tsb.getCommission() %></h4></td><td><h4>3000</h4></td><td><h4><%=tsb.getMarketcess() %></h4></td><td><h4><%=tsb.getMyfinalcost() %></h4></td>	  <td rowspan="3" style="border-top:0px;background-color:#fff;vertical-align:middle">
      <br><br></tr><%}%></tbody>
	  </table><%}}%>
</div><br>
&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
<td rowspan="3" style="border-top:0px;background-color:#fff;vertical-align:middle;align:center;"><!--  <a id="summary" href="#" class="greenarrowcls" style="margin-left:10px">Get Summary</a>-->
&nbsp; &nbsp; &nbsp;<a id="summary" onclick="update(true)" class="greencls">Export as PDF</a></td>
</tr>
	   </tbody>
	  </table>
</div><!-- 
<div class="container-fluid sum1"  style="display:none">
	  <div class="container1 tabin tsum">
	  <div class="row tfrom">
	  <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
	  <div class="sum1tab table-responsive">
	  <table class="table sum1table">
	  <thead class="none"><tr>
<%/*
if(request.getAttribute("tradesummary")!=null)
{
if(request.getAttribute("tradesummary").equals("no"))
{
  %><b>YOU HAVE NOT MADE ANY TRADE OPERATIONS TODAY</b>
  <%} else if(request.getAttribute("tradesummary").equals("success"))
  {%>
	  <td><h4>Lot </h4></td>
	  <td><h4>Assigned Lot size</h4></td>
	  <td><h4>Lot Cost</h4></td>
	  <td><h4>Commission Charges</h4></td>
	  <td><h4>Transportation Charges</h4></td>
	  <td><h4>Market Cess</h4></td>
	  <td><h4>My Final cost</h4></td>
	  </tr></thead>
	  <tbody>
	  <tr class="gradeX"><% 
		HttpSession todaysummary=request.getSession(false);
		List al=(List)todaysummary.getAttribute("todaysummary");
		//request.setAttribute("theList", al);
		for(Object o:al)
		{
			TradeSummaryBean tsb=(TradeSummaryBean)o;%>
	  <td class="whiteclsbc"></td><td><h4><%=tsb.getLotnum() %></h4></td><td><h4><%=tsb.getVolumesold() %></h4></td><td><h4><%=tsb.getLotcost() %></h4></td><td><h4><%=tsb.getCommission() %></h4></td><td><h4>3000</h4></td><td><h4><%=tsb.getMarketcess() %></h4></td><td><h4><%=tsb.getMyfinalcost() %></h4></td>	  <td rowspan="3" style="border-top:0px;background-color:#fff;vertical-align:middle">
      <br><br></tr><%}%></tbody>
	  </table>
</div>
<%}}*/%></tr>
	   </tbody>
	  </table>
</div></div>
<div class="col-lg-3 col-md-5 col-sm-5 col-xs-12 from">
<table class="table" align="center">
<tr>
   <td></td>
   <td></td>
<td><a id="summary"  href="#" class="reg">Get Summary</a></td>
</tr>
</table>
<table class="table" align="center">
<tr>
   <td></td>
   <td></td>
<td></td>
<td><a id="todaypdf"  href="#" class="reg">Export as PDF</a></td>
</tr>
</table>
</div>
</div>
	  </div>-->
	  </div>
	<div class="container-fluid  history"><div class="container tsum"><h2>History</h2></div></div>
	<div class="container-fluid tfrom">
	<div class="container tsum from">
	<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
	<div align="center">
	<form action = "tradeSummary.do" method = "post" id="myForm">
   <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 clsmr10"><div class='input-group date' id='idfrom'>
                    <input type='text' class="form-control" name="from"/>
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </div>
                </div></div>
   <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 clsmr10"><div class='input-group date' id='idto'>
                    <input type='text' class="form-control" name="to"/>
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </div>
                  </div>
                </div>
<div class="col-lg-2 col-md-2 col-sm-3 col-xs-6 pad"><a  onclick="fun()" class="get1">Get History</a></div>
<div class="col-lg-2 col-md-2 col-sm-3 col-xs-6 pad"><a  onclick="fun2()" id="pdf" class="export">Export as PDF</a></div>
<script>function fun()
{
	document.getElementById("myForm").submit();
}
function fun2()
{
	console.log("inside fun2");
	update1(true)
}
</script>
</div></div>
</div></div>
<%if(request.getAttribute("tradesummary")!=null)
{
if(request.getAttribute("tradesummary").equals("no"))
{
  %><b>YOU HAVE NOT MADE ANY TRADE OPERATIONS BETWEEN THESE DATE</b>
  <%} 
	else if(request.getAttribute("tradesummary").equals("success"))
  	{%>
<div class="container-fluid sum1 tabin sum1tab  " style="padding-left:0px;padding-right:0px">
<table id="basic-table1"  class="table sum1table ">
<thead class="none"><tr>
	  <td>&nbsp;</td>
	  <td><h4>Lot Number</h4></td>
	  <td><h4>Assigned Lot size</h4></td>
	  <td><h4>Lot Cost</h4></td>
	  <td><h4>Commission Charges</h4></td>
	  <td><h4>Transportation Charges</h4></td>
	  <td><h4>Market Cess</h4></td>
	  <td><h4>My Final cost</h4></td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  </tr></thead>
	  <tbody class="clsm10">
	  <tr class="gradeX">
	  	<% 
		HttpSession tradesummary=request.getSession(false);
		List al=(List)tradesummary.getAttribute("tradesummary");
		//request.setAttribute("theList", al);
		for(Object o:al)
		{
			TradeSummaryBean tsb=(TradeSummaryBean)o;%>
	  <td class="whiteclsbc"></td><td><h4><%=tsb.getLotnum() %></h4></td><td><h4><%=tsb.getVolumesold() %></h4></td><td><h4><%=tsb.getLotcost() %></h4></td><td><h4><%=tsb.getCommission() %></h4></td><td><h4>3000</h4></td><td><h4><%=tsb.getMarketcess() %></h4></td><td><h4><%=tsb.getMyfinalcost() %></h4></td>	  <td rowspan="3" style="border-top:0px;background-color:#fff;vertical-align:middle">
      <br><br></tr><%}%></tbody>
	  </table>
</div>
<%}}%>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/moment.js" type="text/javascript"></script>
<script src="js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script type="text/javascript">$(function () {
$('#idfrom').datetimepicker({
                 format: 'DD/MM/YYYY'
           });
$('#idto').datetimepicker({
                 format: 'DD/MM/YYYY'
           });
});
        </script>
        <script src="libs/jspdf.min.js"></script>					
					<script src="libs/jspdf.plugin.autotable.src.js"></script>					
					<script src="js/examples.js"></script>					
					<script>					
					    document.getElementById('todaypdf').onclick = function () {
					        update(true);
					    };
					    document.getElementById('pdf').onclick = function () {
					        update1(true);
					    };
					    function update(shouldDownload) {
					        var funcStr = window.location.hash.replace(/#/g, '') || 'auto';
					        var doc = examples['html']();
					
					        /*doc.setProperties({
					            title: 'Example: ' + funcStr,
					            subject: 'A jspdf-autotable example pdf (' + funcStr + ')'
					        });*/
					
					        if (shouldDownload) {
					            doc.save('TraderSummary.pdf');
					        } else {
					            document.getElementById("output").src = doc.output('datauristring');
					        }
					    }
					    update();
					    function update1(shouldDownload) {
					        var funcStr = window.location.hash.replace(/#/g, '') || 'auto';
					        var doc = examples1['html']();
					
					        /*doc.setProperties({
					            title: 'Example: ' + funcStr,
					            subject: 'A jspdf-autotable example pdf (' + funcStr + ')'
					        });*/
					
					        if (shouldDownload) {
					            doc.save('TraderSummary.pdf');
					        } else {
					            document.getElementById("output").src = doc.output('datauristring');
					        }
					    }
					    update1();
					</script>
</body>
</html>